import '../modeles/etudiant.dart';

class EtudiantsFictifs {
  EtudiantsFictifs._();

  static final Etudiant moi = Etudiant(
    matricule: '21-ESATIC-0045',
    nom: 'Thetika',
    prenom: 'Josua',
    solde: 10000,
    codeQR: 'FLEXFOOD-21-ESATIC-0045-a1b2c3d4',
    premiereConnexion: false,
  );

  static final List<Etudiant> tousLesEtudiants = [
    moi,
    Etudiant(
      matricule: '22-ESATIC-0012',
      nom: 'Diallo',
      prenom: 'Kyra',
      solde: 5500,
      codeQR: 'FLEXFOOD-22-ESATIC-0012-b2c3d4e5',
    ),
    Etudiant(
      matricule: '21-ESATIC-0456',
      nom: 'Kouassi',
      prenom: 'Maman',
      solde: 2000,
      codeQR: 'FLEXFOOD-21-ESATIC-0456-c3d4e5f6',
    ),
    Etudiant(
      matricule: '23-ESATIC-0987',
      nom: 'Thetika',
      prenom: 'David',
      solde: 8000,
      codeQR: 'FLEXFOOD-23-ESATIC-0987-d4e5f6a7',
    ),
    Etudiant(
      matricule: '22-ESATIC-0543',
      nom: 'Gondo',
      prenom: 'Arnaud',
      solde: 3500,
      codeQR: 'FLEXFOOD-22-ESATIC-0543-e5f6a7b8',
    ),
    Etudiant(
      matricule: '20-ESATIC-0123',
      nom: 'Jay',
      prenom: 'Noah',
      solde: 1500,
      codeQR: 'FLEXFOOD-20-ESATIC-0123-f6a7b8c9',
    ),
  ];

  // Codes secrets (en production ils seront hashés avec bcrypt côté backend)
  static final Map<String, String> codesSecrets = {
    '21-ESATIC-0045': '1234',
    '22-ESATIC-0012': '5678',
    '21-ESATIC-0456': '4321',
    '23-ESATIC-0987': '1111',
    '22-ESATIC-0543': '2222',
    '20-ESATIC-0123': '3333',
  };

  static Etudiant? chercherParMatricule(String matricule) {
    try {
      return tousLesEtudiants.firstWhere((e) => e.matricule == matricule);
    } catch (_) {
      return null;
    }
  }
}
