import 'package:bcrypt/bcrypt.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl: 'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  const matricule = '25-ESATIC0372CJ';
  const code = '1234';
  final hash = BCrypt.hashpw(code, BCrypt.gensalt());
  final codeQr = 'FLEXFOOD-$matricule-${DateTime.now().millisecondsSinceEpoch}';

  await prisma.etudiant.upsert(
    where: EtudiantWhereUniqueInput(matricule: matricule),
    create: PrismaUnion.$1(EtudiantCreateInput(
      matricule: matricule,
      nom: 'Thetika',
      prenom: 'Josue',
      solde: 0,
      codeSecret: hash,
      codeQr: codeQr,
    )),
    update: PrismaUnion.$1(EtudiantUpdateInput(
      nom: PrismaUnion.$1('Thetika'),
      prenom: PrismaUnion.$1('Josue'),
      codeSecret: PrismaUnion.$1(hash),
      codeQr: PrismaUnion.$1(codeQr),
    )),
  );

  await prisma.$disconnect();
}
