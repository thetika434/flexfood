import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:backend/services/service_auth.dart';

Middleware authMiddleware() {
  return (Handler suivant) {
    return (Request requete) async {
      final entete = requete.headers['authorization'] ?? '';
      if (!entete.startsWith('Bearer ')) {
        return Response(
          401,
          body: jsonEncode({'erreur': 'Token manquant'}),
          headers: {'content-type': 'application/json'},
        );
      }

      final token = entete.substring(7);
      final etudiantId = ServiceAuth.extraireEtudiantId(token);

      if (etudiantId == null) {
        return Response(
          401,
          body: jsonEncode({'erreur': 'Token invalide ou expiré'}),
          headers: {'content-type': 'application/json'},
        );
      }

      final requeteAvecId = requete.change(
        context: {'etudiantId': etudiantId},
      );
      return suivant(requeteAvecId);
    };
  };
}

extension RequeteAuth on Request {
  int get etudiantId => context['etudiantId'] as int;
}
