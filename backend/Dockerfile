# ── Stage 1 : compilation Dart (Debian/glibc) ────────────────────────────────
FROM dart:stable AS dart-builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get --no-example

COPY . .

RUN dart compile exe bin/serveur.dart -o bin/serveur

# ── Stage 2 : téléchargement du query engine Prisma (Debian) ─────────────────
FROM node:20-bookworm-slim AS prisma-builder

WORKDIR /app

COPY package.json package-lock.json ./
COPY prisma/ ./prisma/

# Forcer le téléchargement du moteur binaire natif Debian
RUN sed -i \
    -e 's|provider = "./dart_wrapper.sh run orm"|provider = "prisma-client-js"|' \
    -e '/provider = "prisma-client-js"/a\  engineType = "binary"' \
    prisma/schema.prisma
RUN npm install && npx prisma generate

# Copier le binaire engine vers un chemin fixe
RUN find /app/node_modules -name "query-engine-*" -not -name "*.js" -not -name "*.json" -not -name "*.ts" -type f \
    | head -1 | xargs -I{} cp {} /app/engine \
    && ls -lh /app/engine

# ── Stage 3 : image finale Debian slim ───────────────────────────────────────
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=dart-builder /app/bin/serveur ./serveur
COPY --from=prisma-builder /app/engine ./prisma/prisma-query-engine

RUN chmod +x ./serveur ./prisma/prisma-query-engine \
    && ./prisma/prisma-query-engine --version

ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
