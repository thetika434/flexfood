class Etudiant {
  final String matricule, nom, prenom, filiere, niveau;
  int solde;
  Etudiant({required this.matricule, required this.nom, required this.prenom,
    required this.filiere, required this.niveau, required this.solde});
  String get nomComplet => '$prenom $nom';
  String get initiales => '${prenom[0]}${nom[0]}';
}

class TxAdmin {
  final String id, type, nomEtudiant, matricule;
  final int montant;
  final DateTime date;
  final String? agent;
  TxAdmin({required this.id, required this.type, required this.nomEtudiant,
    required this.matricule, required this.montant, required this.date, this.agent});
}

final now = DateTime.now();

final List<Etudiant> etudiants = [
  Etudiant(matricule: '21-ESATIC-0045', nom: 'Koné',      prenom: 'Aminata',  filiere: 'Génie Logiciel', niveau: 'L3', solde: 5200),
  Etudiant(matricule: '23-ESATIC-0007', nom: 'Bamba',     prenom: 'Mariam',   filiere: 'Réseaux & Télécom', niveau: 'L1', solde: 4800),
  Etudiant(matricule: '24-ESATIC-0031', nom: 'Tano',      prenom: 'Yves',     filiere: 'Génie Logiciel', niveau: 'L1', solde: 3200),
  Etudiant(matricule: '24-ESATIC-0018', nom: 'Koné',      prenom: 'Aminata',  filiere: 'Cybersécurité',  niveau: 'L2', solde: 6500),
  Etudiant(matricule: '24-ESATIC-0055', nom: 'Ouattara',  prenom: 'Seydou',   filiere: 'Génie Logiciel', niveau: 'L1', solde: 1500),
  Etudiant(matricule: '23-ESATIC-0042', nom: 'Diallo',    prenom: 'Kouamé',   filiere: 'Réseaux & Télécom', niveau: 'L2', solde: 5000),
  Etudiant(matricule: '22-ESATIC-0013', nom: 'Traoré',    prenom: 'Fatou',    filiere: 'Cybersécurité',  niveau: 'L3', solde: 2800),
  Etudiant(matricule: '23-ESATIC-0061', nom: 'Coulibaly', prenom: 'Ibrahim',  filiere: 'Génie Logiciel', niveau: 'L2', solde: 7200),
  Etudiant(matricule: '24-ESATIC-0009', nom: 'Sanogo',    prenom: 'Aïcha',    filiere: 'Réseaux & Télécom', niveau: 'L1', solde: 4100),
  Etudiant(matricule: '22-ESATIC-0028', nom: 'Touré',     prenom: 'Moussa',   filiere: 'Génie Logiciel', niveau: 'L3', solde: 9500),
  Etudiant(matricule: '23-ESATIC-0034', nom: 'Dembélé',   prenom: 'Rokia',    filiere: 'Cybersécurité',  niveau: 'L2', solde: 3700),
  Etudiant(matricule: '24-ESATIC-0072', nom: 'Fofana',    prenom: 'Lacina',   filiere: 'Réseaux & Télécom', niveau: 'L1', solde: 1200),
];

final List<TxAdmin> transactions = [
  TxAdmin(id:'#1001', type:'repas',         nomEtudiant:'Aminata Koné',     matricule:'21-ESATIC-0045', montant:200,  date:now.subtract(const Duration(minutes:15)),  agent:'Koné Amadou'),
  TxAdmin(id:'#1002', type:'repas',         nomEtudiant:'Mariam Bamba',     matricule:'23-ESATIC-0007', montant:200,  date:now.subtract(const Duration(minutes:32)),  agent:'Koné Amadou'),
  TxAdmin(id:'#1003', type:'rechargement',  nomEtudiant:'Yves Tano',        matricule:'24-ESATIC-0031', montant:5000, date:now.subtract(const Duration(minutes:45)),  agent:'Koné Amadou'),
  TxAdmin(id:'#1004', type:'repas',         nomEtudiant:'Seydou Ouattara',  matricule:'24-ESATIC-0055', montant:200,  date:now.subtract(const Duration(minutes:58)),  agent:'Soro Fatogoma'),
  TxAdmin(id:'#1005', type:'repas',         nomEtudiant:'Kouamé Diallo',    matricule:'23-ESATIC-0042', montant:200,  date:now.subtract(const Duration(minutes:71)),  agent:'Soro Fatogoma'),
  TxAdmin(id:'#1006', type:'rechargement',  nomEtudiant:'Fatou Traoré',     matricule:'22-ESATIC-0013', montant:3000, date:now.subtract(const Duration(minutes:90)),  agent:'Koné Amadou'),
  TxAdmin(id:'#1007', type:'transfert',     nomEtudiant:'Ibrahim Coulibaly',matricule:'23-ESATIC-0061', montant:1000, date:now.subtract(const Duration(hours:2)),),
  TxAdmin(id:'#1008', type:'repas',         nomEtudiant:'Aïcha Sanogo',     matricule:'24-ESATIC-0009', montant:200,  date:now.subtract(const Duration(hours:3)),    agent:'Soro Fatogoma'),
  TxAdmin(id:'#1009', type:'rechargement',  nomEtudiant:'Moussa Touré',     matricule:'22-ESATIC-0028', montant:10000,date:now.subtract(const Duration(hours:4)),    agent:'Koné Amadou'),
  TxAdmin(id:'#1010', type:'repas',         nomEtudiant:'Rokia Dembélé',    matricule:'23-ESATIC-0034', montant:200,  date:now.subtract(const Duration(hours:5)),    agent:'Soro Fatogoma'),
  TxAdmin(id:'#1011', type:'repas',         nomEtudiant:'Lacina Fofana',    matricule:'24-ESATIC-0072', montant:100,  date:now.subtract(const Duration(hours:6)),    agent:'Koné Amadou'),
  TxAdmin(id:'#1012', type:'transfert',     nomEtudiant:'Aminata Koné',     matricule:'21-ESATIC-0045', montant:500,  date:now.subtract(const Duration(hours:8)),),
  TxAdmin(id:'#1013', type:'rechargement',  nomEtudiant:'Mariam Bamba',     matricule:'23-ESATIC-0007', montant:2000, date:now.subtract(const Duration(hours:24)),   agent:'Koné Amadou'),
  TxAdmin(id:'#1014', type:'repas',         nomEtudiant:'Yves Tano',        matricule:'24-ESATIC-0031', montant:200,  date:now.subtract(const Duration(hours:25)),   agent:'Soro Fatogoma'),
  TxAdmin(id:'#1015', type:'repas',         nomEtudiant:'Kouamé Diallo',    matricule:'23-ESATIC-0042', montant:200,  date:now.subtract(const Duration(hours:26)),   agent:'Koné Amadou'),
];

List<TxAdmin> get txAujourdhui => transactions.where((t) => t.date.isAfter(now.subtract(const Duration(hours: 24)))).toList();
int get totalRepasAujourdhui => txAujourdhui.where((t) => t.type == 'repas').length;
int get totalRechargeAujourdhui => txAujourdhui.where((t) => t.type == 'rechargement').fold(0, (s, t) => s + t.montant);
int get totalTransfertsAujourdhui => txAujourdhui.where((t) => t.type == 'transfert').length;
int get soldeTotalEtudiants => etudiants.fold(0, (s, e) => s + e.solde);
