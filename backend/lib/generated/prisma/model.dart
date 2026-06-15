// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class Transaction {
  const Transaction({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  factory Transaction.fromJson(Map json) => Transaction(
    id: json['id'],
    type: json['type'],
    montant: json['montant'],
    dateHeure: switch (json['dateHeure']) {
      DateTime value => value,
      String value => DateTime.parse(value),
      _ => json['dateHeure'],
    },
    etudiantId: json['etudiantId'],
    autrePartiMatricule: json['autrePartiMatricule'],
    service: json['service'],
    etudiant: json['etudiant'] is Map
        ? _i1.Etudiant.fromJson(json['etudiant'])
        : null,
  );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant?.toJson(),
  };
}

class Session {
  const Session({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  factory Session.fromJson(Map json) => Session(
    id: json['id'],
    etudiantId: json['etudiantId'],
    token: json['token'],
    dateExpiration: switch (json['dateExpiration']) {
      DateTime value => value,
      String value => DateTime.parse(value),
      _ => json['dateExpiration'],
    },
    etudiant: json['etudiant'] is Map
        ? _i1.Etudiant.fromJson(json['etudiant'])
        : null,
  );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
    'etudiant': etudiant?.toJson(),
  };
}

class Etudiant {
  const Etudiant({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
    this.sessions,
    this.$count,
  });

  factory Etudiant.fromJson(Map json) => Etudiant(
    id: json['id'],
    matricule: json['matricule'],
    nom: json['nom'],
    prenom: json['prenom'],
    solde: json['solde'],
    codeSecret: json['codeSecret'],
    codeQr: json['codeQr'],
    transactions: (json['transactions'] as Iterable?)?.map(
      (json) => _i1.Transaction.fromJson(json),
    ),
    sessions: (json['sessions'] as Iterable?)?.map(
      (json) => _i1.Session.fromJson(json),
    ),
    $count: json['_count'] is Map
        ? _i2.EtudiantCountOutputType.fromJson(json['_count'])
        : null,
  );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final int? solde;

  final String? codeSecret;

  final String? codeQr;

  final Iterable<_i1.Transaction>? transactions;

  final Iterable<_i1.Session>? sessions;

  final _i2.EtudiantCountOutputType? $count;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions?.map((e) => e.toJson()),
    'sessions': sessions?.map((e) => e.toJson()),
    '_count': $count?.toJson(),
  };
}

class CreateManyEtudiantAndReturnOutputType {
  const CreateManyEtudiantAndReturnOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  factory CreateManyEtudiantAndReturnOutputType.fromJson(Map json) =>
      CreateManyEtudiantAndReturnOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        solde: json['solde'],
        codeSecret: json['codeSecret'],
        codeQr: json['codeQr'],
      );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final int? solde;

  final String? codeSecret;

  final String? codeQr;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
  };
}

class UpdateManyEtudiantAndReturnOutputType {
  const UpdateManyEtudiantAndReturnOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  factory UpdateManyEtudiantAndReturnOutputType.fromJson(Map json) =>
      UpdateManyEtudiantAndReturnOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        solde: json['solde'],
        codeSecret: json['codeSecret'],
        codeQr: json['codeQr'],
      );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final int? solde;

  final String? codeSecret;

  final String? codeQr;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
  };
}

class CreateManyTransactionAndReturnOutputType {
  const CreateManyTransactionAndReturnOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  factory CreateManyTransactionAndReturnOutputType.fromJson(Map json) =>
      CreateManyTransactionAndReturnOutputType(
        id: json['id'],
        type: json['type'],
        montant: json['montant'],
        dateHeure: switch (json['dateHeure']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateHeure'],
        },
        etudiantId: json['etudiantId'],
        autrePartiMatricule: json['autrePartiMatricule'],
        service: json['service'],
        etudiant: json['etudiant'] is Map
            ? _i1.Etudiant.fromJson(json['etudiant'])
            : null,
      );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant?.toJson(),
  };
}

class UpdateManyTransactionAndReturnOutputType {
  const UpdateManyTransactionAndReturnOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  factory UpdateManyTransactionAndReturnOutputType.fromJson(Map json) =>
      UpdateManyTransactionAndReturnOutputType(
        id: json['id'],
        type: json['type'],
        montant: json['montant'],
        dateHeure: switch (json['dateHeure']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateHeure'],
        },
        etudiantId: json['etudiantId'],
        autrePartiMatricule: json['autrePartiMatricule'],
        service: json['service'],
        etudiant: json['etudiant'] is Map
            ? _i1.Etudiant.fromJson(json['etudiant'])
            : null,
      );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant?.toJson(),
  };
}

class CreateManySessionAndReturnOutputType {
  const CreateManySessionAndReturnOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  factory CreateManySessionAndReturnOutputType.fromJson(Map json) =>
      CreateManySessionAndReturnOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: switch (json['dateExpiration']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateExpiration'],
        },
        etudiant: json['etudiant'] is Map
            ? _i1.Etudiant.fromJson(json['etudiant'])
            : null,
      );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
    'etudiant': etudiant?.toJson(),
  };
}

class UpdateManySessionAndReturnOutputType {
  const UpdateManySessionAndReturnOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  factory UpdateManySessionAndReturnOutputType.fromJson(Map json) =>
      UpdateManySessionAndReturnOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: switch (json['dateExpiration']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateExpiration'],
        },
        etudiant: json['etudiant'] is Map
            ? _i1.Etudiant.fromJson(json['etudiant'])
            : null,
      );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  final _i1.Etudiant? etudiant;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
    'etudiant': etudiant?.toJson(),
  };
}

class Agent {
  const Agent({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  factory Agent.fromJson(Map json) => Agent(
    id: json['id'],
    matricule: json['matricule'],
    nom: json['nom'],
    prenom: json['prenom'],
    codeSecret: json['codeSecret'],
    poste: json['poste'],
  );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final String? codeSecret;

  final String? poste;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class CreateManyAgentAndReturnOutputType {
  const CreateManyAgentAndReturnOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  factory CreateManyAgentAndReturnOutputType.fromJson(Map json) =>
      CreateManyAgentAndReturnOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        codeSecret: json['codeSecret'],
        poste: json['poste'],
      );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final String? codeSecret;

  final String? poste;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class UpdateManyAgentAndReturnOutputType {
  const UpdateManyAgentAndReturnOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  factory UpdateManyAgentAndReturnOutputType.fromJson(Map json) =>
      UpdateManyAgentAndReturnOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        codeSecret: json['codeSecret'],
        poste: json['poste'],
      );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final String? codeSecret;

  final String? poste;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}
