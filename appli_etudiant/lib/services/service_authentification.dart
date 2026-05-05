import '../modeles/etudiant.dart';
import '../donnees_fictives/etudiants_fictifs.dart';
import 'service_stockage_local.dart';

// Stocke l'étudiant connecté pendant toute la session
class Session {
  static Etudiant? etudiantConnecte;
}

class ServiceAuthentification {
  ServiceAuthentification._();

  static Etudiant? connecter(String matricule, String codeSecret) {
    final etudiant = EtudiantsFictifs.chercherParMatricule(matricule);
    if (etudiant == null) return null;

    final codeCorrect = EtudiantsFictifs.codesSecrets[matricule];
    if (codeCorrect != codeSecret) return null;

    Session.etudiantConnecte = etudiant;
    ServiceStockageLocal.sauvegarderSolde(etudiant.solde);
    ServiceStockageLocal.sauvegarderCodeQR(etudiant.codeQR);
    ServiceStockageLocal.sauvegarderMatricule(etudiant.matricule);

    return etudiant;
  }

  static bool verifierPin(String pin) {
    final etudiant = Session.etudiantConnecte;
    if (etudiant == null) return false;
    final codeCorrect = EtudiantsFictifs.codesSecrets[etudiant.matricule];
    return codeCorrect == pin;
  }

  static bool changerCodeSecret(
      String ancien, String nouveau, String confirmation) {
    if (nouveau != confirmation) return false;
    if (nouveau.length != 4) return false;
    if (!RegExp(r'^\d{4}$').hasMatch(nouveau)) return false;

    final etudiant = Session.etudiantConnecte;
    if (etudiant == null) return false;

    final codeCorrect = EtudiantsFictifs.codesSecrets[etudiant.matricule];
    if (codeCorrect != ancien) return false;

    EtudiantsFictifs.codesSecrets[etudiant.matricule] = nouveau;
    return true;
  }

  static bool estPremiereConnexion() {
    return Session.etudiantConnecte?.premiereConnexion ?? false;
  }

  static void deconnecter() {
    Session.etudiantConnecte = null;
    ServiceStockageLocal.toutEffacer();
  }
}
