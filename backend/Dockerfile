# ── Étape 1 : compilation ─────────────────────────────────────────────────────
FROM dart:stable AS build

WORKDIR /app

# Copier les manifestes en premier pour profiter du cache layer
COPY pubspec.yaml pubspec.lock ./
RUN dart pub get --no-example

# Copier le reste du code source (client Prisma généré inclus)
COPY . .

# Compiler en binaire natif autonome (pas besoin du SDK Dart à l'exécution)
RUN dart compile exe bin/serveur.dart -o bin/serveur

# ── Étape 2 : image minimale d'exécution ─────────────────────────────────────
FROM debian:bookworm-slim

WORKDIR /app

# Copier uniquement le binaire compilé
COPY --from=build /app/bin/serveur ./serveur

# Variables d'environnement (à surcharger au déploiement)
ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
