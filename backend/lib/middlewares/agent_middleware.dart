import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:backend/services/service_agent.dart';

Middleware agentMiddleware() {
  return (Handler inner) {
    return (Request req) async {
      final entete = req.headers['authorization'] ?? '';
      if (!entete.startsWith('Bearer ')) {
        return Response(
          401,
          body: jsonEncode({'erreur': 'Token agent manquant'}),
          headers: {'content-type': 'application/json'},
        );
      }
      final token = entete.substring(7);
      if (!ServiceAgent.verifierToken(token)) {
        return Response(
          401,
          body: jsonEncode({'erreur': 'Token agent invalide ou expiré'}),
          headers: {'content-type': 'application/json'},
        );
      }
      return inner(req);
    };
  };
}
