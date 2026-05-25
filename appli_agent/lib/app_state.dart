import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models.dart';
import 'config.dart';

class AppState extends ChangeNotifier {
  bool _loggedIn = false;
  String _agentNom = '';
  bool _scannerEnabled = true;
  List<Transaction> _transactions = [];
  String? _token;

  bool get loggedIn => _loggedIn;
  String get agentNom => _agentNom;
  bool get scannerEnabled => _scannerEnabled;
  List<Transaction> get transactions => _transactions;

  Map<String, String> get _entetes => {
    'Content-Type': 'application/json',
    if (_token != null) 'Authorization': 'Bearer $_token',
  };

  void setScannerEnabled(bool value) {
    _scannerEnabled = value;
    notifyListeners();
  }

  Future<bool> login(String codeSecret) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/agent/connexion'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code_secret': codeSecret}),
    );

    if (reponse.statusCode != 200) return false;

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    _token = data['token'] as String;
    final agent = data['agent'] as Map<String, dynamic>;
    _agentNom = '${agent['prenom']} ${agent['nom']}';
    _loggedIn = true;
    await chargerBilan();
    notifyListeners();
    return true;
  }

  Future<void> restaurerSession() async {}

  Future<void> logout() async {
    _loggedIn = false;
    _agentNom = '';
    _token = null;
    _transactions = [];
    notifyListeners();
  }

  Future<Map<String, dynamic>> effectuerRepas(String codeQr) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/agent/repas'),
      headers: _entetes,
      body: jsonEncode({'code_qr': codeQr}),
    );

    if (reponse.statusCode == 400) throw Exception('QR code FlexFood invalide');
    if (reponse.statusCode == 404) throw Exception('Étudiant introuvable');
    if (reponse.statusCode == 422) throw Exception('Solde insuffisant');
    if (reponse.statusCode != 200) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      throw Exception(data['erreur'] ?? 'Erreur lors du débit');
    }

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    final etudiant = data['etudiant'] as Map<String, dynamic>;

    final tx = Transaction(
      id: data['id'] as String,
      type: 'repas',
      matricule: etudiant['matricule'] as String,
      nomEtudiant: '${etudiant['prenom']} ${etudiant['nom']}',
      montant: (data['montant'] as int).abs(),
      date: DateTime.parse(data['dateHeure'] as String),
    );
    _transactions.insert(0, tx);
    notifyListeners();

    return data;
  }

  Future<Map<String, dynamic>> effectuerRechargement(String matricule, int montant) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/agent/rechargement'),
      headers: _entetes,
      body: jsonEncode({'matricule': matricule, 'montant': montant}),
    );

    if (reponse.statusCode == 404) throw Exception('Étudiant introuvable');
    if (reponse.statusCode == 400) {
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      throw Exception(data['erreur'] ?? 'Erreur rechargement');
    }
    if (reponse.statusCode != 200) throw Exception('Erreur serveur');

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;
    final etudiant = data['etudiant'] as Map<String, dynamic>;

    final tx = Transaction(
      id: data['id'] as String,
      type: 'rechargement',
      matricule: etudiant['matricule'] as String,
      nomEtudiant: '${etudiant['prenom']} ${etudiant['nom']}',
      montant: data['montant'] as int,
      date: DateTime.parse(data['dateHeure'] as String),
    );
    _transactions.insert(0, tx);
    notifyListeners();

    return data;
  }

  Future<void> chargerBilan() async {
    final reponse = await http.get(
      Uri.parse('${Config.urlBackend}/agent/bilan'),
      headers: _entetes,
    );

    if (reponse.statusCode != 200) return;

    final liste = jsonDecode(reponse.body) as List<dynamic>;
    _transactions = liste.map((e) {
      final m = e as Map<String, dynamic>;
      final etudiant = m['etudiant'] as Map<String, dynamic>?;
      return Transaction(
        id: m['id'] as String,
        type: m['type'] as String,
        matricule: etudiant?['matricule'] as String? ?? '',
        nomEtudiant: '${etudiant?['prenom']} ${etudiant?['nom']}',
        montant: (m['montant'] as int).abs(),
        date: DateTime.parse(m['dateHeure'] as String),
      );
    }).toList();
    notifyListeners();
  }

  int get totalRepas => _transactions
      .where((t) => t.type == 'repas')
      .fold(0, (s, t) => s + t.montant);

  int get totalRechargements => _transactions
      .where((t) => t.type == 'rechargement')
      .fold(0, (s, t) => s + t.montant);

  List<Transaction> get listeRechargements =>
      _transactions.where((t) => t.type == 'rechargement').toList();
}
