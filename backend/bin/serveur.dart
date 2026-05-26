import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/services/service_auth.dart';
import 'package:backend/services/service_etudiants.dart';
import 'package:backend/services/service_transactions.dart';
import 'package:backend/services/service_agent.dart';
import 'package:backend/routes/auth_routes.dart';
import 'package:backend/routes/etudiant_routes.dart';
import 'package:backend/routes/transaction_routes.dart';
import 'package:backend/routes/agent_routes.dart';
import 'package:backend/routes/admin_routes.dart';
import 'package:backend/middlewares/auth_middleware.dart';
import 'package:backend/middlewares/agent_middleware.dart';
import 'package:backend/websocket/gestionnaire_ws.dart';

Middleware _corsMiddleware() {
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
  return (Handler handler) => (Request req) async {
    if (req.method == 'OPTIONS') {
      return Response.ok('', headers: headers);
    }
    final res = await handler(req);
    return res.change(headers: headers);
  };
}

void main() async {
  final prisma = PrismaClient(
    datasourceUrl:
        'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  final serviceAuth = ServiceAuth(prisma);
  final serviceEtudiants = ServiceEtudiants(prisma);
  final serviceTransactions = ServiceTransactions(prisma);
  final serviceAgentSvc = ServiceAgent(prisma);

  final mwEtudiant = authMiddleware();
  final mwAgent = agentMiddleware();
  final routeurPrincipal = Router();

  // Route admin connexion (publique)
  routeurPrincipal.post('/admin/connexion', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final login = corps['login'] as String?;
    final mdp = corps['mot_de_passe'] as String?;
    if (login == 'admin' && mdp == '1234') {
      return Response.ok(
        jsonEncode({'token': 'flexfood-admin-secret-2024'}),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(401,
        body: jsonEncode({'erreur': 'Identifiants incorrects'}),
        headers: {'content-type': 'application/json'});
  });

  // Routes admin protégées
  routeurPrincipal.mount(
    '/admin/',
    Pipeline()
        .addMiddleware(adminMiddleware())
        .addHandler(adminRoutes(prisma).call),
  );

  // ── WebSocket — solde temps réel ──────────────────────────────────────────
  // Connexion : ws://host:8080/ws?token=<jwt_etudiant>
  routeurPrincipal.get('/ws', webSocketHandler((WebSocketChannel canal, String? _) {
    int? etudiantId;

    canal.stream.listen(
      (message) async {
        if (etudiantId != null) return; // déjà authentifié
        try {
          final data = jsonDecode(message as String) as Map<String, dynamic>;
          final token = data['token'] as String?;
          if (token == null) {
            canal.sink.add(jsonEncode({'type': 'erreur', 'message': 'token requis'}));
            return;
          }
          final etudiant = await serviceAuth.etudiantDepuisToken(token);
          if (etudiant == null) {
            canal.sink.add(jsonEncode({'type': 'erreur', 'message': 'token invalide'}));
            canal.sink.close();
            return;
          }
          etudiantId = etudiant['id'] as int;
          GestionnaireWS.enregistrer(etudiantId!, canal);
          canal.sink.add(jsonEncode({'type': 'connecte', 'solde': etudiant['solde']}));
          print('[WS] Étudiant ${etudiant['matricule']} connecté (${GestionnaireWS.nbConnexions} connexions actives)');
        } catch (_) {
          canal.sink.add(jsonEncode({'type': 'erreur', 'message': 'message invalide'}));
        }
      },
      onDone: () {
        if (etudiantId != null) {
          GestionnaireWS.desinscrire(etudiantId!);
          print('[WS] Étudiant $etudiantId déconnecté (${GestionnaireWS.nbConnexions} connexions actives)');
        }
      },
    );
  }));

  // Routes auth étudiants (publiques)
  routeurPrincipal.mount('/auth/', authRoutes(serviceAuth).call);

  // Connexion agent (publique — pas de middleware)
  routeurPrincipal.post('/agent/connexion', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final codeSecret = corps['code_secret'] as String?;
    if (codeSecret == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'code_secret requis'}),
        headers: {'content-type': 'application/json'},
      );
    }
    final resultat = await serviceAgentSvc.connexion(codeSecret);
    if (resultat == null) {
      return Response(
        401,
        body: jsonEncode({'erreur': 'Code secret incorrect'}),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response.ok(
      jsonEncode(resultat),
      headers: {'content-type': 'application/json'},
    );
  });

  // Routes agent protégées (repas, rechargement, bilan)
  routeurPrincipal.mount(
    '/agent/',
    Pipeline()
        .addMiddleware(mwAgent)
        .addHandler(agentRoutes(serviceAgentSvc).call),
  );

  // Routes protégées étudiants
  routeurPrincipal.mount(
    '/etudiants/',
    Pipeline()
        .addMiddleware(mwEtudiant)
        .addHandler(etudiantRoutes(serviceEtudiants).call),
  );
  routeurPrincipal.mount(
    '/transactions/',
    Pipeline()
        .addMiddleware(mwEtudiant)
        .addHandler(transactionRoutes(serviceTransactions).call),
  );

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(_corsMiddleware())
      .addHandler(routeurPrincipal.call);

  final serveur = await io.serve(pipeline, InternetAddress.anyIPv4, 8080);
  print('Serveur FlexFood démarré sur http://localhost:${serveur.port}');
}
