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

  // Lance une exception si les identifiants sont incorrects
  static Future<Etudiant> connecter(
      String matricule, String codeSecret) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/auth/connexion'),
      headers: {'Content-Type': 'application/json'},
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

    Session.etudiantConnecte = etudiant;
    await ServiceStockageLocal.sauvegarderToken(token);
    await ServiceStockageLocal.sauvegarderMatricule(etudiant.matricule);
    await ServiceStockageLocal.sauvegarderEtudiantJson(jsonEncode(etudiantJson));

    return etudiant;
  }

  // Retourne true si le PIN est correct, false sinon
  // Lance une exception si la session est expirée
  static Future<bool> verifierPin(String pin) async {
    final token = await ServiceStockageLocal.recupererToken();
    if (token == null) throw Exception('Session expirée');

    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/auth/verifier-pin'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'code_secret': pin}),
    );

    if (reponse.statusCode == 401) throw Exception('Session expirée');

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    return data['valide'] as bool;
  }

  // Retourne true si le changement a réussi
  static Future<bool> changerCodeSecret(
      String ancien, String nouveau, String confirmation) async {
    if (nouveau != confirmation) return false;
    if (!RegExp(r'^\d{4}$').hasMatch(nouveau)) return false;

    final token = await ServiceStockageLocal.recupererToken();
    if (token == null) return false;

    final reponse = await http.put(
      Uri.parse('${Config.urlBackend}/auth/changer-code'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'ancien_code': ancien, 'nouveau_code': nouveau}),
    );

    return reponse.statusCode == 200;
  }

  static bool estPremiereConnexion() {
    return Session.etudiantConnecte?.premiereConnexion ?? false;
  }

  static void deconnecter() {
    Session.etudiantConnecte = null;
    ServiceStockageLocal.toutEffacer();
  }
}
