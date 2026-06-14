import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class EtudiantAdmin {
  final String matricule, nom, prenom;
  final int solde;
  EtudiantAdmin({required this.matricule, required this.nom, required this.prenom, required this.solde});
  String get nomComplet => '$prenom $nom';
  String get initiales => '${prenom[0]}${nom[0]}';
  factory EtudiantAdmin.fromJson(Map<String, dynamic> j) => EtudiantAdmin(
    matricule: j['matricule'] as String,
    nom: j['nom'] as String,
    prenom: j['prenom'] as String,
    solde: j['solde'] as int,
  );
}

class TransactionAdmin {
  final String id, type;
  final int montant;
  final DateTime date;
  final String nomEtudiant, matricule;
  TransactionAdmin({required this.id, required this.type, required this.montant,
    required this.date, required this.nomEtudiant, required this.matricule});
  factory TransactionAdmin.fromJson(Map<String, dynamic> j) {
    final etudiant = j['etudiant'] as Map<String, dynamic>?;
    return TransactionAdmin(
      id: j['id'] as String,
      type: j['type'] as String,
      montant: (j['montant'] as int).abs(),
      date: DateTime.parse(j['dateHeure'] as String),
      nomEtudiant: '${etudiant?['prenom']} ${etudiant?['nom']}',
      matricule: etudiant?['matricule'] as String? ?? '',
    );
  }
}

class AgentAdmin {
  final String nom, prenom, poste;
  AgentAdmin({required this.nom, required this.prenom, required this.poste});
  String get nomComplet => '$prenom $nom';
  String get initiales => '${prenom[0]}${nom[0]}';
  factory AgentAdmin.fromJson(Map<String, dynamic> j) => AgentAdmin(
    nom: j['nom'] as String,
    prenom: j['prenom'] as String,
    poste: j['poste'] as String? ?? 'Agent',
  );
}

class ServiceAdmin {
  ServiceAdmin._();

  static String? _token;

  static Map<String, String> get _entetes => {
    'Content-Type': 'application/json',
    if (_token != null) 'Authorization': 'Bearer $_token',
  };

  static Future<bool> connecter(String login, String motDePasse) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/admin/connexion'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'login': login, 'mot_de_passe': motDePasse}),
    );
    if (reponse.statusCode != 200) return false;
    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    _token = data['token'] as String;
    return true;
  }

  static Future<List<EtudiantAdmin>> obtenirEtudiants() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/admin/etudiants'),
      headers: _entetes,
    );
    if (reponse.statusCode != 200) return [];
    final liste = jsonDecode(reponse.body) as List<dynamic>;
    return liste.map((e) => EtudiantAdmin.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Future<List<TransactionAdmin>> obtenirTransactions() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/admin/transactions'),
      headers: _entetes,
    );
    if (reponse.statusCode != 200) return [];
    final liste = jsonDecode(reponse.body) as List<dynamic>;
    return liste.map((e) => TransactionAdmin.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Future<List<AgentAdmin>> obtenirAgents() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/admin/agents'),
      headers: _entetes,
    );
    if (reponse.statusCode != 200) return [];
    final liste = jsonDecode(reponse.body) as List<dynamic>;
    return liste.map((e) => AgentAdmin.fromJson(e as Map<String, dynamic>)).toList();
  }

  static void deconnecter() => _token = null;
}
