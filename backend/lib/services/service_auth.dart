import 'package:bcrypt/bcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

const _cleSecrete = 'flexfood_jwt_secret_2024';
const _dureeToken = Duration(days: 7);

class ServiceAuth {
  ServiceAuth(this._prisma);

  final PrismaClient _prisma;

  Future<Map<String, dynamic>?> connexion(
    String matricule,
    String codeSecret,
  ) async {
    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(matricule: matricule),
    );
    if (etudiant == null) return null;

    final valide = BCrypt.checkpw(codeSecret, etudiant.codeSecret!);
    if (!valide) return null;

    final token = _genererToken(etudiant.id!, matricule);

    return {
      'token': token,
      'etudiant': {
        'matricule': etudiant.matricule,
        'nom': etudiant.nom,
        'prenom': etudiant.prenom,
        'solde': etudiant.solde,
        'codeQr': etudiant.codeQr,
      },
    };
  }

  Future<bool> verifierPin(int etudiantId, String codeSecret) async {
    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(id: etudiantId),
    );
    if (etudiant == null) return false;
    return BCrypt.checkpw(codeSecret, etudiant.codeSecret!);
  }

  Future<bool> changerCode(
    int etudiantId,
    String ancienCode,
    String nouveauCode,
  ) async {
    final valide = await verifierPin(etudiantId, ancienCode);
    if (!valide) return false;

    final nouveauHash = BCrypt.hashpw(nouveauCode, BCrypt.gensalt());
    await _prisma.etudiant.update(
      where: EtudiantWhereUniqueInput(id: etudiantId),
      data: PrismaUnion.$1(
        EtudiantUpdateInput(
          codeSecret: PrismaUnion.$1(nouveauHash),
        ),
      ),
    );
    return true;
  }

  String _genererToken(int etudiantId, String matricule) {
    final jwt = JWT(
      {'etudiantId': etudiantId, 'matricule': matricule},
      issuer: 'flexfood',
    );
    return jwt.sign(
      SecretKey(_cleSecrete),
      expiresIn: _dureeToken,
    );
  }

  static int? extraireEtudiantId(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(_cleSecrete));
      return jwt.payload['etudiantId'] as int?;
    } catch (_) {
      return null;
    }
  }
}
