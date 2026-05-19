import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';
import 'models.dart';

class AppState extends ChangeNotifier {
  // ─── Auth ─────────────────────────────────────────────────────────────────
  bool _loggedIn = false;
  String _agentNom = '';
  String? _token;
  bool _scannerEnabled = true;

  bool get loggedIn => _loggedIn;
  String get agentNom => _agentNom;
  bool get scannerEnabled => _scannerEnabled;

  void setScannerEnabled(bool value) {
    _scannerEnabled = value;
    notifyListeners();
  }

  Future<Map<String, String>> get _entetes async => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_token ?? ''}',
      };

  Future<bool> login(String codeSecret) async {
    try {
      final reponse = await http.post(
        Uri.parse('${Config.urlBackend}/agent/connexion'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'code_secret': codeSecret}),
      );
      if (reponse.statusCode != 200) return false;
      final data = jsonDecode(reponse.body) as Map<String, dynamic>;
      _token = data['token'] as String;
      final agent = data['agent'] as Map<String, dynamic>;
      _agentNom = '${agent['prenom'] ?? ''} ${agent['nom'] ?? ''}'.trim();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('agent_token', _token!);
      await prefs.setString('agent_nom', _agentNom);

      _loggedIn = true;
      await chargerBilan();
      notifyListeners();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> restaurerSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('agent_token');
    final nom = prefs.getString('agent_nom');
    if (token != null && nom != null) {
      _token = token;
      _agentNom = nom;
      _loggedIn = true;
      await chargerBilan();
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('agent_token');
    await prefs.remove('agent_nom');
    _loggedIn = false;
    _agentNom = '';
    _token = null;
    _transactions = [];
    notifyListeners();
  }

  // ─── Scan repas ───────────────────────────────────────────────────────────

  /// Retourne les infos du repas effectué ou lance une exception
  Future<Map<String, dynamic>> effectuerRepas(String codeQr) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/agent/repas'),
      headers: await _entetes,
      body: jsonEncode({'code_qr': codeQr}),
    );

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;

    if (reponse.statusCode == 403) throw Exception('Aucun créneau actif');
    if (reponse.statusCode == 404) throw Exception('Étudiant introuvable');
    if (reponse.statusCode == 422) throw Exception('Solde insuffisant');
    if (reponse.statusCode != 200) {
      throw Exception(data['erreur'] ?? 'Erreur serveur');
    }

    final tx = Transaction.fromJson(data);
    _transactions.insert(0, tx);
    notifyListeners();
    return data;
  }

  // ─── Rechargement ─────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> effectuerRechargement(
      String matricule, int montant) async {
    final reponse = await http.post(
      Uri.parse('${Config.urlBackend}/agent/rechargement'),
      headers: await _entetes,
      body: jsonEncode({'matricule': matricule, 'montant': montant}),
    );

    final data = jsonDecode(reponse.body) as Map<String, dynamic>;

    if (reponse.statusCode == 404) throw Exception('Étudiant introuvable');
    if (reponse.statusCode == 400) {
      throw Exception(data['erreur'] ?? 'Montant invalide');
    }
    if (reponse.statusCode != 200) {
      throw Exception(data['erreur'] ?? 'Erreur serveur');
    }

    final tx = Transaction.fromJson(data);
    _transactions.insert(0, tx);
    notifyListeners();
    return data;
  }

  // ─── Bilan ────────────────────────────────────────────────────────────────
  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  Future<void> chargerBilan() async {
    try {
      final reponse = await http.get(
        Uri.parse('${Config.urlBackend}/agent/bilan'),
        headers: await _entetes,
      );
      if (reponse.statusCode == 200) {
        final liste = jsonDecode(reponse.body) as List;
        _transactions =
            liste.map((j) => Transaction.fromJson(j as Map<String, dynamic>)).toList();
        notifyListeners();
      }
    } catch (_) {}
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
