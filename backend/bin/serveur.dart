import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/services/service_auth.dart';
import 'package:backend/services/service_etudiants.dart';
import 'package:backend/services/service_transactions.dart';
import 'package:backend/routes/auth_routes.dart';
import 'package:backend/routes/etudiant_routes.dart';
import 'package:backend/routes/transaction_routes.dart';
import 'package:backend/middlewares/auth_middleware.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl:
        'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  final serviceAuth = ServiceAuth(prisma);
  final serviceEtudiants = ServiceEtudiants(prisma);
  final serviceTransactions = ServiceTransactions(prisma);

  final mw = authMiddleware();
  final routeurPrincipal = Router();

  // Route publique (sans token)
  routeurPrincipal.post('/auth/connexion', authRoutes(serviceAuth).call);

  // Routes auth protégées (verifier-pin, changer-code)
  routeurPrincipal.mount(
    '/auth/',
    Pipeline().addMiddleware(mw).addHandler(authRoutes(serviceAuth).call),
  );

  // Routes protégées
  routeurPrincipal.mount(
    '/etudiants/',
    Pipeline().addMiddleware(mw).addHandler(
      etudiantRoutes(serviceEtudiants).call,
    ),
  );
  routeurPrincipal.mount(
    '/transactions/',
    Pipeline().addMiddleware(mw).addHandler(
      transactionRoutes(serviceTransactions).call,
    ),
  );

  // Middleware global : logs
  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(routeurPrincipal.call);

  final serveur = await io.serve(pipeline, InternetAddress.anyIPv4, 8080);
  print('Serveur FlexFood démarré sur http://localhost:${serveur.port}');
}
