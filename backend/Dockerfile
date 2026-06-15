# ── Stage 1 : compilation Dart (Debian/glibc) ────────────────────────────────
FROM dart:stable AS dart-builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get --no-example

COPY . .

RUN dart compile exe bin/serveur.dart -o bin/serveur

# ── Stage 2 : image finale Debian slim ───────────────────────────────────────
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl3 \
    libzstd1 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=dart-builder /app/bin/serveur ./serveur
COPY engines/prisma-query-engine ./prisma/prisma-query-engine

RUN chmod +x ./serveur ./prisma/prisma-query-engine \
    && ./prisma/prisma-query-engine --version

ENV DATABASE_URL="postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway"
ENV PORT=8080

EXPOSE 8080

CMD ["./serveur"]
