enum TypeTransaction {
  repas,
  rechargement,
  transfertEnvoye,
  transfertRecu,
}

enum ServiceRepas {
  matin,
  midi,
  soir,
}

class Transaction {
  final String id;
  final TypeTransaction type;
  final int montant;
  final DateTime dateHeure;
  final String? autrePartiNom;
  final String? autrePartiMatricule;
  final ServiceRepas? service;

  Transaction({
    required this.id,
    required this.type,
    required this.montant,
    required this.dateHeure,
    this.autrePartiNom,
    this.autrePartiMatricule,
    this.service,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final matricule = json['autrePartiMatricule'] as String?;
    return Transaction(
      id: json['id'] as String,
      type: _parseType(json['type'] as String),
      montant: json['montant'] as int,
      dateHeure: DateTime.parse(json['dateHeure'] as String),
      autrePartiNom: json['autrePartiNom'] as String? ?? matricule,
      autrePartiMatricule: matricule,
      service: _parseService(json['service'] as String?),
    );
  }

  static TypeTransaction _parseType(String t) => switch (t) {
        'transfert_envoye' => TypeTransaction.transfertEnvoye,
        'transfert_recu' => TypeTransaction.transfertRecu,
        'rechargement' => TypeTransaction.rechargement,
        _ => TypeTransaction.repas,
      };

  static ServiceRepas? _parseService(String? s) => switch (s) {
        'matin' || 'petit_dejeuner' => ServiceRepas.matin,
        'midi' || 'dejeuner' => ServiceRepas.midi,
        'soir' || 'diner' => ServiceRepas.soir,
        _ => null,
      };

  bool get estPositif => montant > 0;

  String get titre {
    switch (type) {
      case TypeTransaction.repas:
        switch (service) {
          case ServiceRepas.matin:
            return 'Repas Matin';
          case ServiceRepas.midi:
            return 'Repas Midi';
          case ServiceRepas.soir:
            return 'Repas Soir';
          case null:
            return 'Repas';
        }
      case TypeTransaction.rechargement:
        return 'Rechargement';
      case TypeTransaction.transfertEnvoye:
        return 'Transfert à ${autrePartiNom ?? ''}';
      case TypeTransaction.transfertRecu:
        return 'Reçu de ${autrePartiNom ?? ''}';
    }
  }
}
