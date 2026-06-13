import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

class ServiceEtudiants {
  ServiceEtudiants(this._prisma);

  final PrismaClient _prisma;

  Future<Map<String, dynamic>?> obtenirProfil(int etudiantId) async {
    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(id: etudiantId),
    );
    if (etudiant == null) return null;

    return {
      'matricule': etudiant.matricule,
      'nom': etudiant.nom,
      'prenom': etudiant.prenom,
      'solde': etudiant.solde,
      'codeQr': etudiant.codeQr,
    };
  }

  Future<Map<String, dynamic>?> chercherParMatricule(String matricule) async {
    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(matricule: matricule),
    );
    if (etudiant == null) return null;

    return {
      'matricule': etudiant.matricule,
      'nom': etudiant.nom,
      'prenom': etudiant.prenom,
    };
  }

  Future<List<Map<String, dynamic>>> obtenirFavoris(int etudiantId) async {
    final rows = await _prisma.$raw.query(
      '''
      SELECT e.matricule, e.nom, e.prenom, COUNT(*) as nb
      FROM transactions t
      JOIN etudiants e ON e.matricule = t.autre_parti_matricule
      WHERE t.etudiant_id = \$1 AND t.type = 'transfert_envoye'
        AND t.autre_parti_matricule IS NOT NULL
      GROUP BY e.matricule, e.nom, e.prenom
      ORDER BY nb DESC
      LIMIT 5
      ''',
      [etudiantId],
    );

    return rows.map((r) => {
      'matricule': r['matricule'],
      'nom': r['nom'],
      'prenom': r['prenom'],
    }).toList();
  }
}
