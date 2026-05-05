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
