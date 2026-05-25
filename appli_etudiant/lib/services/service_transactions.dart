import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modeles/etudiant.dart';
import '../modeles/transaction.dart';
import '../modeles/favori.dart';
import '../config.dart';
import 'service_authentification.dart';
import 'service_stockage_local.dart';

class ServiceTransactions {
  ServiceTransactions._();

  static Future<Map<String, String>> _entetes() async {
    final token = await ServiceStockageLocal.recupererToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<List<Transaction>> obtenirTransactions() async {
    final entetes = await _entetes();
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/transactions/'),
      headers: entetes,
    );

    if (reponse.statusCode != 200) {
      throw Exception('Impossible de charger les transactions');
    }

    final liste = jsonDecode(reponse.body) as List<dynamic>;
    return liste
        .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<Transaction>> obtenirDernieresTransactions({int nombre = 4}) async {
    final liste = await obtenirTransactions();
    return liste.take(nombre).toList();
  }

  static List<Favori> obtenirFavoris() => [];

  static Future<Etudiant?> chercherEtudiantParMatricule(String matricule) async {
    final entetes = await _entetes();
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/etudiants/$matricule'),
      headers: entetes,
    );

    if (reponse.statusCode == 404) return null;
    if (reponse.statusCode != 200) return null;

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    return Etudiant(
      matricule: data['matricule'] as String,
      nom: data['nom'] as String,
      prenom: data['prenom'] as String,
      solde: data['solde'] as int? ?? 0,
      codeQR: data['codeQr'] as String? ?? '',
    );
  }

  static Future<Transaction> effectuerTransfert(
      String matriculeDestinataire, int montant) async {
    final etudiant = Session.etudiantConnecte;
    if (etudiant == null) throw Exception('Session expirée');

    final entetes = await _entetes();
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/transactions/transfert'),
      headers: entetes,
      body: jsonEncode({
        'matricule_destinataire': matriculeDestinataire,
        'montant': montant,
      }),
    );

    if (reponse.statusCode == 422) throw Exception('Solde insuffisant');
    if (reponse.statusCode == 400) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      throw Exception(data['erreur'] ?? 'Erreur lors du transfert');
    }
    if (reponse.statusCode != 200) {
      throw Exception('Erreur serveur (${reponse.statusCode})');
    }

    await rafraichirEtudiant();

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    return Transaction.fromJson(data);
  }

  static Future<void> rafraichirEtudiant() async {
    final entetes = await _entetes();
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/etudiants/moi'),
      headers: entetes,
    );

    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      final etudiant = Session.etudiantConnecte;
      if (etudiant != null) {
        etudiant.solde = data['solde'] as int? ?? etudiant.solde;
      }
    }
  }
}
