import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/services/service_etudiants.dart';
import 'package:backend/middlewares/auth_middleware.dart';

Router etudiantRoutes(ServiceEtudiants serviceEtudiants) {
  final router = Router();

  router.get('/favoris', (Request req) async {
    final etudiantId = req.etudiantId;
    final favoris = await serviceEtudiants.obtenirFavoris(etudiantId);
    return Response.ok(
      jsonEncode(favoris),
      headers: {'content-type': 'application/json'},
    );
  });

  router.get('/moi', (Request req) async {
    final etudiantId = req.etudiantId;
    final profil = await serviceEtudiants.obtenirProfil(etudiantId);

    if (profil == null) {
      return Response(
        404,
        body: jsonEncode({'erreur': 'Étudiant introuvable'}),
        headers: {'content-type': 'application/json'},
      );
    }

    return Response.ok(
      jsonEncode(profil),
      headers: {'content-type': 'application/json'},
    );
  });

  router.get('/<matricule>', (Request req, String matricule) async {
    final resultat = await serviceEtudiants.chercherParMatricule(matricule);

    if (resultat == null) {
      return Response(
        404,
        body: jsonEncode({'erreur': 'Étudiant introuvable'}),
        headers: {'content-type': 'application/json'},
      );
    }

    return Response.ok(
      jsonEncode(resultat),
      headers: {'content-type': 'application/json'},
    );
  });

  return router;
}
