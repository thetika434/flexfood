import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'service_stockage_local.dart';
import 'service_authentification.dart';

class ServiceWebSocket {
  ServiceWebSocket._();

  static WebSocketChannel? _canal;
  static StreamSubscription? _abonnement;
  static void Function(int nouveauSolde)? _onSolde;
  static bool _actif = false;

  static void onMajSolde(void Function(int) callback) {
    _onSolde = callback;
  }

  static Future<void> connecter(String urlBackend) async {
    if (_actif) return;
    final token = await ServiceStockageLocal.recupererToken();
    if (token == null) return;

    // Remplace http:// par ws://
    final urlWs = '${urlBackend.replaceFirst(RegExp(r'^http'), 'ws')}/ws';

    try {
      _canal = WebSocketChannel.connect(Uri.parse(urlWs));
      _actif = true;

      // Envoyer le token pour s'authentifier
      _canal!.sink.add(jsonEncode({'token': token}));

      _abonnement = _canal!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message as String) as Map<String, dynamic>;
            final type = data['type'] as String?;

            if (type == 'connecte' || type == 'maj_solde') {
              final solde = data['solde'] as int?;
              if (solde != null) {
                // Mettre à jour le solde local directement
                Session.etudiantConnecte?.solde = solde;
                _onSolde?.call(solde);
              }
            }
          } catch (_) {}
        },
        onDone: () {
          _actif = false;
          // Reconnexion automatique après 5 secondes
          Future.delayed(const Duration(seconds: 5), () => connecter(urlBackend));
        },
        onError: (_) {
          _actif = false;
        },
        cancelOnError: true,
      );
    } catch (_) {
      _actif = false;
    }
  }

  static void deconnecter() {
    _actif = false;
    _abonnement?.cancel();
    _canal?.sink.close();
    _canal = null;
    _abonnement = null;
    _onSolde = null;
  }
}
