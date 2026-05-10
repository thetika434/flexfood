import '../modeles/transaction.dart';
import '../modeles/favori.dart';

class TransactionsFictives {
  TransactionsFictives._();

  static final DateTime _maintenant = DateTime.now();
  static final DateTime _aujourdhui = DateTime(
    _maintenant.year,
    _maintenant.month,
    _maintenant.day,
  );
  static final DateTime _hier = _aujourdhui.subtract(const Duration(days: 1));
  static final DateTime _datePrecedente =
      _aujourdhui.subtract(const Duration(days: 2));

  static final List<Transaction> transactions = [
    Transaction(
      id: '#4502',
      type: TypeTransaction.repas,
      montant: -200,
      dateHeure: _aujourdhui.add(
        const Duration(hours: 12, minutes: 45),
      ),
      service: ServiceRepas.midi,
    ),
    Transaction(
      id: '#4501',
      type: TypeTransaction.rechargement,
      montant: 5000,
      dateHeure: _aujourdhui.add(
        const Duration(hours: 9, minutes: 12),
      ),
    ),
    Transaction(
      id: '#4499',
      type: TypeTransaction.repas,
      montant: -200,
      dateHeure: _hier.add(
        const Duration(hours: 12, minutes: 45),
      ),
      service: ServiceRepas.midi,
    ),
    Transaction(
      id: '#4500',
      type: TypeTransaction.transfertEnvoye,
      montant: -200,
      dateHeure: _hier.add(
        const Duration(hours: 11, minutes: 30),
      ),
      autrePartiNom: 'Kyra',
      autrePartiMatricule: '22-ESATIC-0012',
    ),
    Transaction(
      id: '#4498',
      type: TypeTransaction.transfertEnvoye,
      montant: -1200,
      dateHeure: _datePrecedente.add(
        const Duration(hours: 18, minutes: 30),
      ),
      autrePartiNom: 'Kyra',
      autrePartiMatricule: '22-ESATIC-0012',
    ),
    Transaction(
      id: '#4497',
      type: TypeTransaction.repas,
      montant: -100,
      dateHeure: _datePrecedente.add(
        const Duration(hours: 7, minutes: 45),
      ),
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
