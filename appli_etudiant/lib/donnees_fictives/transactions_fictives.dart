import '../modeles/transaction.dart';
import '../modeles/favori.dart';

class TransactionsFictives {
  TransactionsFictives._();

  static final List<Transaction> transactions = [
    Transaction(
      id: '#4503',
      type: TypeTransaction.transfertRecu,
      montant: 500,
      dateHeure: DateTime.now().subtract(const Duration(hours: 14)),
      autrePartiNom: 'Kyra',
      autrePartiMatricule: '22-ESATIC-0012',
    ),
    Transaction(
      id: '#4502',
      type: TypeTransaction.repas,
      montant: -200,
      dateHeure: DateTime(2025, 10, 25, 12, 45),
      service: ServiceRepas.midi,
    ),
    Transaction(
      id: '#4501',
      type: TypeTransaction.rechargement,
      montant: 5000,
      dateHeure: DateTime(2025, 10, 25, 9, 12),
    ),
    Transaction(
      id: '#4500',
      type: TypeTransaction.transfertEnvoye,
      montant: -200,
      dateHeure: DateTime(2025, 10, 24, 11, 30),
      autrePartiNom: 'Kyra',
      autrePartiMatricule: '22-ESATIC-0012',
    ),
    Transaction(
      id: '#4499',
      type: TypeTransaction.repas,
      montant: -200,
      dateHeure: DateTime(2025, 10, 24, 12, 45),
      service: ServiceRepas.midi,
    ),
    Transaction(
      id: '#4498',
      type: TypeTransaction.transfertEnvoye,
      montant: -1200,
      dateHeure: DateTime(2025, 10, 23, 18, 30),
      autrePartiNom: 'Kyra',
      autrePartiMatricule: '22-ESATIC-0012',
    ),
    Transaction(
      id: '#4497',
      type: TypeTransaction.repas,
      montant: -100,
      dateHeure: DateTime(2025, 10, 23, 7, 45),
      service: ServiceRepas.matin,
    ),
  ];

  static final List<Favori> favoris = [
    const Favori(nom: 'Kyra', matricule: '22-ESATIC-0012'),
    const Favori(nom: 'maman', matricule: '21-ESATIC-0456'),
    const Favori(nom: 'David Thetika', matricule: '23-ESATIC-0987'),
    const Favori(nom: 'gondo', matricule: '22-ESATIC-0543'),
    const Favori(nom: 'Noah J A Y', matricule: '20-ESATIC-0123'),
  ];
}
