import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modeles/etudiant.dart';
import '../config.dart';
import 'service_stockage_local.dart';

class Session {
  static Etudiant? etudiantConnecte;
}

class ServiceAuthentification {
  ServiceAuthentification._();

  static Map<String, String> get _entetes => {'Content-Type': 'application/json'};

  static Future<Map<String, String>> _entetesBearear() async {
    final token = await ServiceStockageLocal.recupererToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Etudiant> connecter(String matricule, String codeSecret) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/auth/connexion'),
      headers: _entetes,
      body: jsonEncode({'matricule': matricule, 'code_secret': codeSecret}),
    );

    if (reponse.statusCode == 401) {
      throw Exception('Matricule ou code secret incorrect');
    }
    if (reponse.statusCode != 200) {
      throw Exception('Erreur serveur (${reponse.statusCode})');
    }

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    final token = data['token'] as String;
    final etudiantJson = data['etudiant'] as Map<String, dynamic>;

    final etudiant = Etudiant.fromJson(etudiantJson);

    await ServiceStockageLocal.sauvegarderToken(token);
    await ServiceStockageLocal.sauvegarderMatricule(etudiant.matricule);
    await ServiceStockageLocal.sauvegarderPin(codeSecret);

    Session.etudiantConnecte = etudiant;
    return etudiant;
  }

  static Future<bool> verifierPin(String pin) async {
    final pinLocal = await ServiceStockageLocal.recupererPin();
    return pinLocal == pin;
  }

  static Future<bool> changerCodeSecret(
      String ancien, String nouveau, String confirmation) async {
    if (nouveau != confirmation) return false;
    if (!RegExp(r'^\d{4}$').hasMatch(nouveau)) return false;

    final entetes = await _entetesBearear();
    final reponse = await http.put(
      Uri.parse('${Config.urlBackend}/auth/changer-code'),
      headers: entetes,
      body: jsonEncode({'ancien_code': ancien, 'nouveau_code': nouveau}),
    );

    if (reponse.statusCode == 200) {
      await ServiceStockageLocal.sauvegarderPin(nouveau);
    }
    return reponse.statusCode == 200;
  }

  static bool estPremiereConnexion() =>
      Session.etudiantConnecte?.premiereConnexion ?? false;

  static void deconnecter() {
    Session.etudiantConnecte = null;
    ServiceStockageLocal.toutEffacer();
  }
}
