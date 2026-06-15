// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/orm.dart' as _i1;

import 'prisma.dart' as _i2;

class EtudiantCountOutputType {
  const EtudiantCountOutputType({this.transactions, this.sessions});

  factory EtudiantCountOutputType.fromJson(Map json) => EtudiantCountOutputType(
    transactions: json['transactions'],
    sessions: json['sessions'],
  );

  final int? transactions;

  final int? sessions;

  Map<String, dynamic> toJson() => {
    'transactions': transactions,
    'sessions': sessions,
  };
}

class NestedIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class IntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

enum QueryMode implements _i1.PrismaEnum {
  $default._('default'),
  insensitive._('insensitive');

  const QueryMode._(this.name);

  @override
  final String name;
}

class NestedStringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class StringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'mode': mode,
    'not': not,
  };
}

class NestedDateTimeFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class DateTimeFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedStringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  $in;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class StringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  $in;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'mode': mode,
    'not': not,
  };
}

class EtudiantScalarRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantScalarRelationFilter({this.$is, this.isNot});

  final _i2.EtudiantWhereInput? $is;

  final _i2.EtudiantWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {'is': $is, 'isNot': isNot};
}

class TransactionWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final _i1.PrismaUnion<
    _i2.TransactionWhereInput,
    Iterable<_i2.TransactionWhereInput>
  >?
  AND;

  final Iterable<_i2.TransactionWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.TransactionWhereInput,
    Iterable<_i2.TransactionWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? type;

  final _i1.PrismaUnion<_i2.IntFilter, int>? montant;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateHeure;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  service;

  final _i1.PrismaUnion<
    _i2.EtudiantScalarRelationFilter,
    _i2.EtudiantWhereInput
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class TransactionListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionListRelationFilter({this.every, this.some, this.none});

  final _i2.TransactionWhereInput? every;

  final _i2.TransactionWhereInput? some;

  final _i2.TransactionWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {'every': every, 'some': some, 'none': none};
}

class SessionWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final _i1.PrismaUnion<_i2.SessionWhereInput, Iterable<_i2.SessionWhereInput>>?
  AND;

  final Iterable<_i2.SessionWhereInput>? OR;

  final _i1.PrismaUnion<_i2.SessionWhereInput, Iterable<_i2.SessionWhereInput>>?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<_i2.StringFilter, String>? token;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateExpiration;

  final _i1.PrismaUnion<
    _i2.EtudiantScalarRelationFilter,
    _i2.EtudiantWhereInput
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class SessionListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionListRelationFilter({this.every, this.some, this.none});

  final _i2.SessionWhereInput? every;

  final _i2.SessionWhereInput? some;

  final _i2.SessionWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {'every': every, 'some': some, 'none': none};
}

class EtudiantWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
    this.sessions,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantWhereInput,
    Iterable<_i2.EtudiantWhereInput>
  >?
  AND;

  final Iterable<_i2.EtudiantWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.EtudiantWhereInput,
    Iterable<_i2.EtudiantWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? matricule;

  final _i1.PrismaUnion<_i2.StringFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.IntFilter, int>? solde;

  final _i1.PrismaUnion<_i2.StringFilter, String>? codeSecret;

  final _i1.PrismaUnion<_i2.StringFilter, String>? codeQr;

  final _i2.TransactionListRelationFilter? transactions;

  final _i2.SessionListRelationFilter? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class EtudiantWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantWhereUniqueInput({
    this.id,
    this.matricule,
    this.codeQr,
    this.AND,
    this.OR,
    this.NOT,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.transactions,
    this.sessions,
  });

  final int? id;

  final String? matricule;

  final String? codeQr;

  final _i1.PrismaUnion<
    _i2.EtudiantWhereInput,
    Iterable<_i2.EtudiantWhereInput>
  >?
  AND;

  final Iterable<_i2.EtudiantWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.EtudiantWhereInput,
    Iterable<_i2.EtudiantWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.IntFilter, int>? solde;

  final _i1.PrismaUnion<_i2.StringFilter, String>? codeSecret;

  final _i2.TransactionListRelationFilter? transactions;

  final _i2.SessionListRelationFilter? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'codeQr': codeQr,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class TransactionEtudiantArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionEtudiantArgs({this.select, this.include});

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class TransactionInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionInclude({this.etudiant});

  final _i1.PrismaUnion<bool, _i2.TransactionEtudiantArgs>? etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

enum SortOrder implements _i1.PrismaEnum {
  asc._('asc'),
  desc._('desc');

  const SortOrder._(this.name);

  @override
  final String name;
}

enum NullsOrder implements _i1.PrismaEnum {
  first._('first'),
  last._('last');

  const NullsOrder._(this.name);

  @override
  final String name;
}

class SortOrderInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SortOrderInput({required this.sort, this.nulls});

  final _i2.SortOrder sort;

  final _i2.NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => {'sort': sort, 'nulls': nulls};
}

class TransactionOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class SessionOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class EtudiantOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantOrderByWithRelationInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
    this.sessions,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? solde;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? codeQr;

  final _i2.TransactionOrderByRelationAggregateInput? transactions;

  final _i2.SessionOrderByRelationAggregateInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class TransactionOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionOrderByWithRelationInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? montant;

  final _i2.SortOrder? dateHeure;

  final _i2.SortOrder? etudiantId;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? autrePartiMatricule;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? service;

  final _i2.EtudiantOrderByWithRelationInput? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class TransactionWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final String? id;

  final _i1.PrismaUnion<
    _i2.TransactionWhereInput,
    Iterable<_i2.TransactionWhereInput>
  >?
  AND;

  final Iterable<_i2.TransactionWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.TransactionWhereInput,
    Iterable<_i2.TransactionWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? type;

  final _i1.PrismaUnion<_i2.IntFilter, int>? montant;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateHeure;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  service;

  final _i1.PrismaUnion<
    _i2.EtudiantScalarRelationFilter,
    _i2.EtudiantWhereInput
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

enum TransactionScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<String>('id', 'Transaction'),
  type<String>('type', 'Transaction'),
  montant<int>('montant', 'Transaction'),
  dateHeure<DateTime>('dateHeure', 'Transaction'),
  etudiantId<int>('etudiantId', 'Transaction'),
  autrePartiMatricule<String>('autrePartiMatricule', 'Transaction'),
  service<String>('service', 'Transaction');

  const TransactionScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class EtudiantTransactionsArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantTransactionsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.TransactionWhereInput? where;

  final _i1.PrismaUnion<
    Iterable<_i2.TransactionOrderByWithRelationInput>,
    _i2.TransactionOrderByWithRelationInput
  >?
  orderBy;

  final _i2.TransactionWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.TransactionScalar, Iterable<_i2.TransactionScalar>>?
  distinct;

  final _i2.TransactionSelect? select;

  final _i2.TransactionInclude? include;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'orderBy': orderBy,
    'cursor': cursor,
    'take': take,
    'skip': skip,
    'distinct': distinct,
    'select': select,
    'include': include,
  };
}

class SessionEtudiantArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionEtudiantArgs({this.select, this.include});

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class SessionSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  final _i1.PrismaUnion<bool, _i2.SessionEtudiantArgs>? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class SessionInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionInclude({this.etudiant});

  final _i1.PrismaUnion<bool, _i2.SessionEtudiantArgs>? etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

class SessionOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionOrderByWithRelationInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? token;

  final _i2.SortOrder? dateExpiration;

  final _i2.EtudiantOrderByWithRelationInput? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class SessionWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.SessionWhereInput, Iterable<_i2.SessionWhereInput>>?
  AND;

  final Iterable<_i2.SessionWhereInput>? OR;

  final _i1.PrismaUnion<_i2.SessionWhereInput, Iterable<_i2.SessionWhereInput>>?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<_i2.StringFilter, String>? token;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateExpiration;

  final _i1.PrismaUnion<
    _i2.EtudiantScalarRelationFilter,
    _i2.EtudiantWhereInput
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

enum SessionScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Session'),
  etudiantId<int>('etudiantId', 'Session'),
  token<String>('token', 'Session'),
  dateExpiration<DateTime>('dateExpiration', 'Session');

  const SessionScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class EtudiantSessionsArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantSessionsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.SessionWhereInput? where;

  final _i1.PrismaUnion<
    Iterable<_i2.SessionOrderByWithRelationInput>,
    _i2.SessionOrderByWithRelationInput
  >?
  orderBy;

  final _i2.SessionWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.SessionScalar, Iterable<_i2.SessionScalar>>?
  distinct;

  final _i2.SessionSelect? select;

  final _i2.SessionInclude? include;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'orderBy': orderBy,
    'cursor': cursor,
    'take': take,
    'skip': skip,
    'distinct': distinct,
    'select': select,
    'include': include,
  };
}

class EtudiantCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCountOutputTypeSelect({this.transactions, this.sessions});

  final bool? transactions;

  final bool? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'transactions': transactions,
    'sessions': sessions,
  };
}

class EtudiantCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCountArgs({this.select});

  final _i2.EtudiantCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantInclude({this.transactions, this.sessions, this.$count});

  final _i1.PrismaUnion<bool, _i2.EtudiantTransactionsArgs>? transactions;

  final _i1.PrismaUnion<bool, _i2.EtudiantSessionsArgs>? sessions;

  final _i1.PrismaUnion<bool, _i2.EtudiantCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
    'transactions': transactions,
    'sessions': sessions,
    '_count': $count,
  };
}

class TransactionSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  final _i1.PrismaUnion<bool, _i2.TransactionEtudiantArgs>? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class EtudiantSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantSelect({
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

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  final _i1.PrismaUnion<bool, _i2.EtudiantTransactionsArgs>? transactions;

  final _i1.PrismaUnion<bool, _i2.EtudiantSessionsArgs>? sessions;

  final _i1.PrismaUnion<bool, _i2.EtudiantCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
    '_count': $count,
  };
}

enum EtudiantScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Etudiant'),
  matricule<String>('matricule', 'Etudiant'),
  nom<String>('nom', 'Etudiant'),
  prenom<String>('prenom', 'Etudiant'),
  solde<int>('solde', 'Etudiant'),
  codeSecret<String>('codeSecret', 'Etudiant'),
  codeQr<String>('codeQr', 'Etudiant');

  const EtudiantScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class TransactionCreateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateWithoutEtudiantInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUncheckedCreateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedCreateWithoutEtudiantInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionCreateOrConnectWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateOrConnectWithoutEtudiantInput({
    required this.where,
    required this.create,
  });

  final _i2.TransactionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i2.TransactionUncheckedCreateWithoutEtudiantInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class TransactionCreateManyEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateManyEtudiantInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionCreateManyEtudiantInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateManyEtudiantInputEnvelope({
    required this.data,
    this.skipDuplicates,
  });

  final _i1.PrismaUnion<
    _i2.TransactionCreateManyEtudiantInput,
    Iterable<_i2.TransactionCreateManyEtudiantInput>
  >
  data;

  final bool? skipDuplicates;

  @override
  Map<String, dynamic> toJson() => {
    'data': data,
    'skipDuplicates': skipDuplicates,
  };
}

class TransactionCreateNestedManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateNestedManyWithoutEtudiantInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.TransactionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.TransactionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.TransactionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.TransactionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.TransactionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i2.TransactionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'createMany': createMany,
    'connect': connect,
  };
}

class SessionCreateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateWithoutEtudiantInput({
    required this.token,
    required this.dateExpiration,
  });

  final String token;

  final DateTime dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUncheckedCreateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedCreateWithoutEtudiantInput({
    this.id,
    required this.token,
    required this.dateExpiration,
  });

  final int? id;

  final String token;

  final DateTime dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionCreateOrConnectWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateOrConnectWithoutEtudiantInput({
    required this.where,
    required this.create,
  });

  final _i2.SessionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i2.SessionUncheckedCreateWithoutEtudiantInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class SessionCreateManyEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateManyEtudiantInput({
    this.id,
    required this.token,
    required this.dateExpiration,
  });

  final int? id;

  final String token;

  final DateTime dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionCreateManyEtudiantInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateManyEtudiantInputEnvelope({
    required this.data,
    this.skipDuplicates,
  });

  final _i1.PrismaUnion<
    _i2.SessionCreateManyEtudiantInput,
    Iterable<_i2.SessionCreateManyEtudiantInput>
  >
  data;

  final bool? skipDuplicates;

  @override
  Map<String, dynamic> toJson() => {
    'data': data,
    'skipDuplicates': skipDuplicates,
  };
}

class SessionCreateNestedManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateNestedManyWithoutEtudiantInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.SessionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.SessionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.SessionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.SessionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.SessionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i2.SessionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'createMany': createMany,
    'connect': connect,
  };
}

class EtudiantCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateInput({
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.transactions,
    this.sessions,
  });

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.TransactionCreateNestedManyWithoutEtudiantInput? transactions;

  final _i2.SessionCreateNestedManyWithoutEtudiantInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class TransactionUncheckedCreateNestedManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedCreateNestedManyWithoutEtudiantInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.TransactionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.TransactionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.TransactionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.TransactionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.TransactionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i2.TransactionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'createMany': createMany,
    'connect': connect,
  };
}

class SessionUncheckedCreateNestedManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedCreateNestedManyWithoutEtudiantInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.SessionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.SessionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.SessionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.SessionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.SessionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i2.SessionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'createMany': createMany,
    'connect': connect,
  };
}

class EtudiantUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedCreateInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.transactions,
    this.sessions,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.TransactionUncheckedCreateNestedManyWithoutEtudiantInput?
  transactions;

  final _i2.SessionUncheckedCreateNestedManyWithoutEtudiantInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class AffectedRowsOutput {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map json) =>
      AffectedRowsOutput(count: json['count']);

  final int? count;

  Map<String, dynamic> toJson() => {'count': count};
}

class EtudiantCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateManyInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  @override
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

class CreateManyEtudiantAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyEtudiantAndReturnOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  @override
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

class StringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFieldUpdateOperationsInput({this.set});

  final String? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class IntFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => {
    'set': set,
    'increment': increment,
    'decrement': decrement,
    'multiply': multiply,
    'divide': divide,
  };
}

class DateTimeFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFieldUpdateOperationsInput({this.set});

  final DateTime? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class NullableStringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableStringFieldUpdateOperationsInput({this.set});

  final _i1.PrismaUnion<String, _i1.PrismaNull>? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class TransactionUpdateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateWithoutEtudiantInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUncheckedUpdateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedUpdateWithoutEtudiantInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUpsertWithWhereUniqueWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpsertWithWhereUniqueWithoutEtudiantInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.TransactionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateWithoutEtudiantInput,
    _i2.TransactionUncheckedUpdateWithoutEtudiantInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i2.TransactionUncheckedCreateWithoutEtudiantInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'update': update,
    'create': create,
  };
}

class TransactionUpdateWithWhereUniqueWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateWithWhereUniqueWithoutEtudiantInput({
    required this.where,
    required this.data,
  });

  final _i2.TransactionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateWithoutEtudiantInput,
    _i2.TransactionUncheckedUpdateWithoutEtudiantInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class TransactionScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereInput,
    Iterable<_i2.TransactionScalarWhereInput>
  >?
  AND;

  final Iterable<_i2.TransactionScalarWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereInput,
    Iterable<_i2.TransactionScalarWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? type;

  final _i1.PrismaUnion<_i2.IntFilter, int>? montant;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateHeure;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateManyMutationInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUncheckedUpdateManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedUpdateManyWithoutEtudiantInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUpdateManyWithWhereWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateManyWithWhereWithoutEtudiantInput({
    required this.where,
    required this.data,
  });

  final _i2.TransactionScalarWhereInput where;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateManyMutationInput,
    _i2.TransactionUncheckedUpdateManyWithoutEtudiantInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class TransactionUpdateManyWithoutEtudiantNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateManyWithoutEtudiantNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.TransactionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.TransactionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.TransactionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.TransactionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.TransactionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.TransactionUpsertWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.TransactionUpsertWithWhereUniqueWithoutEtudiantInput>
  >?
  upsert;

  final _i2.TransactionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.TransactionUpdateWithWhereUniqueWithoutEtudiantInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateManyWithWhereWithoutEtudiantInput,
    Iterable<_i2.TransactionUpdateManyWithWhereWithoutEtudiantInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereInput,
    Iterable<_i2.TransactionScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'createMany': createMany,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class SessionUpdateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateWithoutEtudiantInput({this.token, this.dateExpiration});

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUncheckedUpdateWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedUpdateWithoutEtudiantInput({
    this.id,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUpsertWithWhereUniqueWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpsertWithWhereUniqueWithoutEtudiantInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.SessionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.SessionUpdateWithoutEtudiantInput,
    _i2.SessionUncheckedUpdateWithoutEtudiantInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i2.SessionUncheckedCreateWithoutEtudiantInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'update': update,
    'create': create,
  };
}

class SessionUpdateWithWhereUniqueWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateWithWhereUniqueWithoutEtudiantInput({
    required this.where,
    required this.data,
  });

  final _i2.SessionWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.SessionUpdateWithoutEtudiantInput,
    _i2.SessionUncheckedUpdateWithoutEtudiantInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class SessionScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereInput,
    Iterable<_i2.SessionScalarWhereInput>
  >?
  AND;

  final Iterable<_i2.SessionScalarWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereInput,
    Iterable<_i2.SessionScalarWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntFilter, int>? etudiantId;

  final _i1.PrismaUnion<_i2.StringFilter, String>? token;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateManyMutationInput({this.token, this.dateExpiration});

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUncheckedUpdateManyWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedUpdateManyWithoutEtudiantInput({
    this.id,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUpdateManyWithWhereWithoutEtudiantInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateManyWithWhereWithoutEtudiantInput({
    required this.where,
    required this.data,
  });

  final _i2.SessionScalarWhereInput where;

  final _i1.PrismaUnion<
    _i2.SessionUpdateManyMutationInput,
    _i2.SessionUncheckedUpdateManyWithoutEtudiantInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class SessionUpdateManyWithoutEtudiantNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateManyWithoutEtudiantNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.SessionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.SessionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.SessionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.SessionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.SessionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.SessionUpsertWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.SessionUpsertWithWhereUniqueWithoutEtudiantInput>
  >?
  upsert;

  final _i2.SessionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.SessionUpdateWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.SessionUpdateWithWhereUniqueWithoutEtudiantInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.SessionUpdateManyWithWhereWithoutEtudiantInput,
    Iterable<_i2.SessionUpdateManyWithWhereWithoutEtudiantInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereInput,
    Iterable<_i2.SessionScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'createMany': createMany,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class EtudiantUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
    this.sessions,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.TransactionUpdateManyWithoutEtudiantNestedInput? transactions;

  final _i2.SessionUpdateManyWithoutEtudiantNestedInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class TransactionUncheckedUpdateManyWithoutEtudiantNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedUpdateManyWithoutEtudiantNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.TransactionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.TransactionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.TransactionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.TransactionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.TransactionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.TransactionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.TransactionUpsertWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.TransactionUpsertWithWhereUniqueWithoutEtudiantInput>
  >?
  upsert;

  final _i2.TransactionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.TransactionWhereUniqueInput,
    Iterable<_i2.TransactionWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.TransactionUpdateWithWhereUniqueWithoutEtudiantInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.TransactionUpdateManyWithWhereWithoutEtudiantInput,
    Iterable<_i2.TransactionUpdateManyWithWhereWithoutEtudiantInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereInput,
    Iterable<_i2.TransactionScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'createMany': createMany,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class SessionUncheckedUpdateManyWithoutEtudiantNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedUpdateManyWithoutEtudiantNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.SessionCreateWithoutEtudiantInput,
    _i1.PrismaUnion<
      Iterable<_i2.SessionCreateWithoutEtudiantInput>,
      _i1.PrismaUnion<
        _i2.SessionUncheckedCreateWithoutEtudiantInput,
        Iterable<_i2.SessionUncheckedCreateWithoutEtudiantInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.SessionCreateOrConnectWithoutEtudiantInput,
    Iterable<_i2.SessionCreateOrConnectWithoutEtudiantInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.SessionUpsertWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.SessionUpsertWithWhereUniqueWithoutEtudiantInput>
  >?
  upsert;

  final _i2.SessionCreateManyEtudiantInputEnvelope? createMany;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.SessionWhereUniqueInput,
    Iterable<_i2.SessionWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.SessionUpdateWithWhereUniqueWithoutEtudiantInput,
    Iterable<_i2.SessionUpdateWithWhereUniqueWithoutEtudiantInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.SessionUpdateManyWithWhereWithoutEtudiantInput,
    Iterable<_i2.SessionUpdateManyWithWhereWithoutEtudiantInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereInput,
    Iterable<_i2.SessionScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'createMany': createMany,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class EtudiantUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedUpdateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
    this.sessions,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.TransactionUncheckedUpdateManyWithoutEtudiantNestedInput?
  transactions;

  final _i2.SessionUncheckedUpdateManyWithoutEtudiantNestedInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
    'sessions': sessions,
  };
}

class EtudiantUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateManyMutationInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
  };
}

class EtudiantUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedUpdateManyInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  @override
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

class UpdateManyEtudiantAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManyEtudiantAndReturnOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  @override
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

class EtudiantCountAggregateOutputType {
  const EtudiantCountAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.$all,
  });

  factory EtudiantCountAggregateOutputType.fromJson(Map json) =>
      EtudiantCountAggregateOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        solde: json['solde'],
        codeSecret: json['codeSecret'],
        codeQr: json['codeQr'],
        $all: json['_all'],
      );

  final int? id;

  final int? matricule;

  final int? nom;

  final int? prenom;

  final int? solde;

  final int? codeSecret;

  final int? codeQr;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    '_all': $all,
  };
}

class EtudiantAvgAggregateOutputType {
  const EtudiantAvgAggregateOutputType({this.id, this.solde});

  factory EtudiantAvgAggregateOutputType.fromJson(Map json) =>
      EtudiantAvgAggregateOutputType(id: json['id'], solde: json['solde']);

  final double? id;

  final double? solde;

  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantSumAggregateOutputType {
  const EtudiantSumAggregateOutputType({this.id, this.solde});

  factory EtudiantSumAggregateOutputType.fromJson(Map json) =>
      EtudiantSumAggregateOutputType(id: json['id'], solde: json['solde']);

  final int? id;

  final int? solde;

  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantMinAggregateOutputType {
  const EtudiantMinAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  factory EtudiantMinAggregateOutputType.fromJson(Map json) =>
      EtudiantMinAggregateOutputType(
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

class EtudiantMaxAggregateOutputType {
  const EtudiantMaxAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  factory EtudiantMaxAggregateOutputType.fromJson(Map json) =>
      EtudiantMaxAggregateOutputType(
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

class EtudiantGroupByOutputType {
  const EtudiantGroupByOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory EtudiantGroupByOutputType.fromJson(Map json) =>
      EtudiantGroupByOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        solde: json['solde'],
        codeSecret: json['codeSecret'],
        codeQr: json['codeQr'],
        $count: json['_count'] is Map
            ? _i2.EtudiantCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.EtudiantAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.EtudiantSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.EtudiantMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.EtudiantMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final int? solde;

  final String? codeSecret;

  final String? codeQr;

  final _i2.EtudiantCountAggregateOutputType? $count;

  final _i2.EtudiantAvgAggregateOutputType? $avg;

  final _i2.EtudiantSumAggregateOutputType? $sum;

  final _i2.EtudiantMinAggregateOutputType? $min;

  final _i2.EtudiantMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class EtudiantCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCountOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? solde;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? codeQr;

  @override
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

class EtudiantAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantAvgOrderByAggregateInput({this.id, this.solde});

  final _i2.SortOrder? id;

  final _i2.SortOrder? solde;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantMaxOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? solde;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? codeQr;

  @override
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

class EtudiantMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantMinOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? solde;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? codeQr;

  @override
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

class EtudiantSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantSumOrderByAggregateInput({this.id, this.solde});

  final _i2.SortOrder? id;

  final _i2.SortOrder? solde;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantOrderByWithAggregationInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? solde;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? codeQr;

  final _i2.EtudiantCountOrderByAggregateInput? $count;

  final _i2.EtudiantAvgOrderByAggregateInput? $avg;

  final _i2.EtudiantMaxOrderByAggregateInput? $max;

  final _i2.EtudiantMinOrderByAggregateInput? $min;

  final _i2.EtudiantSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NestedFloatFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<double, _i1.Reference<double>>? equals;

  final _i1.PrismaUnion<Iterable<double>, _i1.Reference<Iterable<double>>>? $in;

  final _i1.PrismaUnion<Iterable<double>, _i1.Reference<Iterable<double>>>?
  notIn;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lte;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gte;

  final _i1.PrismaUnion<double, _i2.NestedFloatFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class IntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class NestedStringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class StringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'mode': mode,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class EtudiantScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantScalarWhereWithAggregatesInput,
    Iterable<_i2.EtudiantScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.EtudiantScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.EtudiantScalarWhereWithAggregatesInput,
    Iterable<_i2.EtudiantScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? matricule;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? solde;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? codeSecret;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? codeQr;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
  };
}

class EtudiantCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCountAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.$all,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    '_all': $all,
  };
}

class EtudiantGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeCountArgs({this.select});

  final _i2.EtudiantCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantAvgAggregateOutputTypeSelect({this.id, this.solde});

  final bool? id;

  final bool? solde;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeAvgArgs({this.select});

  final _i2.EtudiantAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantSumAggregateOutputTypeSelect({this.id, this.solde});

  final bool? id;

  final bool? solde;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'solde': solde};
}

class EtudiantGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeSumArgs({this.select});

  final _i2.EtudiantSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantMinAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  @override
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

class EtudiantGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeMinArgs({this.select});

  final _i2.EtudiantMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantMaxAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  @override
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

class EtudiantGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeMaxArgs({this.select});

  final _i2.EtudiantMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class EtudiantGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantGroupByOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? solde;

  final bool? codeSecret;

  final bool? codeQr;

  final _i1.PrismaUnion<bool, _i2.EtudiantGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.EtudiantGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.EtudiantGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.EtudiantGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.EtudiantGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateEtudiant {
  const AggregateEtudiant({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateEtudiant.fromJson(Map json) => AggregateEtudiant(
    $count: json['_count'] is Map
        ? _i2.EtudiantCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.EtudiantAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.EtudiantSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.EtudiantMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.EtudiantMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.EtudiantCountAggregateOutputType? $count;

  final _i2.EtudiantAvgAggregateOutputType? $avg;

  final _i2.EtudiantSumAggregateOutputType? $sum;

  final _i2.EtudiantMinAggregateOutputType? $min;

  final _i2.EtudiantMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateEtudiantCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantCountArgs({this.select});

  final _i2.EtudiantCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateEtudiantAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantAvgArgs({this.select});

  final _i2.EtudiantAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateEtudiantSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantSumArgs({this.select});

  final _i2.EtudiantSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateEtudiantMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantMinArgs({this.select});

  final _i2.EtudiantMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateEtudiantMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantMaxArgs({this.select});

  final _i2.EtudiantMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateEtudiantSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateEtudiantSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateEtudiantCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateEtudiantAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateEtudiantSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateEtudiantMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateEtudiantMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class EtudiantCreateWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateWithoutTransactionsInput({
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.sessions,
  });

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.SessionCreateNestedManyWithoutEtudiantInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'sessions': sessions,
  };
}

class EtudiantUncheckedCreateWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedCreateWithoutTransactionsInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.sessions,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.SessionUncheckedCreateNestedManyWithoutEtudiantInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'sessions': sessions,
  };
}

class EtudiantCreateOrConnectWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateOrConnectWithoutTransactionsInput({
    required this.where,
    required this.create,
  });

  final _i2.EtudiantWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutTransactionsInput,
    _i2.EtudiantUncheckedCreateWithoutTransactionsInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class EtudiantCreateNestedOneWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateNestedOneWithoutTransactionsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutTransactionsInput,
    _i2.EtudiantUncheckedCreateWithoutTransactionsInput
  >?
  create;

  final _i2.EtudiantCreateOrConnectWithoutTransactionsInput? connectOrCreate;

  final _i2.EtudiantWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'connect': connect,
  };
}

class TransactionCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
    required this.etudiant,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  final _i2.EtudiantCreateNestedOneWithoutTransactionsInput etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class TransactionUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedCreateInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    required this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final int etudiantId;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCreateManyInput({
    required this.id,
    required this.type,
    required this.montant,
    this.dateHeure,
    required this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final String id;

  final String type;

  final int montant;

  final DateTime? dateHeure;

  final int etudiantId;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? autrePartiMatricule;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class CreateManyTransactionAndReturnOutputTypeEtudiantArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyTransactionAndReturnOutputTypeEtudiantArgs({
    this.select,
    this.include,
  });

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class CreateManyTransactionAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyTransactionAndReturnOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  final _i1.PrismaUnion<
    bool,
    _i2.CreateManyTransactionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class CreateManyTransactionAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyTransactionAndReturnOutputTypeInclude({this.etudiant});

  final _i1.PrismaUnion<
    bool,
    _i2.CreateManyTransactionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

class EtudiantUpdateWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateWithoutTransactionsInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.sessions,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.SessionUpdateManyWithoutEtudiantNestedInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'sessions': sessions,
  };
}

class EtudiantUncheckedUpdateWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedUpdateWithoutTransactionsInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.sessions,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.SessionUncheckedUpdateManyWithoutEtudiantNestedInput? sessions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'sessions': sessions,
  };
}

class EtudiantUpsertWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpsertWithoutTransactionsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateWithoutTransactionsInput,
    _i2.EtudiantUncheckedUpdateWithoutTransactionsInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutTransactionsInput,
    _i2.EtudiantUncheckedCreateWithoutTransactionsInput
  >
  create;

  final _i2.EtudiantWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
    'update': update,
    'create': create,
    'where': where,
  };
}

class EtudiantUpdateToOneWithWhereWithoutTransactionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateToOneWithWhereWithoutTransactionsInput({
    this.where,
    required this.data,
  });

  final _i2.EtudiantWhereInput? where;

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateWithoutTransactionsInput,
    _i2.EtudiantUncheckedUpdateWithoutTransactionsInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class EtudiantUpdateOneRequiredWithoutTransactionsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateOneRequiredWithoutTransactionsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutTransactionsInput,
    _i2.EtudiantUncheckedCreateWithoutTransactionsInput
  >?
  create;

  final _i2.EtudiantCreateOrConnectWithoutTransactionsInput? connectOrCreate;

  final _i2.EtudiantUpsertWithoutTransactionsInput? upsert;

  final _i2.EtudiantWhereUniqueInput? connect;

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateToOneWithWhereWithoutTransactionsInput,
    _i1.PrismaUnion<
      _i2.EtudiantUpdateWithoutTransactionsInput,
      _i2.EtudiantUncheckedUpdateWithoutTransactionsInput
    >
  >?
  update;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'connect': connect,
    'update': update,
  };
}

class TransactionUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUpdateInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  final _i2.EtudiantUpdateOneRequiredWithoutTransactionsNestedInput? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class TransactionUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedUpdateInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? etudiantId;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionUncheckedUpdateManyInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? montant;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateHeure;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? etudiantId;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class UpdateManyTransactionAndReturnOutputTypeEtudiantArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManyTransactionAndReturnOutputTypeEtudiantArgs({
    this.select,
    this.include,
  });

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class UpdateManyTransactionAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManyTransactionAndReturnOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.etudiant,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  final _i1.PrismaUnion<
    bool,
    _i2.UpdateManyTransactionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    'etudiant': etudiant,
  };
}

class UpdateManyTransactionAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManyTransactionAndReturnOutputTypeInclude({this.etudiant});

  final _i1.PrismaUnion<
    bool,
    _i2.UpdateManyTransactionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

class TransactionCountAggregateOutputType {
  const TransactionCountAggregateOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.$all,
  });

  factory TransactionCountAggregateOutputType.fromJson(Map json) =>
      TransactionCountAggregateOutputType(
        id: json['id'],
        type: json['type'],
        montant: json['montant'],
        dateHeure: json['dateHeure'],
        etudiantId: json['etudiantId'],
        autrePartiMatricule: json['autrePartiMatricule'],
        service: json['service'],
        $all: json['_all'],
      );

  final int? id;

  final int? type;

  final int? montant;

  final int? dateHeure;

  final int? etudiantId;

  final int? autrePartiMatricule;

  final int? service;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    '_all': $all,
  };
}

class TransactionAvgAggregateOutputType {
  const TransactionAvgAggregateOutputType({this.montant, this.etudiantId});

  factory TransactionAvgAggregateOutputType.fromJson(Map json) =>
      TransactionAvgAggregateOutputType(
        montant: json['montant'],
        etudiantId: json['etudiantId'],
      );

  final double? montant;

  final double? etudiantId;

  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionSumAggregateOutputType {
  const TransactionSumAggregateOutputType({this.montant, this.etudiantId});

  factory TransactionSumAggregateOutputType.fromJson(Map json) =>
      TransactionSumAggregateOutputType(
        montant: json['montant'],
        etudiantId: json['etudiantId'],
      );

  final int? montant;

  final int? etudiantId;

  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionMinAggregateOutputType {
  const TransactionMinAggregateOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  factory TransactionMinAggregateOutputType.fromJson(Map json) =>
      TransactionMinAggregateOutputType(
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
      );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionMaxAggregateOutputType {
  const TransactionMaxAggregateOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  factory TransactionMaxAggregateOutputType.fromJson(Map json) =>
      TransactionMaxAggregateOutputType(
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
      );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionGroupByOutputType {
  const TransactionGroupByOutputType({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory TransactionGroupByOutputType.fromJson(Map json) =>
      TransactionGroupByOutputType(
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
        $count: json['_count'] is Map
            ? _i2.TransactionCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.TransactionAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.TransactionSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.TransactionMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.TransactionMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final String? id;

  final String? type;

  final int? montant;

  final DateTime? dateHeure;

  final int? etudiantId;

  final String? autrePartiMatricule;

  final String? service;

  final _i2.TransactionCountAggregateOutputType? $count;

  final _i2.TransactionAvgAggregateOutputType? $avg;

  final _i2.TransactionSumAggregateOutputType? $sum;

  final _i2.TransactionMinAggregateOutputType? $min;

  final _i2.TransactionMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure?.toIso8601String(),
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class TransactionCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCountOrderByAggregateInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? montant;

  final _i2.SortOrder? dateHeure;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? autrePartiMatricule;

  final _i2.SortOrder? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionAvgOrderByAggregateInput({this.montant, this.etudiantId});

  final _i2.SortOrder? montant;

  final _i2.SortOrder? etudiantId;

  @override
  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionMaxOrderByAggregateInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? montant;

  final _i2.SortOrder? dateHeure;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? autrePartiMatricule;

  final _i2.SortOrder? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionMinOrderByAggregateInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? montant;

  final _i2.SortOrder? dateHeure;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? autrePartiMatricule;

  final _i2.SortOrder? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionSumOrderByAggregateInput({this.montant, this.etudiantId});

  final _i2.SortOrder? montant;

  final _i2.SortOrder? etudiantId;

  @override
  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionOrderByWithAggregationInput({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? montant;

  final _i2.SortOrder? dateHeure;

  final _i2.SortOrder? etudiantId;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? autrePartiMatricule;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? service;

  final _i2.TransactionCountOrderByAggregateInput? $count;

  final _i2.TransactionAvgOrderByAggregateInput? $avg;

  final _i2.TransactionMaxOrderByAggregateInput? $max;

  final _i2.TransactionMinOrderByAggregateInput? $min;

  final _i2.TransactionSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NestedDateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class DateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.Reference<Iterable<DateTime>>>?
  notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class NestedIntNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<
    int,
    _i1.PrismaUnion<_i1.Reference<int>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<
    Iterable<int>,
    _i1.PrismaUnion<_i1.Reference<Iterable<int>>, _i1.PrismaNull>
  >?
  $in;

  final _i1.PrismaUnion<
    Iterable<int>,
    _i1.PrismaUnion<_i1.Reference<Iterable<int>>, _i1.PrismaNull>
  >?
  notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<
    int,
    _i1.PrismaUnion<_i2.NestedIntNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedStringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  $in;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NestedStringNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class StringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  $in;

  final _i1.PrismaUnion<
    Iterable<String>,
    _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>
  >?
  notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NestedStringNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'mode': mode,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class TransactionScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereWithAggregatesInput,
    Iterable<_i2.TransactionScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.TransactionScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.TransactionScalarWhereWithAggregatesInput,
    Iterable<_i2.TransactionScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? type;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? montant;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? dateHeure;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? etudiantId;

  final _i1.PrismaUnion<
    _i2.StringNullableWithAggregatesFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  autrePartiMatricule;

  final _i1.PrismaUnion<
    _i2.StringNullableWithAggregatesFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  service;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionCountAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.$all,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    '_all': $all,
  };
}

class TransactionGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeCountArgs({this.select});

  final _i2.TransactionCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TransactionAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionAvgAggregateOutputTypeSelect({
    this.montant,
    this.etudiantId,
  });

  final bool? montant;

  final bool? etudiantId;

  @override
  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeAvgArgs({this.select});

  final _i2.TransactionAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TransactionSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionSumAggregateOutputTypeSelect({
    this.montant,
    this.etudiantId,
  });

  final bool? montant;

  final bool? etudiantId;

  @override
  Map<String, dynamic> toJson() => {
    'montant': montant,
    'etudiantId': etudiantId,
  };
}

class TransactionGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeSumArgs({this.select});

  final _i2.TransactionSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TransactionMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionMinAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeMinArgs({this.select});

  final _i2.TransactionMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TransactionMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionMaxAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
  };
}

class TransactionGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeMaxArgs({this.select});

  final _i2.TransactionMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TransactionGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TransactionGroupByOutputTypeSelect({
    this.id,
    this.type,
    this.montant,
    this.dateHeure,
    this.etudiantId,
    this.autrePartiMatricule,
    this.service,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? type;

  final bool? montant;

  final bool? dateHeure;

  final bool? etudiantId;

  final bool? autrePartiMatricule;

  final bool? service;

  final _i1.PrismaUnion<bool, _i2.TransactionGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.TransactionGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.TransactionGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.TransactionGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.TransactionGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'montant': montant,
    'dateHeure': dateHeure,
    'etudiantId': etudiantId,
    'autrePartiMatricule': autrePartiMatricule,
    'service': service,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateTransaction {
  const AggregateTransaction({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateTransaction.fromJson(Map json) => AggregateTransaction(
    $count: json['_count'] is Map
        ? _i2.TransactionCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.TransactionAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.TransactionSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.TransactionMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.TransactionMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.TransactionCountAggregateOutputType? $count;

  final _i2.TransactionAvgAggregateOutputType? $avg;

  final _i2.TransactionSumAggregateOutputType? $sum;

  final _i2.TransactionMinAggregateOutputType? $min;

  final _i2.TransactionMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateTransactionCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionCountArgs({this.select});

  final _i2.TransactionCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTransactionAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionAvgArgs({this.select});

  final _i2.TransactionAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTransactionSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionSumArgs({this.select});

  final _i2.TransactionSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTransactionMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionMinArgs({this.select});

  final _i2.TransactionMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTransactionMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionMaxArgs({this.select});

  final _i2.TransactionMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTransactionSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTransactionSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateTransactionCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateTransactionAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateTransactionSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateTransactionMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateTransactionMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class EtudiantCreateWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateWithoutSessionsInput({
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.transactions,
  });

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.TransactionCreateNestedManyWithoutEtudiantInput? transactions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
  };
}

class EtudiantUncheckedCreateWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedCreateWithoutSessionsInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    this.solde,
    required this.codeSecret,
    required this.codeQr,
    this.transactions,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final int? solde;

  final String codeSecret;

  final String codeQr;

  final _i2.TransactionUncheckedCreateNestedManyWithoutEtudiantInput?
  transactions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
  };
}

class EtudiantCreateOrConnectWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateOrConnectWithoutSessionsInput({
    required this.where,
    required this.create,
  });

  final _i2.EtudiantWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutSessionsInput,
    _i2.EtudiantUncheckedCreateWithoutSessionsInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class EtudiantCreateNestedOneWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantCreateNestedOneWithoutSessionsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutSessionsInput,
    _i2.EtudiantUncheckedCreateWithoutSessionsInput
  >?
  create;

  final _i2.EtudiantCreateOrConnectWithoutSessionsInput? connectOrCreate;

  final _i2.EtudiantWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'connect': connect,
  };
}

class SessionCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateInput({
    required this.token,
    required this.dateExpiration,
    required this.etudiant,
  });

  final String token;

  final DateTime dateExpiration;

  final _i2.EtudiantCreateNestedOneWithoutSessionsInput etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class SessionUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedCreateInput({
    this.id,
    required this.etudiantId,
    required this.token,
    required this.dateExpiration,
  });

  final int? id;

  final int etudiantId;

  final String token;

  final DateTime dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCreateManyInput({
    this.id,
    required this.etudiantId,
    required this.token,
    required this.dateExpiration,
  });

  final int? id;

  final int etudiantId;

  final String token;

  final DateTime dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class CreateManySessionAndReturnOutputTypeEtudiantArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManySessionAndReturnOutputTypeEtudiantArgs({
    this.select,
    this.include,
  });

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class CreateManySessionAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManySessionAndReturnOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  final _i1.PrismaUnion<
    bool,
    _i2.CreateManySessionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class CreateManySessionAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManySessionAndReturnOutputTypeInclude({this.etudiant});

  final _i1.PrismaUnion<
    bool,
    _i2.CreateManySessionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

class EtudiantUpdateWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateWithoutSessionsInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.TransactionUpdateManyWithoutEtudiantNestedInput? transactions;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
  };
}

class EtudiantUncheckedUpdateWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUncheckedUpdateWithoutSessionsInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.solde,
    this.codeSecret,
    this.codeQr,
    this.transactions,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? solde;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? codeQr;

  final _i2.TransactionUncheckedUpdateManyWithoutEtudiantNestedInput?
  transactions;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'solde': solde,
    'codeSecret': codeSecret,
    'codeQr': codeQr,
    'transactions': transactions,
  };
}

class EtudiantUpsertWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpsertWithoutSessionsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateWithoutSessionsInput,
    _i2.EtudiantUncheckedUpdateWithoutSessionsInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutSessionsInput,
    _i2.EtudiantUncheckedCreateWithoutSessionsInput
  >
  create;

  final _i2.EtudiantWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
    'update': update,
    'create': create,
    'where': where,
  };
}

class EtudiantUpdateToOneWithWhereWithoutSessionsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateToOneWithWhereWithoutSessionsInput({
    this.where,
    required this.data,
  });

  final _i2.EtudiantWhereInput? where;

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateWithoutSessionsInput,
    _i2.EtudiantUncheckedUpdateWithoutSessionsInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class EtudiantUpdateOneRequiredWithoutSessionsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const EtudiantUpdateOneRequiredWithoutSessionsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<
    _i2.EtudiantCreateWithoutSessionsInput,
    _i2.EtudiantUncheckedCreateWithoutSessionsInput
  >?
  create;

  final _i2.EtudiantCreateOrConnectWithoutSessionsInput? connectOrCreate;

  final _i2.EtudiantUpsertWithoutSessionsInput? upsert;

  final _i2.EtudiantWhereUniqueInput? connect;

  final _i1.PrismaUnion<
    _i2.EtudiantUpdateToOneWithWhereWithoutSessionsInput,
    _i1.PrismaUnion<
      _i2.EtudiantUpdateWithoutSessionsInput,
      _i2.EtudiantUncheckedUpdateWithoutSessionsInput
    >
  >?
  update;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'connect': connect,
    'update': update,
  };
}

class SessionUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUpdateInput({this.token, this.dateExpiration, this.etudiant});

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  final _i2.EtudiantUpdateOneRequiredWithoutSessionsNestedInput? etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class SessionUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedUpdateInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? etudiantId;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionUncheckedUpdateManyInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? etudiantId;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? token;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class UpdateManySessionAndReturnOutputTypeEtudiantArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManySessionAndReturnOutputTypeEtudiantArgs({
    this.select,
    this.include,
  });

  final _i2.EtudiantSelect? select;

  final _i2.EtudiantInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class UpdateManySessionAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManySessionAndReturnOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.etudiant,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  final _i1.PrismaUnion<
    bool,
    _i2.UpdateManySessionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    'etudiant': etudiant,
  };
}

class UpdateManySessionAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManySessionAndReturnOutputTypeInclude({this.etudiant});

  final _i1.PrismaUnion<
    bool,
    _i2.UpdateManySessionAndReturnOutputTypeEtudiantArgs
  >?
  etudiant;

  @override
  Map<String, dynamic> toJson() => {'etudiant': etudiant};
}

class SessionCountAggregateOutputType {
  const SessionCountAggregateOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.$all,
  });

  factory SessionCountAggregateOutputType.fromJson(Map json) =>
      SessionCountAggregateOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: json['dateExpiration'],
        $all: json['_all'],
      );

  final int? id;

  final int? etudiantId;

  final int? token;

  final int? dateExpiration;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    '_all': $all,
  };
}

class SessionAvgAggregateOutputType {
  const SessionAvgAggregateOutputType({this.id, this.etudiantId});

  factory SessionAvgAggregateOutputType.fromJson(Map json) =>
      SessionAvgAggregateOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
      );

  final double? id;

  final double? etudiantId;

  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionSumAggregateOutputType {
  const SessionSumAggregateOutputType({this.id, this.etudiantId});

  factory SessionSumAggregateOutputType.fromJson(Map json) =>
      SessionSumAggregateOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
      );

  final int? id;

  final int? etudiantId;

  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionMinAggregateOutputType {
  const SessionMinAggregateOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  factory SessionMinAggregateOutputType.fromJson(Map json) =>
      SessionMinAggregateOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: switch (json['dateExpiration']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateExpiration'],
        },
      );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
  };
}

class SessionMaxAggregateOutputType {
  const SessionMaxAggregateOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  factory SessionMaxAggregateOutputType.fromJson(Map json) =>
      SessionMaxAggregateOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: switch (json['dateExpiration']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateExpiration'],
        },
      );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
  };
}

class SessionGroupByOutputType {
  const SessionGroupByOutputType({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory SessionGroupByOutputType.fromJson(Map json) =>
      SessionGroupByOutputType(
        id: json['id'],
        etudiantId: json['etudiantId'],
        token: json['token'],
        dateExpiration: switch (json['dateExpiration']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['dateExpiration'],
        },
        $count: json['_count'] is Map
            ? _i2.SessionCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.SessionAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.SessionSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.SessionMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.SessionMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final int? etudiantId;

  final String? token;

  final DateTime? dateExpiration;

  final _i2.SessionCountAggregateOutputType? $count;

  final _i2.SessionAvgAggregateOutputType? $avg;

  final _i2.SessionSumAggregateOutputType? $sum;

  final _i2.SessionMinAggregateOutputType? $min;

  final _i2.SessionMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration?.toIso8601String(),
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class SessionCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCountOrderByAggregateInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? token;

  final _i2.SortOrder? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionAvgOrderByAggregateInput({this.id, this.etudiantId});

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionMaxOrderByAggregateInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? token;

  final _i2.SortOrder? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionMinOrderByAggregateInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? token;

  final _i2.SortOrder? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionSumOrderByAggregateInput({this.id, this.etudiantId});

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionOrderByWithAggregationInput({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? etudiantId;

  final _i2.SortOrder? token;

  final _i2.SortOrder? dateExpiration;

  final _i2.SessionCountOrderByAggregateInput? $count;

  final _i2.SessionAvgOrderByAggregateInput? $avg;

  final _i2.SessionMaxOrderByAggregateInput? $max;

  final _i2.SessionMinOrderByAggregateInput? $min;

  final _i2.SessionSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class SessionScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereWithAggregatesInput,
    Iterable<_i2.SessionScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.SessionScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.SessionScalarWhereWithAggregatesInput,
    Iterable<_i2.SessionScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? etudiantId;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? token;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>?
  dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionCountAggregateOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.$all,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    '_all': $all,
  };
}

class SessionGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeCountArgs({this.select});

  final _i2.SessionCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionAvgAggregateOutputTypeSelect({this.id, this.etudiantId});

  final bool? id;

  final bool? etudiantId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeAvgArgs({this.select});

  final _i2.SessionAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionSumAggregateOutputTypeSelect({this.id, this.etudiantId});

  final bool? id;

  final bool? etudiantId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'etudiantId': etudiantId};
}

class SessionGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeSumArgs({this.select});

  final _i2.SessionSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionMinAggregateOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeMinArgs({this.select});

  final _i2.SessionMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionMaxAggregateOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
  };
}

class SessionGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeMaxArgs({this.select});

  final _i2.SessionMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionGroupByOutputTypeSelect({
    this.id,
    this.etudiantId,
    this.token,
    this.dateExpiration,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? etudiantId;

  final bool? token;

  final bool? dateExpiration;

  final _i1.PrismaUnion<bool, _i2.SessionGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.SessionGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.SessionGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.SessionGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.SessionGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'etudiantId': etudiantId,
    'token': token,
    'dateExpiration': dateExpiration,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateSession {
  const AggregateSession({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateSession.fromJson(Map json) => AggregateSession(
    $count: json['_count'] is Map
        ? _i2.SessionCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.SessionAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.SessionSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.SessionMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.SessionMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.SessionCountAggregateOutputType? $count;

  final _i2.SessionAvgAggregateOutputType? $avg;

  final _i2.SessionSumAggregateOutputType? $sum;

  final _i2.SessionMinAggregateOutputType? $min;

  final _i2.SessionMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateSessionCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionCountArgs({this.select});

  final _i2.SessionCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionAvgArgs({this.select});

  final _i2.SessionAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionSumArgs({this.select});

  final _i2.SessionSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionMinArgs({this.select});

  final _i2.SessionMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionMaxArgs({this.select});

  final _i2.SessionMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateSessionCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AgentWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<_i2.AgentWhereInput, Iterable<_i2.AgentWhereInput>>?
  AND;

  final Iterable<_i2.AgentWhereInput>? OR;

  final _i1.PrismaUnion<_i2.AgentWhereInput, Iterable<_i2.AgentWhereInput>>?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? matricule;

  final _i1.PrismaUnion<_i2.StringFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? codeSecret;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentWhereUniqueInput({
    this.id,
    this.matricule,
    this.AND,
    this.OR,
    this.NOT,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final int? id;

  final String? matricule;

  final _i1.PrismaUnion<_i2.AgentWhereInput, Iterable<_i2.AgentWhereInput>>?
  AND;

  final Iterable<_i2.AgentWhereInput>? OR;

  final _i1.PrismaUnion<_i2.AgentWhereInput, Iterable<_i2.AgentWhereInput>>?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.StringFilter, String>? codeSecret;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentOrderByWithRelationInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? codeSecret;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

enum AgentScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Agent'),
  matricule<String>('matricule', 'Agent'),
  nom<String>('nom', 'Agent'),
  prenom<String>('prenom', 'Agent'),
  codeSecret<String>('codeSecret', 'Agent'),
  poste<String>('poste', 'Agent');

  const AgentScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class AgentCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentCreateInput({
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.codeSecret,
    this.poste,
  });

  final String matricule;

  final String nom;

  final String prenom;

  final String codeSecret;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? poste;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentUncheckedCreateInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.codeSecret,
    this.poste,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final String codeSecret;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentCreateManyInput({
    this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.codeSecret,
    this.poste,
  });

  final int? id;

  final String matricule;

  final String nom;

  final String prenom;

  final String codeSecret;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class CreateManyAgentAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyAgentAndReturnOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentUpdateInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentUncheckedUpdateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentUpdateManyMutationInput({
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentUncheckedUpdateManyInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  matricule;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? nom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? prenom;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  codeSecret;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class UpdateManyAgentAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UpdateManyAgentAndReturnOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentCountAggregateOutputType {
  const AgentCountAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
    this.$all,
  });

  factory AgentCountAggregateOutputType.fromJson(Map json) =>
      AgentCountAggregateOutputType(
        id: json['id'],
        matricule: json['matricule'],
        nom: json['nom'],
        prenom: json['prenom'],
        codeSecret: json['codeSecret'],
        poste: json['poste'],
        $all: json['_all'],
      );

  final int? id;

  final int? matricule;

  final int? nom;

  final int? prenom;

  final int? codeSecret;

  final int? poste;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
    '_all': $all,
  };
}

class AgentAvgAggregateOutputType {
  const AgentAvgAggregateOutputType({this.id});

  factory AgentAvgAggregateOutputType.fromJson(Map json) =>
      AgentAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class AgentSumAggregateOutputType {
  const AgentSumAggregateOutputType({this.id});

  factory AgentSumAggregateOutputType.fromJson(Map json) =>
      AgentSumAggregateOutputType(id: json['id']);

  final int? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class AgentMinAggregateOutputType {
  const AgentMinAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  factory AgentMinAggregateOutputType.fromJson(Map json) =>
      AgentMinAggregateOutputType(
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

class AgentMaxAggregateOutputType {
  const AgentMaxAggregateOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  factory AgentMaxAggregateOutputType.fromJson(Map json) =>
      AgentMaxAggregateOutputType(
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

class AgentGroupByOutputType {
  const AgentGroupByOutputType({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AgentGroupByOutputType.fromJson(Map json) => AgentGroupByOutputType(
    id: json['id'],
    matricule: json['matricule'],
    nom: json['nom'],
    prenom: json['prenom'],
    codeSecret: json['codeSecret'],
    poste: json['poste'],
    $count: json['_count'] is Map
        ? _i2.AgentCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.AgentAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.AgentSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.AgentMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.AgentMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final int? id;

  final String? matricule;

  final String? nom;

  final String? prenom;

  final String? codeSecret;

  final String? poste;

  final _i2.AgentCountAggregateOutputType? $count;

  final _i2.AgentAvgAggregateOutputType? $avg;

  final _i2.AgentSumAggregateOutputType? $sum;

  final _i2.AgentMinAggregateOutputType? $min;

  final _i2.AgentMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AgentCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentCountOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class AgentMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentMaxOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentMinOrderByAggregateInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? codeSecret;

  final _i2.SortOrder? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class AgentOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentOrderByWithAggregationInput({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? matricule;

  final _i2.SortOrder? nom;

  final _i2.SortOrder? prenom;

  final _i2.SortOrder? codeSecret;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? poste;

  final _i2.AgentCountOrderByAggregateInput? $count;

  final _i2.AgentAvgOrderByAggregateInput? $avg;

  final _i2.AgentMaxOrderByAggregateInput? $max;

  final _i2.AgentMinOrderByAggregateInput? $min;

  final _i2.AgentSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class AgentScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final _i1.PrismaUnion<
    _i2.AgentScalarWhereWithAggregatesInput,
    Iterable<_i2.AgentScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.AgentScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.AgentScalarWhereWithAggregatesInput,
    Iterable<_i2.AgentScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? matricule;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? nom;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? prenom;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? codeSecret;

  final _i1.PrismaUnion<
    _i2.StringNullableWithAggregatesFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  poste;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentCountAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
    this.$all,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
    '_all': $all,
  };
}

class AgentGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeCountArgs({this.select});

  final _i2.AgentCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AgentAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class AgentGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeAvgArgs({this.select});

  final _i2.AgentAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AgentSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class AgentGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeSumArgs({this.select});

  final _i2.AgentSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AgentMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentMinAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeMinArgs({this.select});

  final _i2.AgentMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AgentMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentMaxAggregateOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
  };
}

class AgentGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeMaxArgs({this.select});

  final _i2.AgentMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AgentGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AgentGroupByOutputTypeSelect({
    this.id,
    this.matricule,
    this.nom,
    this.prenom,
    this.codeSecret,
    this.poste,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? matricule;

  final bool? nom;

  final bool? prenom;

  final bool? codeSecret;

  final bool? poste;

  final _i1.PrismaUnion<bool, _i2.AgentGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AgentGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AgentGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AgentGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AgentGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'nom': nom,
    'prenom': prenom,
    'codeSecret': codeSecret,
    'poste': poste,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateAgent {
  const AggregateAgent({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateAgent.fromJson(Map json) => AggregateAgent(
    $count: json['_count'] is Map
        ? _i2.AgentCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.AgentAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.AgentSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.AgentMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.AgentMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.AgentCountAggregateOutputType? $count;

  final _i2.AgentAvgAggregateOutputType? $avg;

  final _i2.AgentSumAggregateOutputType? $sum;

  final _i2.AgentMinAggregateOutputType? $min;

  final _i2.AgentMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateAgentCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentCountArgs({this.select});

  final _i2.AgentCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAgentAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentAvgArgs({this.select});

  final _i2.AgentAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAgentSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentSumArgs({this.select});

  final _i2.AgentSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAgentMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentMinArgs({this.select});

  final _i2.AgentMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAgentMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentMaxArgs({this.select});

  final _i2.AgentMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAgentSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAgentSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateAgentCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateAgentAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateAgentSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateAgentMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateAgentMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}
