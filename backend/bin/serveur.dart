import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/services/service_auth.dart';
import 'package:backend/services/service_etudiants.dart';
import 'package:backend/services/service_transactions.dart';
import 'package:backend/services/service_agent.dart';
import 'package:backend/routes/auth_routes.dart';
import 'package:backend/routes/etudiant_routes.dart';
import 'package:backend/routes/transaction_routes.dart';
import 'package:backend/routes/agent_routes.dart';
import 'package:backend/middlewares/auth_middleware.dart';
import 'package:backend/middlewares/agent_middleware.dart';

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

  // Routes auth étudiants (publiques)
  routeurPrincipal.mount('/auth/', authRoutes(serviceAuth).call);

  // Connexion agent (publique — pas de middleware)
  routeurPrincipal.post('/agent/connexion', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final codeSecret = corps['code_secret'] as String?;
    if (codeSecret == null) {
      return Response(400,
          body: jsonEncode({'erreur': 'code_secret requis'}),
          headers: {'content-type': 'application/json'});
    }
    final resultat = await serviceAgentSvc.connexion(codeSecret);
    if (resultat == null) {
      return Response(401,
          body: jsonEncode({'erreur': 'Code secret incorrect'}),
          headers: {'content-type': 'application/json'});
    }
    return Response.ok(jsonEncode(resultat),
        headers: {'content-type': 'application/json'});
  });

  // Routes agent protégées (repas, rechargement, bilan)
  routeurPrincipal.mount(
    '/agent/',
    Pipeline().addMiddleware(mwAgent).addHandler(
      agentRoutes(serviceAgentSvc).call,
    ),
  );

  // Routes protégées étudiants
  routeurPrincipal.mount(
    '/etudiants/',
    Pipeline().addMiddleware(mwEtudiant).addHandler(
      etudiantRoutes(serviceEtudiants).call,
    ),
  );
  routeurPrincipal.mount(
    '/transactions/',
    Pipeline().addMiddleware(mwEtudiant).addHandler(
      transactionRoutes(serviceTransactions).call,
    ),
  );

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(routeurPrincipal.call);

  final serveur = await io.serve(pipeline, InternetAddress.anyIPv4, 8080);
  print('Serveur FlexFood démarré sur http://localhost:${serveur.port}');
}
