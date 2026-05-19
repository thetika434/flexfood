import 'package:bcrypt/bcrypt.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl:
        'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  // Code secret partagé par tous les agents
  const codeSecret = '0000';
  final hash = BCrypt.hashpw(codeSecret, BCrypt.gensalt());

  try {
    await prisma.agent.upsert(
      where: AgentWhereUniqueInput(matricule: 'AGENT-001'),
      create: PrismaUnion.$1(AgentCreateInput(
        matricule: 'AGENT-001',
        nom: 'FlexFood',
        prenom: 'Agent',
        codeSecret: hash,
        poste: PrismaUnion.$1('Cafétéria ESATIC'),
      )),
      update: PrismaUnion.$1(AgentUpdateInput(
        codeSecret: PrismaUnion.$1(hash),
      )),
    );
    print('✅ Agent créé — code secret : $codeSecret');
  } catch (e) {
    print('❌ Erreur : $e');
  }

  await prisma.$disconnect();
}
