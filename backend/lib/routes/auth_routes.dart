import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/services/service_auth.dart';

int? _extraireId(Request req) {
  final entete = req.headers['authorization'] ?? '';
  if (!entete.startsWith('Bearer ')) return null;
  return ServiceAuth.extraireEtudiantId(entete.substring(7));
}

Router authRoutes(ServiceAuth serviceAuth) {
  final router = Router();

  router.post('/connexion', (Request req) async {
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final matricule = corps['matricule'] as String?;
    final codeSecret = corps['code_secret'] as String?;

    if (matricule == null || codeSecret == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'matricule et code_secret requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    final resultat = await serviceAuth.connexion(matricule, codeSecret);
    if (resultat == null) {
      return Response(
        401,
        body: jsonEncode({'erreur': 'Matricule ou code secret incorrect'}),
        headers: {'content-type': 'application/json'},
      );
    }

    return Response.ok(
      jsonEncode(resultat),
      headers: {'content-type': 'application/json'},
    );
  });

  router.post('/verifier-pin', (Request req) async {
    final etudiantId = _extraireId(req);
    if (etudiantId == null) {
      return Response(401,
          body: jsonEncode({'erreur': 'Token manquant ou invalide'}),
          headers: {'content-type': 'application/json'});
    }
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final codeSecret = corps['code_secret'] as String?;

    if (codeSecret == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'code_secret requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    final valide = await serviceAuth.verifierPin(etudiantId, codeSecret);
    return Response.ok(
      jsonEncode({'valide': valide}),
      headers: {'content-type': 'application/json'},
    );
  });

  router.put('/changer-code', (Request req) async {
    final etudiantId = _extraireId(req);
    if (etudiantId == null) {
      return Response(401,
          body: jsonEncode({'erreur': 'Token manquant ou invalide'}),
          headers: {'content-type': 'application/json'});
    }
    final corps = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
    final ancienCode = corps['ancien_code'] as String?;
    final nouveauCode = corps['nouveau_code'] as String?;

    if (ancienCode == null || nouveauCode == null) {
      return Response(
        400,
        body: jsonEncode({'erreur': 'ancien_code et nouveau_code requis'}),
        headers: {'content-type': 'application/json'},
      );
    }

    final succes = await serviceAuth.changerCode(
      etudiantId,
      ancienCode,
      nouveauCode,
    );

    if (!succes) {
      return Response(
        401,
        body: jsonEncode({'erreur': 'Ancien code incorrect'}),
        headers: {'content-type': 'application/json'},
      );
    }

    return Response.ok(
      jsonEncode({'succes': true}),
      headers: {'content-type': 'application/json'},
    );
  });

  return router;
}
