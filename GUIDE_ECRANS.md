# Guide détaillé des écrans — FlexFood

> Ce fichier décrit précisément ce que chaque développeur doit implémenter.
> Chaque écran contient : le rôle, la structure visuelle, la logique, les composants à utiliser et la navigation.

---

## TABLE DES MATIÈRES

- [BIGO — Page Changer Code Secret](#1-bigo--page-changer-code-secret)
- [BIGO — Page Confirmation Rechargement](#2-bigo--page-confirmation-rechargement)
- [DAVID — Page Historique](#3-david--page-historique)
- [DAVID — Page Détail Repas](#4-david--page-détail-repas)
- [NABO — Page Choisir Mode Transfert](#5-nabo--page-choisir-mode-transfert)
- [NABO — Page Saisir Matricule](#6-nabo--page-saisir-matricule)
- [NABO — Page Scanner QR](#7-nabo--page-scanner-qr)
- [MOÏSE — Page Montant Transfert](#8-moïse--page-montant-transfert)
- [MOÏSE — Page Confirmation Transfert Envoyé](#9-moïse--page-confirmation-transfert-envoyé)
- [MOÏSE — Page Confirmation Transfert Reçu](#10-moïse--page-confirmation-transfert-reçu)

---

---

# BIGO

---

## 1. BIGO — Page Changer Code Secret

**Fichier :** `lib/ecrans/parametres/page_changer_code_secret.dart`
**Reçoit :** rien (pas d'argument)

### Rôle
Permet à l'étudiant connecté de modifier son code PIN à 4 chiffres.
L'écran se décompose en 3 étapes enchaînées :
1. Saisir l'ancien code
2. Saisir le nouveau code
3. Confirmer le nouveau code

### Structure visuelle (du haut vers le bas)
```
← (flèche retour)
Titre : "Changer le code secret"
Sous-titre selon l'étape :
  Étape 1 → "Entrez votre code actuel"
  Étape 2 → "Entrez votre nouveau code"
  Étape 3 → "Confirmez le nouveau code"

IndicateurPin (4 cercles)

Message d'erreur (si erreur)

ClavierNumerique
```

### Logique
```dart
// Étape 1 : vérifier l'ancien code
bool valide = ServiceAuthentification.verifierPin(ancienCode);
if (!valide) → afficher "Code incorrect"
if (valide)  → passer à l'étape 2

// Étape 2 : stocker le nouveau code (pas encore sauvegardé)
nouveauCode = codeEntré;
→ passer à l'étape 3

// Étape 3 : comparer les deux saisies
if (codeConfirmation != nouveauCode) → afficher "Les codes ne correspondent pas"
if (codeConfirmation == nouveauCode) →
    ServiceAuthentification.changerCodeSecret(nouveauCode)
    → Navigator.pop(context) // retour au tableau de bord
```

### Composants à utiliser
```dart
import '../../composants/indicateur_pin.dart';
import '../../composants/clavier_numerique.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../services/service_authentification.dart';
```

### Données disponibles
```dart
// Récupérer l'étudiant connecté
final etudiant = Session.etudiantConnecte;
```

### État à gérer (StatefulWidget)
```dart
int _etape = 1;           // 1, 2 ou 3
String _ancienCode = '';
String _nouveauCode = '';
String _codeEnCours = '';
String _messageErreur = '';
```

---

  ## 2. DAVID — Page Confirmation Rechargement

**Fichier :** `lib/ecrans/confirmations/page_confirmation_rechargement.dart`
**Reçoit :** `final Transaction transaction;` (dans le constructeur)

### Rôle
Écran affiché après un rechargement réussi. Confirme le montant crédité,
la date et l'identifiant de la transaction.

### Structure visuelle (du haut vers le bas)
```
Icône succès (grand cercle vert avec coche ✓)
Titre : "Rechargement effectué"
Montant : "+5 000 FCFA" (en grand, vert)

CarteDetailTransaction contenant :
  LigneDetail → icône: receipt     | label: "Référence"  | valeur: transaction.id
  LigneDetail → icône: event       | label: "Date"        | valeur: date formatée
  LigneDetail → icône: payments    | label: "Montant"     | valeur: montant formaté

BoutonPrincipal "Retour à l'accueil"
  → Navigator.pushNamedAndRemoveUntil(context, Routes.accueil, (_) => false)
```

### Composants à utiliser
```dart
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/pastille_statut.dart';
import '../../composants/bouton_principal.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
```

### Données disponibles via `transaction`
```dart
transaction.id          // "#4501"
transaction.montant     // 5000
transaction.dateHeure   // DateTime` v vtv   0mnbl[y ]
Formateur.formaterDate(transaction.dateHeure)  // "Aujourd'hui, 09:12"
Formateur.formaterMontantTransaction(transaction.montant) // "+5 000 FCFA"
```

---
---

# DAVID

---

## 3. DAVID — Page Historique

**Fichier :** `lib/ecrans/historique/page_historique.dart`
**Reçoit :** rien (pas d'argument)

### Rôle
Affiche toutes les transactions de l'étudiant connecté, groupées par date,
avec des filtres temporels en haut.

### Structure visuelle EXACTE (basée sur le design fourni)

```
┌─────────────────────────────────────┐
│ ←   Historique                      │
├─────────────────────────────────────┤
│ [Aujourd'hui] [Cette semaine]       │  ← défilable horizontalement
│ [Ce mois] [📅 Personnalisé]         │
├─────────────────────────────────────┤
│                                     │
│  AUJOURD'HUI ────────────────       │  ← label de groupe (petit, gris)
│                                     │
│ ┌─────────────────────────────────┐ │
│ │ 🍴  Repas Midi          -200 F  │ │  ← carte blanche avec bordure
│ │     25 oct., 12:45              │ │
│ └─────────────────────────────────┘ │
│                                     │
│ ┌─────────────────────────────────┐ │
│ │ 💳  Rechargement      +5000 F  │ │
│ │     25 oct., 09:12              │ │
│ └─────────────────────────────────┘ │
│                                     │
│  HIER ───────────────────────────   │
│                                     │
│ ┌─────────────────────────────────┐ │
│ │ ➤  Transfert à Kyra   -200 F   │ │
│ │     24 oct., 11:30              │ │
│ └─────────────────────────────────┘ │
└─────────────────────────────────────┘
```

### Boutons de filtre (barre en haut)
```
Aujourd'hui  → fond vert foncé (#024618), texte blanc   ← sélectionné par défaut
Cette semaine → fond gris clair, texte gris
Ce mois       → fond gris clair, texte gris
Personnalisé  → fond transparent, bordure grise, icône calendrier
```

### Chaque carte de transaction ressemble à ceci
```
fond blanc, coins arrondis (12px), bordure grise légère, ombre très légère
├── Cercle coloré + icône   (voir couleurs dans couleurs.dart)
├── Titre de la transaction  (texte vert foncé #024618)
├── Date                     (texte gris #41493F)
└── Montant                  (rouge si négatif, vert si positif, en gras)
```
→ C'est exactement le composant `ElementTransaction` déjà fait — il suffit de l'appeler.

### Logique simple (étape par étape)

**Étape 1 — Récupérer les transactions**
```dart
// Dans initState()
List<Transaction> _transactions = ServiceTransactions.obtenirTransactions();
```

**Étape 2 — Grouper par date**
```dart
// Cette fonction transforme la liste en groupes par date
// Ex: { "AUJOURD'HUI": [t1, t2], "HIER": [t3], "25 OCTOBRE": [t4] }

Map<String, List<Transaction>> _grouperParDate(List<Transaction> liste) {
  Map<String, List<Transaction>> groupes = {};
  for (var t in liste) {
    String cle = Formateur.formaterDateGroupe(t.dateHeure);
    // cle vaut "AUJOURD'HUI", "HIER", ou "25 OCTOBRE" etc.
    if (groupes[cle] == null) groupes[cle] = [];
    groupes[cle]!.add(t);
  }
  return groupes;
}
```

**Étape 3 — Afficher les groupes**
```dart
// Dans le build(), appeler la fonction et afficher groupe par groupe
Map<String, List<Transaction>> groupes = _grouperParDate(_transactions);

// Pour chaque groupe : afficher le label de date puis les transactions
for (String dateLabel in groupes.keys) {
  // Afficher le label : "AUJOURD'HUI", "HIER", etc.
  Text(dateLabel, style: StylesTexte.label)

  // Afficher chaque transaction du groupe
  for (Transaction t in groupes[dateLabel]!) {
    ElementTransaction(
      transaction: t,
      onAppui: t.type == TypeTransaction.repas
          ? () => Navigator.pushNamed(context, Routes.detailRepas, arguments: t)
          : null,
    )
  }
}
```

### Composants à utiliser
```dart
import '../../composants/element_transaction.dart';
import '../../composants/filtre_temporel.dart';
import '../../modeles/transaction.dart';
import '../../services/service_transactions.dart';
import '../../utilitaires/formateur.dart';
import '../../navigation/routeur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### État à gérer (StatefulWidget)
```dart
String _filtreActif = 'Aujourd\'hui';
List<Transaction> _transactions = [];

// Filtres disponibles (pour l'instant afficher toutes les transactions)
final List<String> _filtres = ['Aujourd\'hui', 'Cette semaine', 'Ce mois', 'Personnalisé'];
```

---

## 4. BIGO — Page Détail Repas

**Fichier :** `lib/ecrans/confirmations/page_detail_repas.dart`
**Reçoit :** `final Transaction transaction;` (dans le constructeur)

### Rôle
S'affiche quand l'étudiant appuie sur un repas dans l'historique.
Montre le marchand, la date, le statut et l'ID de la transaction.

### Structure visuelle EXACTE (basée sur le design fourni)

```
┌─────────────────────────────────────┐
│ (←)  fond gris arrondi              │  ← bouton retour
│                                     │
│         ●● (grand cercle vert vif)  │
│         🍴 (icône restaurant foncé) │
│                                     │
│           Repas Midi                │  ← vert foncé (#024618), gras
│           -200 FCFA                 │  ← noir, très gras, grande taille
│                                     │
│  ┌───────────────────────────────┐  │
│  │ 🏪  MARCHAND                 │  │
│  │     Restaurant servira       │  │
│  │ ─────────────────────────── │  │
│  │ 🕐  DATE & HEURE             │  │
│  │     25 oct., 12:45           │  │
│  │ ─────────────────────────── │  │
│  │ ✓   STATUT                  │  │
│  │     [ Succès ]               │  │  ← pastille verte arrondie
│  │ ─────────────────────────── │  │
│  │ 🏷  ID TRANSACTION      📋  │  │  ← icône copier à droite
│  │     #4501                    │  │
│  └───────────────────────────┘  │
└─────────────────────────────────────┘
```

### Détails visuels importants
- **Cercle icône** : fond `Couleurs.fondIconeRechargement` (#5CFD80), icône `Couleurs.iconeRepas` (#024618)
- **Titre "Repas Midi"** : couleur `Couleurs.vertPrincipal` (#024618), gras
- **Montant "-200 FCFA"** : noir, très grand, très gras
- **Labels** (MARCHAND, DATE & HEURE...) : tout en majuscules, petits, gris
- **Pastille Succès** : composant `PastilleStatut(succes: true)`
- **Icône copier** à droite de l'ID : `Icons.copy_outlined` → copie dans le presse-papier

### Composants à utiliser
```dart
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/pastille_statut.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### Données disponibles via `transaction`
```dart
transaction.titre       // "Repas Midi"
transaction.id          // "#4501"
transaction.montant     // -200
transaction.dateHeure   // DateTime

Formateur.formaterDate(transaction.dateHeure) // "25 oct., 12:45"

// Le marchand est toujours "Restaurant servira" (fixe pour la démo)
```

### Logique copier l'ID
```dart
import 'package:flutter/services.dart';

// Au clic sur l'icône copier :
Clipboard.setData(ClipboardData(text: transaction.id));
```

---
---

# NABO

---

## 5. NABO — Page Choisir Mode Transfert

**Fichier :** `lib/ecrans/transfert/page_choisir_mode_transfert.dart`
**Reçoit :** rien (pas d'argument)

### Rôle
Point d'entrée du flow transfert. L'étudiant choisit comment identifier
le destinataire : scanner son QR code ou entrer son matricule manuellement.
Affiche aussi les favoris pour un accès rapide.

### Structure visuelle (du haut vers le bas)
```
← (flèche retour)
Titre : "Envoyer de l'argent"

Deux boutons de choix :
  [ Scanner le QR code    📷 ]
  [ Entrer le matricule   ⌨️ ]

Titre section : "Favoris"
Liste des favoris (nom + matricule) :
  Kyra          22-ESATIC-0012  →
  maman         21-ESATIC-0456  →
  David Thetika 23-ESATIC-0987  →
  ...
```

### Logique
```dart
// Bouton Scanner QR
onAppui: () => Navigator.pushNamed(context, Routes.scannerQR)

// Bouton Saisir Matricule
onAppui: () => Navigator.pushNamed(context, Routes.saisirMatricule)

// Appui sur un favori → chercher l'étudiant et aller au montant
Etudiant? etudiant = ServiceTransactions.chercherEtudiantParMatricule(favori.matricule);
if (etudiant != null)
  Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
```

### Composants à utiliser
```dart
import '../../composants/bouton_principal.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../modeles/favori.dart';
import '../../services/service_transactions.dart';
import '../../navigation/routeur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### Données disponibles
```dart
List<Favori> favoris = ServiceTransactions.obtenirFavoris();
// Favori a : favori.nom et favori.matricule
```

---

## 6. NABO — Page Saisir Matricule

**Fichier :** `lib/ecrans/transfert/page_saisir_matricule.dart`
**Reçoit :** rien (pas d'argument)

### Rôle
Permet de rechercher un étudiant en entrant son matricule manuellement.
Affiche le résultat trouvé (nom + avatar) avant de continuer.

### Structure visuelle (du haut vers le bas)
```
← (flèche retour)
Titre : "Saisir le matricule"

ChampSaisie
  label: "Matricule (ex: 22-ESATIC-0012)"
  icône: badge

BoutonPrincipal "Rechercher"

── Si étudiant trouvé ──
AvatarUtilisateur
Nom de l'étudiant
Matricule

BoutonPrincipal "Continuer"
  → Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiantTrouve)

── Si non trouvé ──
Message : "Aucun étudiant trouvé"
```

### Logique
```dart
// Rechercher l'étudiant
Etudiant? etudiant = ServiceTransactions.chercherEtudiantParMatricule(matriculeSaisi);

if (etudiant == null) → afficher "Aucun étudiant trouvé"
if (etudiant != null) → afficher la carte de l'étudiant + bouton Continuer

// Empêcher de se transférer à soi-même
if (etudiant.matricule == Session.etudiantConnecte!.matricule)
  → afficher "Vous ne pouvez pas vous envoyer de l'argent"
```

### Composants à utiliser
```dart
import '../../composants/champ_saisie.dart';
import '../../composants/bouton_principal.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../modeles/etudiant.dart';
import '../../services/service_transactions.dart';
import '../../services/service_authentification.dart';
import '../../navigation/routeur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### État à gérer (StatefulWidget)
```dart
final TextEditingController _controlleur = TextEditingController();
Etudiant? _etudiantTrouve;
String _messageErreur = '';
```

---

## 7. NABO — Page Scanner QR

**Fichier :** `lib/ecrans/transfert/page_scanner_qr.dart`
**Reçoit :** rien (pas d'argument)

### Rôle
Ouvre la caméra pour scanner le QR code d'un autre étudiant.
Extrait le matricule du QR code, cherche l'étudiant, puis navigue vers le montant.

### Structure visuelle (du haut vers le bas)
```
← (flèche retour)
Titre : "Scanner le QR code"

MobileScanner (zone caméra plein écran)

Cadre de ciblage au centre (carré avec coins arrondis)

Texte en bas : "Pointez la caméra vers le QR code"
```

### Logique
```dart
// Format du QR code : "FLEXFOOD-22-ESATIC-0012-b2c3d4e5"
// Extraire le matricule
List<String> parties = code.split('-');
// parties[0] = "FLEXFOOD"
// parties[1] = "22"
// parties[2] = "ESATIC"
// parties[3] = "0012"
// parties[4] = "b2c3d4e5" (à ignorer)

String matricule = '${parties[1]}-${parties[2]}-${parties[3]}';
// → "22-ESATIC-0012"

// Vérifier que c'est bien un QR FlexFood
if (!code.startsWith('FLEXFOOD')) → ignorer

// Chercher l'étudiant
Etudiant? etudiant = ServiceTransactions.chercherEtudiantParMatricule(matricule);
if (etudiant != null)
  Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
```

### Composants à utiliser
```dart
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../services/service_transactions.dart';
import '../../navigation/routeur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### Code de base MobileScanner
```dart
MobileScanner(
  onDetect: (capture) {
    final List<Barcode> codes = capture.barcodes;
    for (final code in codes) {
      final String? valeur = code.rawValue;
      if (valeur != null) {
        _traiterCode(valeur);
      }
    }
  },
)
```

---
---

# MOÏSE

---

## 8. MOÏSE — Page Montant Transfert

**Fichier :** `lib/ecrans/transfert/page_montant_transfert.dart`
**Reçoit :** `final Etudiant etudiant;` (dans le constructeur)

### Rôle
Permet de saisir le montant à envoyer à un étudiant identifié.
Valide que le montant est multiple de 100 et que le solde est suffisant,
puis effectue le transfert.

### Structure visuelle (du haut vers le bas)
```
← (flèche retour)
Titre : "Envoyer de l'argent"

AvatarUtilisateur (initiales du destinataire)
Nom du destinataire : etudiant.nomComplet
Matricule : etudiant.matricule

Montant affiché (mis à jour en temps réel) :
  "0 FCFA"  →  "500 FCFA"  →  "1 500 FCFA"

Message d'erreur (si règle violée)

ClavierNumerique (avecVirgule: false)

BoutonPrincipal "Envoyer"
```

### Logique
```dart
// Le clavier envoie des chiffres un par un
// Construire le montant : "0" → appui "5" → "5" → appui "0" → "50" → appui "0" → "500"

// Validation au moment d'appuyer sur "Envoyer"
if (_montant <= 0)
  → "Entrez un montant"
if (_montant % 100 != 0)
  → "Le montant doit être un multiple de 100 FCFA"

// Effectuer le transfert
Transaction? transaction = ServiceTransactions.effectuerTransfert(
  etudiant.matricule,
  _montant,
);

if (transaction == null)
  → "Solde insuffisant"
if (transaction != null)
  → Navigator.pushNamed(context, Routes.confirmationTransfertEnvoye, arguments: transaction)
```

### Composants à utiliser
```dart
import '../../composants/clavier_numerique.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../composants/bouton_principal.dart';
import '../../modeles/etudiant.dart';
import '../../modeles/transaction.dart';
import '../../services/service_transactions.dart';
import '../../navigation/routeur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
```

### État à gérer (StatefulWidget)
```dart
int _montant = 0;
String _messageErreur = '';

void _ajouterChiffre(String chiffre) {
  setState(() {
    if (chiffre == '⌫') {
      // Supprimer le dernier chiffre
      if (_montant > 0) _montant = _montant ~/ 10;
    } else {
      _montant = _montant * 10 + int.parse(chiffre);
    }
    _messageErreur = '';
  });
}
```

---

## 9. MOÏSE — Page Confirmation Transfert Envoyé

**Fichier :** `lib/ecrans/confirmations/page_confirmation_transfert_envoye.dart`
**Reçoit :** `final Transaction transaction;` (dans le constructeur)

### Rôle
Confirme que le transfert a bien été envoyé. Affiche le destinataire,
le montant débité, la date et la référence.

### Structure visuelle (du haut vers le bas)
```
Icône succès (grand cercle vert avec coche ✓)
Titre : "Transfert envoyé !"
Sous-titre : "Votre argent a bien été envoyé"

Montant : "-500 FCFA" (en grand, rouge)

CarteDetailTransaction contenant :
  LigneDetail → icône: person      | label: "Destinataire" | valeur: transaction.autrePartiNom
  LigneDetail → icône: badge       | label: "Matricule"    | valeur: transaction.autrePartiMatricule
  LigneDetail → icône: event       | label: "Date"         | valeur: date formatée
  LigneDetail → icône: receipt     | label: "Référence"    | valeur: transaction.id
  LigneDetail → icône: payments    | label: "Montant"      | valeur: montant formaté

BoutonPrincipal "Retour à l'accueil"
  → Navigator.pushNamedAndRemoveUntil(context, Routes.accueil, (_) => false)
```

### Composants à utiliser
```dart
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/bouton_principal.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
```

### Données disponibles via `transaction`
```dart
transaction.autrePartiNom          // "Kyra"
transaction.autrePartiMatricule    // "22-ESATIC-0012"
transaction.montant                // -500
transaction.dateHeure              // DateTime
transaction.id                     // "#4503"
Formateur.formaterDate(transaction.dateHeure)           // "Aujourd'hui, 14:30"
Formateur.formaterMontantTransaction(transaction.montant) // "-500 FCFA"
```

---

## 10. MOÏSE — Page Confirmation Transfert Reçu

**Fichier :** `lib/ecrans/confirmations/page_confirmation_transfert_recu.dart`
**Reçoit :** `final Transaction transaction;` (dans le constructeur)

### Rôle
Confirme qu'un transfert a bien été reçu. Similaire à la confirmation envoyé
mais du point de vue du destinataire : montant en vert, libellé "De" au lieu de "À".

> Note : cet écran est affiché automatiquement si l'app détecte un transfert entrant.
> Pour la démo, il sera déclenché manuellement depuis le tableau de bord.

### Structure visuelle (du haut vers le bas)
```
Icône succès (grand cercle vert avec coche ✓)
Titre : "Transfert reçu !"
Sous-titre : "Vous avez reçu de l'argent"

Montant : "+500 FCFA" (en grand, vert)

CarteDetailTransaction contenant :
  LigneDetail → icône: person      | label: "Expéditeur"  | valeur: transaction.autrePartiNom
  LigneDetail → icône: badge       | label: "Matricule"   | valeur: transaction.autrePartiMatricule
  LigneDetail → icône: event       | label: "Date"        | valeur: date formatée
  LigneDetail → icône: receipt     | label: "Référence"   | valeur: transaction.id
  LigneDetail → icône: payments    | label: "Montant"     | valeur: montant formaté

BoutonPrincipal "Retour à l'accueil"
  → Navigator.pushNamedAndRemoveUntil(context, Routes.accueil, (_) => false)
```

### Composants à utiliser
```dart
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/bouton_principal.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
```

### Différence avec la page "Envoyé"
| Élément | Transfert Envoyé | Transfert Reçu |
|---------|-----------------|----------------|
| Titre | "Transfert envoyé !" | "Transfert reçu !" |
| Montant couleur | Rouge (négatif) | Vert (positif) |
| Label personne | "Destinataire" | "Expéditeur" |

---

## RÈGLES COMMUNES À TOUS LES ÉCRANS

1. **Fond de page** → `Couleurs.fondPrincipal` (`#FAF9F6`)
2. **Flèche retour** → `Navigator.pop(context)` dans un `IconButton`
3. **Tous les noms en français** (variables, fonctions, classes)
4. **StatefulWidget** si l'écran a une saisie ou un état qui change
5. **StatelessWidget** si l'écran affiche juste des données reçues en argument
