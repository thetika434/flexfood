import 'package:shared_preferences/shared_preferences.dart';

class ServiceStockageLocal {
  ServiceStockageLocal._();

  static const String _cleSolde = 'solde';
  static const String _cleQR = 'code_qr';
  static const String _cleMatricule = 'matricule';

  static Future<void> sauvegarderSolde(int solde) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_cleSolde, solde);
  }

  static Future<int?> recupererSolde() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_cleSolde);
  }

  static Future<void> sauvegarderCodeQR(String codeQR) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cleQR, codeQR);
  }

  static Future<String?> recupererCodeQR() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_cleQR);
  }

  static Future<void> sauvegarderMatricule(String matricule) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cleMatricule, matricule);
  }

  static Future<String?> recupererMatricule() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_cleMatricule);
  }

  static Future<void> toutEffacer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
