class Transaction {
  final String id;
  final String type;
  final String matricule;
  final String nomEtudiant;
  final int montant;
  final DateTime date;
  final String? service;

  Transaction({
    required this.id,
    required this.type,
    required this.matricule,
    required this.nomEtudiant,
    required this.montant,
    required this.date,
    this.service,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final etudiant = json['etudiant'] as Map<String, dynamic>?;
    return Transaction(
      id: json['id'] as String,
      type: json['type'] as String,
      matricule: etudiant?['matricule'] as String? ?? '',
      nomEtudiant:
          '${etudiant?['prenom'] ?? ''} ${etudiant?['nom'] ?? ''}'.trim(),
      montant: (json['montant'] as int).abs(),
      date: DateTime.parse(json['dateHeure'] as String),
      service: json['service'] as String?,
    );
  }
}

class Etudiant {
  final String matricule;
  final String nom;
  final String prenom;
  final int solde;
  final int soldeApres;

  Etudiant({
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.solde,
    this.soldeApres = 0,
  });

  String get nomComplet => '$prenom $nom';

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      matricule: json['matricule'] as String,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      solde: json['solde'] as int? ?? 0,
      soldeApres: json['soldeApres'] as int? ?? 0,
    );
  }
}
