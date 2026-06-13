class Etudiant {
  final String matricule;
  final String nom;
  final String prenom;
  int solde;
  final String codeQR;
  final String role;
  bool premiereConnexion;

  Etudiant({
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.solde,
    required this.codeQR,
    this.role = 'etudiant',
    this.premiereConnexion = false,
  });

  bool get estEnseignant => role == 'enseignant';

  factory Etudiant.fromJson(Map<String, dynamic> json) => Etudiant(
        matricule: json['matricule'] as String,
        nom: json['nom'] as String,
        prenom: json['prenom'] as String,
        solde: json['solde'] as int,
        codeQR: json['codeQr'] as String? ?? '',
        role: json['role'] as String? ?? 'etudiant',
        premiereConnexion: json['premiereConnexion'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'matricule': matricule,
        'nom': nom,
        'prenom': prenom,
        'solde': solde,
        'codeQr': codeQR,
        'role': role,
        'premiereConnexion': premiereConnexion,
      };

  String get nomComplet => '$prenom $nom';

  String get initiales {
    final p = prenom.isNotEmpty ? prenom[0].toUpperCase() : '';
    final n = nom.isNotEmpty ? nom[0].toUpperCase() : '';
    return '$p$n';
  }
}
