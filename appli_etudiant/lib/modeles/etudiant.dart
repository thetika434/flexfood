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

  factory Etudiant.fromJson(Map<String, dynamic> json) => Etudiant(
        matricule: json['matricule'] as String,
        nom: json['nom'] as String,
        prenom: json['prenom'] as String,
        solde: json['solde'] as int,
        codeQR: json['codeQr'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'matricule': matricule,
        'nom': nom,
        'prenom': prenom,
        'solde': solde,
        'codeQr': codeQR,
      };

  String get nomComplet => '$prenom $nom';

  String get initiales {
    final p = prenom.isNotEmpty ? prenom[0].toUpperCase() : '';
    final n = nom.isNotEmpty ? nom[0].toUpperCase() : '';
    return '$p$n';
  }
}
