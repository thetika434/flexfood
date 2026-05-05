class Etudiant {
  final String matricule;
  final String nom;
  final String prenom;
  int solde;
  final String codeQR;
  bool premiereConnexion;

  Etudiant({
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.solde,
    required this.codeQR,
    this.premiereConnexion = false,
  });

  String get nomComplet => '$prenom $nom';

  String get initiales {
    final p = prenom.isNotEmpty ? prenom[0].toUpperCase() : '';
    final n = nom.isNotEmpty ? nom[0].toUpperCase() : '';
    return '$p$n';
  }
}
