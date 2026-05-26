# ── Stage 1 : compilation Dart (musl pour Alpine) ────────────────────────────
FROM ghcr.io/dart-musl/dart:3.9.4 AS dart-builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get --no-example

COPY . .

RUN dart compile exe bin/serveur.dart -o bin/serveur

# ── Stage 2 : téléchargement du query engine Prisma ──────────────────────────
FROM node:alpine3.22 AS prisma-builder

WORKDIR /app

COPY package.json package-lock.json ./
COPY prisma/ ./prisma/

# Utiliser le provider JS par défaut pour télécharger l'engine sans dart
RUN sed -i 's|provider = "./dart_wrapper.sh run orm"|provider = "prisma-client-js"|' prisma/schema.prisma
RUN npm install && npx prisma generate

# Copier l'engine (peu importe où prisma le place) vers un emplacement fixe
RUN find /app/node_modules -name "query-engine-*" -type f | head -1 | xargs -I{} cp {} /app/engine

# ── Stage 3 : image finale minimale ──────────────────────────────────────────
FROM alpine:3.22

RUN apk add --no-cache libgcc libstdc++ openssl

WORKDIR /app

COPY --from=dart-builder /app/bin/serveur ./serveur
COPY --from=prisma-builder /app/engine ./prisma/prisma-query-engine

ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
