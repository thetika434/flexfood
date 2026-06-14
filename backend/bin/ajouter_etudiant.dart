/// Usage : dart run bin/ajouter_etudiant.dart <matricule> <prenom> <nom> <pin> [role]
/// Exemple étudiant  : dart run bin/ajouter_etudiant.dart 25-ESATIC0001 Kouame Ange 1234
/// Exemple enseignant: dart run bin/ajouter_etudiant.dart ENS-2024-001 Jean Kouassi 0000 enseignant

import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:uuid/uuid.dart';

const _dbUrl =
    'postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway';

void main(List<String> args) async {
  if (args.length < 4) {
    print('Usage: dart run bin/ajouter_etudiant.dart <matricule> <prenom> <nom> <pin>');
    print('Exemple: dart run bin/ajouter_etudiant.dart 25-ESATIC0001 Kouame Ange 1234');
    exit(1);
  }

  final matricule = args[0];
  final prenom    = args[1];
  final nom       = args[2];
  final pin       = args[3];
  final role      = args.length >= 5 ? args[4] : 'etudiant';

  if (!RegExp(r'^\d{4}$').hasMatch(pin)) {
    print('Erreur : le PIN doit être composé de 4 chiffres.');
    exit(1);
  }

  final codeSecret = BCrypt.hashpw(pin, BCrypt.gensalt());
  final codeQr     = 'FLEXFOOD-$matricule-${const Uuid().v4()}';

  final sql = """
INSERT INTO etudiants (matricule, nom, prenom, solde, code_secret, code_qr, role)
VALUES ('$matricule', '$nom', '$prenom', 0, '$codeSecret', '$codeQr', '$role')
ON CONFLICT (matricule) DO NOTHING
RETURNING id, matricule, nom, prenom, role;
""";

  final result = await Process.run('psql', [_dbUrl, '-c', sql]);

  if (result.exitCode != 0) {
    print('Erreur psql : ${result.stderr}');
    exit(1);
  }

  final output = result.stdout as String;

  if (output.contains('INSERT 0 0') || output.contains('(0 rows)')) {
    print('Erreur : le matricule "$matricule" existe déjà.');
    exit(1);
  }

  print('');
  print('Étudiant ajouté avec succès !');
  print('  Matricule : $matricule');
  print('  Prénom    : $prenom');
  print('  Nom       : $nom');
  print('  Solde     : 0 FCFA');
  print('  PIN       : $pin');
  print('  QR Code   : $codeQr');
  print('');
}
