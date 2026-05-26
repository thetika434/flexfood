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
  static final List<void Function()> _onTransactions = [];

  static bool _actif = false;
  static bool _deconnexionVoulue = false;
  static String? _urlBackendMemorise;
  static Timer? _timerReconnexion;
  static int _tentative = 0;

  static void onMajSolde(void Function(int) callback) {
    _onSolde = callback;
  }

  static void ajouterEcouteurTransactions(void Function() callback) {
    if (!_onTransactions.contains(callback)) _onTransactions.add(callback);
  }

  static void retirerEcouteurTransactions(void Function() callback) {
    _onTransactions.remove(callback);
  }

  static Future<void> connecter(String urlBackend) async {
    if (_actif) return;
    _urlBackendMemorise = urlBackend;
    _deconnexionVoulue = false;
    await _tenterConnexion();
  }

  static Future<void> _tenterConnexion() async {
    if (_actif || _deconnexionVoulue) return;

    final token = await ServiceStockageLocal.recupererToken();
    if (token == null) return;

    final urlWs = '${_urlBackendMemorise!.replaceFirst(RegExp(r'^http'), 'ws')}/ws';

    try {
      _canal = WebSocketChannel.connect(Uri.parse(urlWs));
      _actif = true;
      _tentative = 0;

      _canal!.sink.add(jsonEncode({'token': token}));

      _abonnement = _canal!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message as String) as Map<String, dynamic>;
            final type = data['type'] as String?;
            if (type == 'connecte' || type == 'maj_solde') {
              final solde = data['solde'] as int?;
              if (solde != null) {
                Session.etudiantConnecte?.solde = solde;
                _onSolde?.call(solde);
                for (final cb in List.of(_onTransactions)) { cb(); }
              }
            }
          } catch (_) {}
        },
        onDone: () => _planifierReconnexion(),
        onError: (_) => _planifierReconnexion(),
        cancelOnError: true,
      );
    } catch (_) {
      _actif = false;
      _planifierReconnexion();
    }
  }

  static void _planifierReconnexion() {
    _actif = false;
    _abonnement?.cancel();
    _abonnement = null;
    if (_deconnexionVoulue) return;

    // Backoff exponentiel : 2s, 4s, 8s, 16s, 32s … plafonné à 60s
    _tentative++;
    final delai = Duration(seconds: (2 << (_tentative - 1)).clamp(2, 60));
    _timerReconnexion?.cancel();
    _timerReconnexion = Timer(delai, _tenterConnexion);
  }

  static void deconnecter() {
    _deconnexionVoulue = true;
    _actif = false;
    _tentative = 0;
    _timerReconnexion?.cancel();
    _timerReconnexion = null;
    _abonnement?.cancel();
    _canal?.sink.close();
    _canal = null;
    _abonnement = null;
    _onSolde = null;
  }
}
