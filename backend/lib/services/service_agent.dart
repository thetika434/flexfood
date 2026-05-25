import 'package:bcrypt/bcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

const _cleSecrete = 'flexfood_jwt_secret_2024';
const _dureeToken = Duration(days: 30);

// Créneaux repas : nom, début (minutes), fin (minutes), montant FCFA
const _creneaux = [
  {'nom': 'petit_dejeuner', 'debut': 300, 'fin': 480, 'montant': 100},  // 5h00-8h00
  {'nom': 'dejeuner',       'debut': 690, 'fin': 840, 'montant': 200},  // 11h30-14h00
  {'nom': 'diner',          'debut': 1050,'fin': 1200,'montant': 200},  // 17h30-20h00
];

class ServiceAgent {
  ServiceAgent(this._prisma);

  final PrismaClient _prisma;

  // ── Authentification ──────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> connexion(String codeSecret) async {
    final agents = await _prisma.agent.findMany();
    if (agents.isEmpty) return null;

    for (final agent in agents) {
      if (agent.codeSecret != null &&
          BCrypt.checkpw(codeSecret, agent.codeSecret!)) {
        final token = _genererToken();
        return {
          'token': token,
          'agent': {
            'nom': agent.nom,
            'prenom': agent.prenom,
            'poste': agent.poste,
          },
        };
      }
    }
    return null;
  }

  String _genererToken() {
    final jwt = JWT({'role': 'agent'}, issuer: 'flexfood');
    return jwt.sign(SecretKey(_cleSecrete), expiresIn: _dureeToken);
  }

  static bool verifierToken(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(_cleSecrete));
      return jwt.payload['role'] == 'agent';
    } catch (_) {
      return false;
    }
  }

  // ── Repas ─────────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> effectuerRepas(String codeQr) async {
    final matricule = _extraireMatricule(codeQr);
    if (matricule == null) throw InvalidQrException();

    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(codeQr: codeQr),
    );
    if (etudiant == null) throw EtudiantIntrouvableException();

    final creneau = _creneauActif();
    final montant = creneau != null ? creneau['montant'] as int : 200;
    final serviceNom = creneau?['nom'] as String? ?? _serviceParHeure();
    if ((etudiant.solde ?? 0) < montant) throw SoldeInsuffisantException();

    final maintenant = DateTime.now();
    final idTransaction = '#${_genererIdTransaction()}';

    await _prisma.etudiant.update(
      where: EtudiantWhereUniqueInput(id: etudiant.id),
      data: PrismaUnion.$1(
        EtudiantUpdateInput(
          solde: PrismaUnion.$1((etudiant.solde ?? 0) - montant),
        ),
      ),
    );

    await _prisma.transaction.create(
      data: PrismaUnion.$1(
        TransactionCreateInput(
          id: idTransaction,
          type: 'repas',
          montant: -montant,
          dateHeure: maintenant,
          service: PrismaUnion.$1(serviceNom),
          etudiant: EtudiantCreateNestedOneWithoutTransactionsInput(
            connect: EtudiantWhereUniqueInput(id: etudiant.id),
          ),
        ),
      ),
    );

    return {
      'id': idTransaction,
      'type': 'repas',
      'montant': -montant,
      'dateHeure': maintenant.toIso8601String(),
      'service': serviceNom,
      'etudiant': {
        'matricule': etudiant.matricule,
        'nom': etudiant.nom,
        'prenom': etudiant.prenom,
        'soldeApres': (etudiant.solde ?? 0) - montant,
      },
    };
  }

  // ── Rechargement ──────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> effectuerRechargement(
    String matricule,
    int montant,
  ) async {
    final etudiant = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(matricule: matricule),
    );
    if (etudiant == null) throw EtudiantIntrouvableException();

    final maintenant = DateTime.now();
    final idTransaction = '#${_genererIdTransaction()}';

    await _prisma.etudiant.update(
      where: EtudiantWhereUniqueInput(id: etudiant.id),
      data: PrismaUnion.$1(
        EtudiantUpdateInput(
          solde: PrismaUnion.$1((etudiant.solde ?? 0) + montant),
        ),
      ),
    );

    await _prisma.transaction.create(
      data: PrismaUnion.$1(
        TransactionCreateInput(
          id: idTransaction,
          type: 'rechargement',
          montant: montant,
          dateHeure: maintenant,
          etudiant: EtudiantCreateNestedOneWithoutTransactionsInput(
            connect: EtudiantWhereUniqueInput(id: etudiant.id),
          ),
        ),
      ),
    );

    return {
      'id': idTransaction,
      'type': 'rechargement',
      'montant': montant,
      'dateHeure': maintenant.toIso8601String(),
      'etudiant': {
        'matricule': etudiant.matricule,
        'nom': etudiant.nom,
        'prenom': etudiant.prenom,
        'soldeApres': (etudiant.solde ?? 0) + montant,
      },
    };
  }

  // ── Bilan ─────────────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> obtenirBilan() async {
    final debutJour = DateTime.now().copyWith(
      hour: 0, minute: 0, second: 0, millisecond: 0,
    );

    final transactions = await _prisma.transaction.findMany(
      orderBy: PrismaUnion.$2(
        TransactionOrderByWithRelationInput(dateHeure: SortOrder.desc),
      ),
      include: TransactionInclude(
        etudiant: PrismaUnion.$1(true),
      ),
    );

    return transactions
        .where((t) =>
            (t.type == 'repas' || t.type == 'rechargement') &&
            t.dateHeure != null &&
            t.dateHeure!.isAfter(debutJour))
        .map((t) => {
              'id': t.id,
              'type': t.type,
              'montant': t.montant,
              'dateHeure': t.dateHeure?.toIso8601String(),
              'service': t.service,
              'etudiant': {
                'matricule': t.etudiant?.matricule,
                'nom': t.etudiant?.nom,
                'prenom': t.etudiant?.prenom,
              },
            })
        .toList();
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  String _serviceParHeure() {
    final heure = DateTime.now().hour;
    if (heure < 11) return 'petit_dejeuner';
    if (heure < 17) return 'dejeuner';
    return 'diner';
  }

  Map<String, dynamic>? _creneauActif() {
    final now = DateTime.now();
    final minutes = now.hour * 60 + now.minute;
    for (final c in _creneaux) {
      if (minutes >= (c['debut'] as int) && minutes < (c['fin'] as int)) {
        return c;
      }
    }
    return null;
  }

  String? _extraireMatricule(String codeQr) {
    if (!codeQr.startsWith('FLEXFOOD-')) return null;
    final sansPrefix = codeQr.substring('FLEXFOOD-'.length);
    final dernierTiret = sansPrefix.lastIndexOf('-');
    if (dernierTiret == -1) return null;
    return sansPrefix.substring(0, dernierTiret);
  }

  int _compteur = 0;
  String _genererIdTransaction() {
    _compteur = (_compteur + 1) % 100000;
    return _compteur.toString().padLeft(5, '0');
  }
}

// ── Exceptions ────────────────────────────────────────────────────────────────

class InvalidQrException implements Exception {}
class HorsCreneauException implements Exception {}
class EtudiantIntrouvableException implements Exception {}
class SoldeInsuffisantException implements Exception {}
