import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/services/service_agent.dart';

Router agentRoutes(ServiceAgent serviceAgent) {
  final router = Router();

  // POST /agent/repas — scanner QR pour débiter un repas
  router.post('/repas', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final codeQr = corps['code_qr'] as String?;

    if (codeQr == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'code_qr requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    try {
      final resultat = await serviceAgent.effectuerRepas(codeQr);
      return Response.ok(
        jsonEncode(resultat),
        headers: {'content-type': 'application/json'},
      );
    } on InvalidQrException {
      return Response(
        400,
        body: jsonEncode({'erreur': 'QR code FlexFood invalide'}),
        headers: {'content-type': 'application/json'},
      );
    } on HorsCreneauException {
      return Response(
        403,
        body: jsonEncode({'erreur': 'Aucun créneau repas actif en ce moment'}),
        headers: {'content-type': 'application/json'},
      );
    } on EtudiantIntrouvableException {
      return Response(
        404,
        body: jsonEncode({'erreur': 'Étudiant introuvable'}),
        headers: {'content-type': 'application/json'},
      );
    } on SoldeInsuffisantException {
      return Response(
        422,
        body: jsonEncode({'erreur': 'Solde insuffisant'}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // POST /agent/rechargement — recharger le compte d'un étudiant
  router.post('/rechargement', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final matricule = corps['matricule'] as String?;
    final montant = corps['montant'] as int?;

    if (matricule == null || montant == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'matricule et montant requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    if (montant <= 0 || montant % 100 != 0) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'Le montant doit être un multiple de 100 FCFA'}),
        headers: {'content-type': 'application/json'},
      );
    }

    try {
      final resultat = await serviceAgent.effectuerRechargement(matricule, montant);
      return Response.ok(
        jsonEncode(resultat),
        headers: {'content-type': 'application/json'},
      );
    } on EtudiantIntrouvableException {
      return Response(
        404,
        body: jsonEncode({'erreur': 'Étudiant introuvable'}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // GET /agent/bilan — transactions de la journée
  router.get('/bilan', (Request req) async {
    final bilan = await serviceAgent.obtenirBilan();
    return Response.ok(
      jsonEncode(bilan),
      headers: {'content-type': 'application/json'},
    );
  });

  return router;
}
