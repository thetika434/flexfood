# ── Stage 1 : compilation Dart (musl pour Alpine) ────────────────────────────
FROM ghcr.io/dart-musl/dart:3.8.0 AS dart-builder

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

# Patcher dart_wrapper.sh pour que npx prisma generate ne bloque pas
RUN printf '#!/bin/sh\n' > dart_wrapper.sh && chmod +x dart_wrapper.sh

RUN npm install && npx prisma generate

# ── Stage 3 : image finale minimale ──────────────────────────────────────────
FROM alpine:3.22

RUN apk add --no-cache libgcc libstdc++ openssl

WORKDIR /app

COPY --from=dart-builder /app/bin/serveur ./serveur
COPY --from=prisma-builder /app/prisma/prisma-query-engine ./prisma/prisma-query-engine

ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
