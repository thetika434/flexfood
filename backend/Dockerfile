# ── Étape 1 : compilation + téléchargement du query engine ───────────────────
FROM dart:stable AS build

# Installer Node.js pour que npm télécharge le bon query engine Prisma
RUN apt-get update && apt-get install -y nodejs npm --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Dépendances npm + Dart
COPY package.json package-lock.json pubspec.yaml pubspec.lock ./
RUN npm install
RUN dart pub get --no-example

# Copier le source complet
COPY . .

# Patcher dart_wrapper.sh pour utiliser le dart de Docker
RUN printf '#!/bin/sh\nexec dart "$@"\n' > dart_wrapper.sh && chmod +x dart_wrapper.sh

# Télécharge le query engine Linux/Debian ET régénère le client Dart
RUN npx prisma generate

# Compiler en binaire natif autonome
RUN dart compile exe bin/serveur.dart -o bin/serveur

# ── Étape 2 : image minimale d'exécution ─────────────────────────────────────
FROM debian:bookworm-slim

WORKDIR /app

# Serveur compilé
COPY --from=build /app/bin/serveur ./serveur

# Query engine téléchargé pour linux/debian-openssl-3.0.x
COPY --from=build /app/node_modules/prisma/query-engine-debian-openssl-3.0.x ./prisma/prisma-query-engine
RUN chmod +x ./prisma/prisma-query-engine

# Variables d'environnement (à surcharger au déploiement)
ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
