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
}
