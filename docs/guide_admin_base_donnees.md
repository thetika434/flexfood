# Guide Administrateur Base de Données — FlexFood
**Destinataire : Loba**
**Projet : FlexFood — Application de paiement cantine ESATIC**
**Date : 10 juin 2026**

---

## 1. Présentation du projet

FlexFood est une application mobile de paiement pour la cantine de l'ESATIC. Elle remplace les cartes RFID physiques par des QR codes numériques.

### Les acteurs

| Acteur | Rôle dans l'app |
|--------|----------------|
| Étudiant | Recharge son compte, paie son repas, transfère de l'argent |
| Agent cantine | Recharge les comptes étudiants, enregistre les repas |
| Administrateur | Gère les comptes depuis un panneau d'administration |

---

## 2. L'architecture — comment tout fonctionne ensemble

```
Téléphone étudiant (Flutter)
        │
        │ HTTPS
        ▼
Backend Dart (Railway)     ← serveur applicatif
        │
        │ SQL
        ▼
PostgreSQL (Railway)       ← tu travailles ici
```

### Pourquoi cette architecture ?

**Le téléphone** ne contient aucune donnée permanente. Il affiche uniquement ce que le serveur lui envoie.

**Le backend Dart** est le cerveau. Il reçoit les demandes du téléphone, vérifie les règles métier (solde suffisant, montant valide...) et communique avec la base de données.

**La base de données PostgreSQL** est le grand registre. Tout ce qui doit être mémorisé y est stocké : les étudiants, leurs soldes, toutes les transactions. C'est la seule source de vérité du système.

### Ce que ça implique pour toi

Tu travailles sur la dernière couche. Ce que tu fais n'affecte pas directement l'app. Mais si tu modifies ou supprimes des données par erreur, l'app affichera des informations incorrectes aux étudiants. C'est pourquoi ton travail demande de la rigueur.

---

## 3. Accès à la base de données

### Tes informations de connexion

```
Hôte     : zephyr.proxy.rlwy.net
Port     : 54918
Base     : railway
Login    : admin_db
Mot de passe : (fourni par Joshua)
```

### Se connecter depuis le terminal

```bash
psql postgresql://admin_db:MOT_DE_PASSE@zephyr.proxy.rlwy.net:54918/railway   "TON Mot de passe est :loba "
```

Quand tu vois `railway=>` tu es connecté et prêt.

### Commandes de base dans le terminal

```bash
\dt                  # lister toutes les tables
\dn                  # lister tous les schémas
\d etudiants         # voir la structure de la table etudiants
\q                   # quitter
```

---

## 4. Structure de la base de données

### Table `etudiants`

Contient tous les étudiants enregistrés dans l'app.

| Colonne | Type | Description |
|---------|------|-------------|
| id | INTEGER | Identifiant unique auto-incrémenté |
| matricule | VARCHAR | Ex: 25-ESATIC-0001 |
| nom | VARCHAR | Nom de famille |
| prenom | VARCHAR | Prénom |
| code_secret | VARCHAR | PIN haché BCrypt — illisible intentionnellement |
| solde | INTEGER | Argent disponible en FCFA |
| qr_code_uuid | VARCHAR | UUID unique pour le QR code de l'étudiant |
| created_at | TIMESTAMP | Date de création du compte |

### Table `transactions`

Enregistre chaque mouvement d'argent.

| Colonne | Type | Description |
|---------|------|-------------|
| id | VARCHAR(36) | UUID unique de la transaction |
| etudiant_id | INTEGER | Référence vers etudiants.id |
| montant | INTEGER | Montant en FCFA |
| type | VARCHAR | repas / rechargement / transfert_envoye / transfert_recu |
| date | TIMESTAMP | Date et heure de la transaction |
| description | TEXT | Détails supplémentaires |

### Table `agents`

Contient les agents de cantine.

| Colonne | Type | Description |
|---------|------|-------------|
| id | INTEGER | Identifiant unique |
| nom | VARCHAR | Nom de l'agent |
| code_secret | VARCHAR | Mot de passe haché BCrypt |

---

## 5. Pourquoi le code secret est illisible

Dans la base de données, le PIN de chaque étudiant ressemble à ceci :

```
$2b$12$xK9mN3pQrS7tUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYzAbCdEfGh
```

Ce n'est pas un bug. C'est voulu. Voici pourquoi.

### Le problème si on stockait le vrai PIN

Si on stockait `1234` directement en base, n'importe qui ayant accès à la base verrait le PIN de tous les étudiants et pourrait se connecter à leurs comptes. C'est inacceptable.

### La solution — le hachage BCrypt

Le PIN passe dans un algorithme appelé **BCrypt** qui le transforme en une chaîne illisible et irréversible.

```
PIN original          Après BCrypt
    │                     │
  "1234"    ──────►   "$2b$12$xK9mN3..."
                          │
                    illisible et irréversible
```

**Irréversible** signifie qu'il est mathématiquement impossible de retrouver `1234` à partir de `$2b$12$xK9mN3...`. Même les développeurs ne peuvent pas lire les vrais PIN.

### Comment la vérification fonctionne alors

```
Étudiant tape "1234"
      │
      ▼
BCrypt transforme "1234" → "$2b$12$xK9mN3..."
      │
      ▼
Compare avec ce qui est stocké en base
      │
      ▼
Identique → ✅ connexion autorisée
Différent → ❌ connexion refusée
```

BCrypt ne déchiffre jamais. Il refait le calcul et compare. C'est la seule façon de vérifier sans jamais stocker le vrai PIN.

> **Conclusion : ne jamais modifier le code_secret directement en base. Tu casserais la connexion de l'étudiant.**

---

## 6. Règles métier importantes

Ces règles définissent comment les données fonctionnent dans l'app.

| Règle | Explication |
|-------|-------------|
| Solde jamais négatif | Un étudiant ne peut pas envoyer plus que son solde |
| Montant multiple de 100 | On ne peut pas envoyer 150 FCFA, seulement 100, 200, 500... |
| Un transfert = 2 lignes | Quand Jean envoie à Marie : 1 ligne `transfert_envoye` pour Jean + 1 ligne `transfert_recu` pour Marie |
| UUID fixe | Le QR code UUID d'un étudiant ne change jamais |
| PIN illisible | BCrypt rend le PIN illisible même pour l'administrateur — c'est voulu |

---

## 7. Tes droits

### Ce que tu PEUX faire

- Lire toutes les tables
- Créer des vues et tables dans le schéma `audit`
- Analyser les données pour produire des rapports

### Ce que tu NE PEUX PAS faire (bloqué automatiquement)

- Modifier les soldes des étudiants
- Supprimer des transactions
- Modifier la structure des tables existantes
- Supprimer des tables

### Règle importante

> Avant toute opération inhabituelle, préviens moi d'abord mon petit.

---

## 8. Ton espace de travail — le schéma audit

Tu travailles exclusivement dans le schéma `audit`. C'est un espace séparé créé spécialement pour toi. Il ne touche pas aux données principales.

```
Base railway
├── Schéma public (données principales — tu lis seulement)
│   ├── etudiants
│   ├── transactions
│   └── agents
│
└── Schéma audit (ton espace de travail — tu as tous les droits)
    ├── (tes vues ici)
    └── (tes tables ici)
```

Pour travailler dans le schéma audit :

```sql
SET search_path TO audit, public;
```

---

## 9. Ton rôle en général

Tu es le **gardien des données** de FlexFood. Ton travail couvre trois grandes responsabilités.

### Responsabilité 1 — Les sauvegardes

C'est la priorité absolue. Si la base se corrompt ou si des données sont effacées par erreur, les sauvegardes permettent de tout récupérer. Tu dois faire des sauvegardes régulières depuis ton terminal et les conserver sur ton PC.

```bash
pg_dump postgresql://admin_db:MOT_DE_PASSE@zephyr.proxy.rlwy.net:54918/railway > sauvegarde_AAAA_MM_JJ.sql
```

### Responsabilité 2 — La surveillance et l'audit

Tu dois mettre en place des outils pour détecter les anomalies automatiquement. Par exemple :
- Un étudiant avec un solde négatif (ne devrait jamais arriver)
- Des transactions avec un montant suspect
- Des écarts inexpliqués dans les soldes

Tu dois aussi pouvoir produire des bilans à la demande : bilan journalier, bilan mensuel, historique complet d'un étudiant.

### Responsabilité 3 — Le support aux investigations

Quand un étudiant signale un problème ("mon solde a disparu", "je n'ai pas reçu mon transfert"), tu dois pouvoir retrouver rapidement ce qui s'est passé dans les données et fournir une réponse claire

---

## 10. Ce que tu dois documenter

Chaque vue ou table que tu crées doit être documentée dans un fichier séparé :

```
Nom        : nom de la vue ou table
Date       : date de création
Objectif   : à quoi elle sert
Utilisation: comment s'en servir
```

Si tu n'es plus disponible un jour, quelqu'un d'autre doit pouvoir reprendre ton travail sans te demander.

---



>   Ton rôle est de t'assurer que les données sont **fiables, sauvegardées et analysables**. Quand tu as un doute sur une opération, demande moi mon petit n'est pas honte
