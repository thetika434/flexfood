-- CreateTable
CREATE TABLE "etudiants" (
    "id" SERIAL NOT NULL,
    "matricule" VARCHAR(20) NOT NULL,
    "nom" VARCHAR(50) NOT NULL,
    "prenom" VARCHAR(50) NOT NULL,
    "solde" INTEGER NOT NULL DEFAULT 0,
    "code_secret" VARCHAR(100) NOT NULL,
    "code_qr" VARCHAR(100) NOT NULL,

    CONSTRAINT "etudiants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transactions" (
    "id" VARCHAR(10) NOT NULL,
    "type" VARCHAR(30) NOT NULL,
    "montant" INTEGER NOT NULL,
    "date_heure" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "etudiant_id" INTEGER NOT NULL,
    "autre_parti_matricule" VARCHAR(20),
    "service" VARCHAR(10),

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sessions" (
    "id" SERIAL NOT NULL,
    "etudiant_id" INTEGER NOT NULL,
    "token" TEXT NOT NULL,
    "date_expiration" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "agents" (
    "id" SERIAL NOT NULL,
    "matricule" VARCHAR(20) NOT NULL,
    "nom" VARCHAR(50) NOT NULL,
    "prenom" VARCHAR(50) NOT NULL,
    "code_secret" VARCHAR(100) NOT NULL,
    "poste" VARCHAR(50),

    CONSTRAINT "agents_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "etudiants_matricule_key" ON "etudiants"("matricule");

-- CreateIndex
CREATE UNIQUE INDEX "etudiants_code_qr_key" ON "etudiants"("code_qr");

-- CreateIndex
CREATE UNIQUE INDEX "agents_matricule_key" ON "agents"("matricule");

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_etudiant_id_fkey" FOREIGN KEY ("etudiant_id") REFERENCES "etudiants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_etudiant_id_fkey" FOREIGN KEY ("etudiant_id") REFERENCES "etudiants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
