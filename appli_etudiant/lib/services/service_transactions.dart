import '../modeles/etudiant.dart';
import '../modeles/transaction.dart';
import '../modeles/favori.dart';
import '../donnees_fictives/etudiants_fictifs.dart';
import '../donnees_fictives/transactions_fictives.dart';
import 'service_authentification.dart';

class ServiceTransactions {
  ServiceTransactions._();

  static List<Transaction> obtenirTransactions() {
    return List.from(TransactionsFictives.transactions);
  }

  static List<Transaction> obtenirDernieresTransactions({int nombre = 4}) {
    final liste = obtenirTransactions();
    liste.sort((a, b) => b.dateHeure.compareTo(a.dateHeure));
    return liste.take(nombre).toList();
  }

  static List<Favori> obtenirFavoris() {
    return List.from(TransactionsFictives.favoris);
  }

  static Etudiant? chercherEtudiantParMatricule(String matricule) {
    return EtudiantsFictifs.chercherParMatricule(matricule);
  }

  // Retourne null si le transfert échoue, sinon retourne la transaction créée
  static Transaction? effectuerTransfert(
      String matriculeDestinataire, int montant) {
    final expediteur = Session.etudiantConnecte;
    if (expediteur == null) return null;

    // Vérifications règles métier
    if (montant <= 0) return null;
    if (montant % 100 != 0) return null;
    if (expediteur.solde < montant) return null;
    if (matriculeDestinataire == expediteur.matricule) return null;

    final destinataire =
        EtudiantsFictifs.chercherParMatricule(matriculeDestinataire);
    if (destinataire == null) return null;

    // Mise à jour des soldes (atomique)
    expediteur.solde -= montant;
    destinataire.solde += montant;

    final transaction = Transaction(
      id: '#${(DateTime.now().millisecondsSinceEpoch % 9000) + 1000}',
      type: TypeTransaction.transfertEnvoye,
      montant: -montant,
      dateHeure: DateTime.now(),
      autrePartiNom: destinataire.prenom,
      autrePartiMatricule: destinataire.matricule,
    );

    TransactionsFictives.transactions.insert(0, transaction);
    return transaction;
  }
}
