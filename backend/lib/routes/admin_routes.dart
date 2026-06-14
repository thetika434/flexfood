import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

const _adminToken = 'flexfood-admin-secret-2024';

Middleware adminMiddleware() {
  return (Handler handler) => (Request req) async {
    final entete = req.headers['authorization'] ?? '';
    if (entete != 'Bearer $_adminToken') {
      return Response(401,
          body: jsonEncode({'erreur': 'Accès refusé'}),
          headers: {'content-type': 'application/json'});
    }
    return handler(req);
  };
}

Router adminRoutes(PrismaClient prisma) {
  final router = Router();

  // GET /admin/etudiants
  router.get('/etudiants', (Request req) async {
    final etudiants = await prisma.etudiant.findMany(
      orderBy: PrismaUnion.$2(
        EtudiantOrderByWithRelationInput(matricule: SortOrder.asc),
      ),
    );
    return Response.ok(
      jsonEncode(etudiants.map((e) => {
        'matricule': e.matricule,
        'nom': e.nom,
        'prenom': e.prenom,
        'solde': e.solde,
        'codeQr': e.codeQr,
      }).toList()),
      headers: {'content-type': 'application/json'},
    );
  });

  // GET /admin/transactions
  router.get('/transactions', (Request req) async {
    final transactions = await prisma.transaction.findMany(
      orderBy: PrismaUnion.$2(
        TransactionOrderByWithRelationInput(dateHeure: SortOrder.desc),
      ),
      include: TransactionInclude(etudiant: PrismaUnion.$1(true)),
    );
    return Response.ok(
      jsonEncode(transactions.map((t) => {
        'id': t.id,
        'type': t.type,
        'montant': t.montant,
        'dateHeure': t.dateHeure?.toIso8601String(),
        'service': t.service,
        'autrePartiMatricule': t.autrePartiMatricule,
        'etudiant': {
          'matricule': t.etudiant?.matricule,
          'nom': t.etudiant?.nom,
          'prenom': t.etudiant?.prenom,
        },
      }).toList()),
      headers: {'content-type': 'application/json'},
    );
  });

  // GET /admin/agents
  router.get('/agents', (Request req) async {
    final agents = await prisma.agent.findMany();
    return Response.ok(
      jsonEncode(agents.map((a) => {
        'nom': a.nom,
        'prenom': a.prenom,
        'poste': a.poste,
      }).toList()),
      headers: {'content-type': 'application/json'},
    );
  });

  return router;
}
