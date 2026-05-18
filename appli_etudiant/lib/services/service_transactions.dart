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
      'Authorization': 'Bearer ${token ?? ''}',
    };
  }

  static Future<List<Transaction>> obtenirTransactions() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/transactions/'),
      headers: await _entetes(),
    );

    if (reponse.statusCode != 200) return [];
    final liste = jsonDecode(reponse.body) as List;
    return liste
        .map((j) => Transaction.fromJson(j as Map<String, dynamic>))
        .toList();
  }

  static Future<List<Transaction>> obtenirDernieresTransactions(
      {int nombre = 4}) async {
    final liste = await obtenirTransactions();
    return liste.take(nombre).toList();
  }

  // Les favoris ne sont pas encore dans le backend
  static List<Favori> obtenirFavoris() => [];

  static Future<Etudiant?> chercherEtudiantParMatricule(
      String matricule) async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/etudiants/$matricule'),
      headers: await _entetes(),
    );

    if (reponse.statusCode != 200) return null;

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    return Etudiant(
      matricule: data['matricule'] as String,
      nom: data['nom'] as String,
      prenom: data['prenom'] as String,
      solde: 0,
      codeQR: '',
    );
  }

  // Lance une exception si solde insuffisant ou autre erreur
  static Future<Transaction> effectuerTransfert(
      String matriculeDestinataire, int montant) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/transactions/transfert'),
      headers: await _entetes(),
      body: jsonEncode({
        'matricule_destinataire': matriculeDestinataire,
        'montant': montant,
      }),
    );

    if (reponse.statusCode == 422) throw Exception('Solde insuffisant');
    if (reponse.statusCode == 400) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      throw Exception(data['erreur'] ?? 'Montant invalide');
    }
    if (reponse.statusCode != 200) throw Exception('Erreur serveur');

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    _rafraichirSolde(); // fire-and-forget, le tableau de bord actualise à son retour
    return Transaction.fromJson(data);
  }

  static Future<void> _rafraichirSolde() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/etudiants/moi'),
      headers: await _entetes(),
    );

    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      final nouveauSolde = data['solde'] as int;
      Session.etudiantConnecte?.solde = nouveauSolde;
      await ServiceStockageLocal.sauvegarderEtudiantJson(jsonEncode(data));
    }
  }

  // Appelé au chargement du tableau de bord pour avoir le solde à jour
  static Future<void> rafraichirEtudiant() => _rafraichirSolde();
}
