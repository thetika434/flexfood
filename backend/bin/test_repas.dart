import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl: 'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  const codeQr = 'FLEXFOOD-25-ESATIC0698BC-1779124491153';

  try {
    print('Recherche par codeQr: $codeQr');
    final etudiant = await prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(codeQr: codeQr),
    );
    if (etudiant == null) {
      print('Étudiant introuvable');
    } else {
      print('Trouvé: ${etudiant.prenom} ${etudiant.nom}, solde: ${etudiant.solde}');
    }
  } catch (e, st) {
    print('ERREUR: $e');
    print(st);
  }

  await prisma.$disconnect();
}
