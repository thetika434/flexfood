import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/services/service_transactions.dart';
import 'package:backend/middlewares/auth_middleware.dart';

Router transactionRoutes(ServiceTransactions serviceTransactions) {
  final router = Router();

  router.get('/', (Request req) async {
    final etudiantId = req.etudiantId;
    final transactions = await serviceTransactions.obtenirHistorique(
      etudiantId,
    );

    return Response.ok(
      jsonEncode(transactions),
      headers: {'content-type': 'application/json'},
    );
  });

  router.post('/transfert', (Request req) async {
    final etudiantId = req.etudiantId;
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final matriculeDestinataire = corps['matricule_destinataire'] as String?;
    final montant = corps['montant'] as int?;

    if (matriculeDestinataire == null || montant == null || montant <= 0) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'matricule_destinataire et montant requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    if (montant % 100 != 0) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'Le montant doit être un multiple de 100 FCFA'}),
        headers: {'content-type': 'application/json'},
      );
    }

    try {
      final transaction = await serviceTransactions.effectuerTransfert(
        etudiantId,
        matriculeDestinataire,
        montant,
      );
      return Response.ok(
        jsonEncode(transaction),
        headers: {'content-type': 'application/json'},
      );
    } on SoldeInsuffisantException {
      return Response(
        422,
        body: jsonEncode({'erreur': 'Solde insuffisant'}),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response(
        400,
        body: jsonEncode({'erreur': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  return router;
}
