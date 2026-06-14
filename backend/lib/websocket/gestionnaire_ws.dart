import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class GestionnaireWS {
  GestionnaireWS._();

  static final Map<int, WebSocketChannel> _connexions = {};

  static void enregistrer(int etudiantId, WebSocketChannel canal) {
    _connexions[etudiantId]?.sink.close();
    _connexions[etudiantId] = canal;
  }

  static void desinscrire(int etudiantId) {
    _connexions.remove(etudiantId);
  }

  static void notifierSolde(int etudiantId, int nouveauSolde) {
    final canal = _connexions[etudiantId];
    if (canal != null) {
      canal.sink.add(jsonEncode({'type': 'maj_solde', 'solde': nouveauSolde}));
    }
  }

  static int get nbConnexions => _connexions.length;
}
