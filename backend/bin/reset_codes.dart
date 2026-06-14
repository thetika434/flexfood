import 'package:bcrypt/bcrypt.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl: 'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  const nouveauCode = '1234';
  const matricules = [
    '25-ESATIC0698BC',
    '25-ESATIC0703AB',
    '25-ESATIC0715DN',
    '25-ESATIC0724AD',
    '25-ESATIC0753AC',
    '25-ESATIC0757AM',
    '25-ESATIC0761DG',
    '25-ESATIC0769WM',
  ];

  final hash = BCrypt.hashpw(nouveauCode, BCrypt.gensalt());

  for (final matricule in matricules) {
    await prisma.etudiant.update(
      where: EtudiantWhereUniqueInput(matricule: matricule),
      data: PrismaUnion.$1(
        EtudiantUpdateInput(
          codeSecret: PrismaUnion.$1(hash),
        ),
      ),
    );
    print('✅ $matricule → code réinitialisé à $nouveauCode');
  }

  await prisma.$disconnect();
  print('\nTerminé !');
}
