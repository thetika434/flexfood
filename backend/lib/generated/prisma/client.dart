// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/dmmf.dart' as _i4;
import 'package:orm/engines/binary.dart' as _i5;
import 'package:orm/orm.dart' as _i1;

import 'model.dart' as _i2;
import 'prisma.dart' as _i3;

class EtudiantDelegate {
  const EtudiantDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Etudiant?> findUnique({
    required _i3.EtudiantWhereUniqueInput where,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant?>(
      action: 'findUniqueEtudiant',
      result: result,
      factory: (e) => e != null ? _i2.Etudiant.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Etudiant> findUniqueOrThrow({
    required _i3.EtudiantWhereUniqueInput where,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant>(
      action: 'findUniqueEtudiantOrThrow',
      result: result,
      factory: (e) => _i2.Etudiant.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Etudiant?> findFirst({
    _i3.EtudiantWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.EtudiantOrderByWithRelationInput>,
      _i3.EtudiantOrderByWithRelationInput
    >?
    orderBy,
    _i3.EtudiantWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.EtudiantScalar, Iterable<_i3.EtudiantScalar>>? distinct,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant?>(
      action: 'findFirstEtudiant',
      result: result,
      factory: (e) => e != null ? _i2.Etudiant.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Etudiant> findFirstOrThrow({
    _i3.EtudiantWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.EtudiantOrderByWithRelationInput>,
      _i3.EtudiantOrderByWithRelationInput
    >?
    orderBy,
    _i3.EtudiantWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.EtudiantScalar, Iterable<_i3.EtudiantScalar>>? distinct,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant>(
      action: 'findFirstEtudiantOrThrow',
      result: result,
      factory: (e) => _i2.Etudiant.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Etudiant>> findMany({
    _i3.EtudiantWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.EtudiantOrderByWithRelationInput>,
      _i3.EtudiantOrderByWithRelationInput
    >?
    orderBy,
    _i3.EtudiantWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.EtudiantScalar, Iterable<_i3.EtudiantScalar>>? distinct,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Etudiant>>(
      action: 'findManyEtudiant',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Etudiant.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Etudiant> create({
    required _i1.PrismaUnion<
      _i3.EtudiantCreateInput,
      _i3.EtudiantUncheckedCreateInput
    >
    data,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {'data': data, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant>(
      action: 'createOneEtudiant',
      result: result,
      factory: (e) => _i2.Etudiant.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany({
    required _i1.PrismaUnion<
      _i3.EtudiantCreateManyInput,
      Iterable<_i3.EtudiantCreateManyInput>
    >
    data,
    bool? skipDuplicates,
  }) {
    final args = {'data': data, 'skipDuplicates': skipDuplicates};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyEtudiant',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyEtudiantAndReturnOutputType>>
  createManyAndReturn({
    required _i1.PrismaUnion<
      _i3.EtudiantCreateManyInput,
      Iterable<_i3.EtudiantCreateManyInput>
    >
    data,
    bool? skipDuplicates,
    _i3.CreateManyEtudiantAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'skipDuplicates': skipDuplicates,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<
      Iterable<_i2.CreateManyEtudiantAndReturnOutputType>
    >(
      action: 'createManyEtudiantAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.CreateManyEtudiantAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Etudiant?> update({
    required _i1.PrismaUnion<
      _i3.EtudiantUpdateInput,
      _i3.EtudiantUncheckedUpdateInput
    >
    data,
    required _i3.EtudiantWhereUniqueInput where,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant?>(
      action: 'updateOneEtudiant',
      result: result,
      factory: (e) => e != null ? _i2.Etudiant.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.EtudiantUpdateManyMutationInput,
      _i3.EtudiantUncheckedUpdateManyInput
    >
    data,
    _i3.EtudiantWhereInput? where,
    int? limit,
  }) {
    final args = {'data': data, 'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyEtudiant',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.UpdateManyEtudiantAndReturnOutputType>>
  updateManyAndReturn({
    required _i1.PrismaUnion<
      _i3.EtudiantUpdateManyMutationInput,
      _i3.EtudiantUncheckedUpdateManyInput
    >
    data,
    _i3.EtudiantWhereInput? where,
    int? limit,
    _i3.UpdateManyEtudiantAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'where': where,
      'limit': limit,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.updateManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<
      Iterable<_i2.UpdateManyEtudiantAndReturnOutputType>
    >(
      action: 'updateManyEtudiantAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.UpdateManyEtudiantAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Etudiant> upsert({
    required _i3.EtudiantWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.EtudiantCreateInput,
      _i3.EtudiantUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.EtudiantUpdateInput,
      _i3.EtudiantUncheckedUpdateInput
    >
    update,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant>(
      action: 'upsertOneEtudiant',
      result: result,
      factory: (e) => _i2.Etudiant.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Etudiant?> delete({
    required _i3.EtudiantWhereUniqueInput where,
    _i3.EtudiantSelect? select,
    _i3.EtudiantInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Etudiant?>(
      action: 'deleteOneEtudiant',
      result: result,
      factory: (e) => e != null ? _i2.Etudiant.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.EtudiantWhereInput? where,
    int? limit,
  }) {
    final args = {'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyEtudiant',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.EtudiantGroupByOutputType>> groupBy({
    _i3.EtudiantWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.EtudiantOrderByWithAggregationInput>,
      _i3.EtudiantOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<Iterable<_i3.EtudiantScalar>, _i3.EtudiantScalar>
    by,
    _i3.EtudiantScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.EtudiantGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.EtudiantGroupByOutputType>>(
      action: 'groupByEtudiant',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.EtudiantGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateEtudiant> aggregate({
    _i3.EtudiantWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.EtudiantOrderByWithRelationInput>,
      _i3.EtudiantOrderByWithRelationInput
    >?
    orderBy,
    _i3.EtudiantWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateEtudiantSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Etudiant',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateEtudiant>(
      action: 'aggregateEtudiant',
      result: result,
      factory: (e) => _i3.AggregateEtudiant.fromJson(e),
    );
  }
}

class TransactionDelegate {
  const TransactionDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Transaction?> findUnique({
    required _i3.TransactionWhereUniqueInput where,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction?>(
      action: 'findUniqueTransaction',
      result: result,
      factory: (e) => e != null ? _i2.Transaction.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Transaction> findUniqueOrThrow({
    required _i3.TransactionWhereUniqueInput where,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction>(
      action: 'findUniqueTransactionOrThrow',
      result: result,
      factory: (e) => _i2.Transaction.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Transaction?> findFirst({
    _i3.TransactionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.TransactionOrderByWithRelationInput>,
      _i3.TransactionOrderByWithRelationInput
    >?
    orderBy,
    _i3.TransactionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TransactionScalar, Iterable<_i3.TransactionScalar>>?
    distinct,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction?>(
      action: 'findFirstTransaction',
      result: result,
      factory: (e) => e != null ? _i2.Transaction.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Transaction> findFirstOrThrow({
    _i3.TransactionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.TransactionOrderByWithRelationInput>,
      _i3.TransactionOrderByWithRelationInput
    >?
    orderBy,
    _i3.TransactionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TransactionScalar, Iterable<_i3.TransactionScalar>>?
    distinct,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction>(
      action: 'findFirstTransactionOrThrow',
      result: result,
      factory: (e) => _i2.Transaction.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Transaction>> findMany({
    _i3.TransactionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.TransactionOrderByWithRelationInput>,
      _i3.TransactionOrderByWithRelationInput
    >?
    orderBy,
    _i3.TransactionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TransactionScalar, Iterable<_i3.TransactionScalar>>?
    distinct,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Transaction>>(
      action: 'findManyTransaction',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Transaction.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Transaction> create({
    required _i1.PrismaUnion<
      _i3.TransactionCreateInput,
      _i3.TransactionUncheckedCreateInput
    >
    data,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {'data': data, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction>(
      action: 'createOneTransaction',
      result: result,
      factory: (e) => _i2.Transaction.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany({
    required _i1.PrismaUnion<
      _i3.TransactionCreateManyInput,
      Iterable<_i3.TransactionCreateManyInput>
    >
    data,
    bool? skipDuplicates,
  }) {
    final args = {'data': data, 'skipDuplicates': skipDuplicates};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyTransaction',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyTransactionAndReturnOutputType>>
  createManyAndReturn({
    required _i1.PrismaUnion<
      _i3.TransactionCreateManyInput,
      Iterable<_i3.TransactionCreateManyInput>
    >
    data,
    bool? skipDuplicates,
    _i3.CreateManyTransactionAndReturnOutputTypeSelect? select,
    _i3.CreateManyTransactionAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'skipDuplicates': skipDuplicates,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<
      Iterable<_i2.CreateManyTransactionAndReturnOutputType>
    >(
      action: 'createManyTransactionAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.CreateManyTransactionAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Transaction?> update({
    required _i1.PrismaUnion<
      _i3.TransactionUpdateInput,
      _i3.TransactionUncheckedUpdateInput
    >
    data,
    required _i3.TransactionWhereUniqueInput where,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction?>(
      action: 'updateOneTransaction',
      result: result,
      factory: (e) => e != null ? _i2.Transaction.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.TransactionUpdateManyMutationInput,
      _i3.TransactionUncheckedUpdateManyInput
    >
    data,
    _i3.TransactionWhereInput? where,
    int? limit,
  }) {
    final args = {'data': data, 'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyTransaction',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.UpdateManyTransactionAndReturnOutputType>>
  updateManyAndReturn({
    required _i1.PrismaUnion<
      _i3.TransactionUpdateManyMutationInput,
      _i3.TransactionUncheckedUpdateManyInput
    >
    data,
    _i3.TransactionWhereInput? where,
    int? limit,
    _i3.UpdateManyTransactionAndReturnOutputTypeSelect? select,
    _i3.UpdateManyTransactionAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'limit': limit,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.updateManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<
      Iterable<_i2.UpdateManyTransactionAndReturnOutputType>
    >(
      action: 'updateManyTransactionAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.UpdateManyTransactionAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Transaction> upsert({
    required _i3.TransactionWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.TransactionCreateInput,
      _i3.TransactionUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.TransactionUpdateInput,
      _i3.TransactionUncheckedUpdateInput
    >
    update,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction>(
      action: 'upsertOneTransaction',
      result: result,
      factory: (e) => _i2.Transaction.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Transaction?> delete({
    required _i3.TransactionWhereUniqueInput where,
    _i3.TransactionSelect? select,
    _i3.TransactionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Transaction?>(
      action: 'deleteOneTransaction',
      result: result,
      factory: (e) => e != null ? _i2.Transaction.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.TransactionWhereInput? where,
    int? limit,
  }) {
    final args = {'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyTransaction',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.TransactionGroupByOutputType>> groupBy({
    _i3.TransactionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.TransactionOrderByWithAggregationInput>,
      _i3.TransactionOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.TransactionScalar>,
      _i3.TransactionScalar
    >
    by,
    _i3.TransactionScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.TransactionGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.TransactionGroupByOutputType>>(
      action: 'groupByTransaction',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.TransactionGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateTransaction> aggregate({
    _i3.TransactionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.TransactionOrderByWithRelationInput>,
      _i3.TransactionOrderByWithRelationInput
    >?
    orderBy,
    _i3.TransactionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateTransactionSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Transaction',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateTransaction>(
      action: 'aggregateTransaction',
      result: result,
      factory: (e) => _i3.AggregateTransaction.fromJson(e),
    );
  }
}

class SessionDelegate {
  const SessionDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Session?> findUnique({
    required _i3.SessionWhereUniqueInput where,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session?>(
      action: 'findUniqueSession',
      result: result,
      factory: (e) => e != null ? _i2.Session.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Session> findUniqueOrThrow({
    required _i3.SessionWhereUniqueInput where,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session>(
      action: 'findUniqueSessionOrThrow',
      result: result,
      factory: (e) => _i2.Session.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Session?> findFirst({
    _i3.SessionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionOrderByWithRelationInput>,
      _i3.SessionOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionScalar, Iterable<_i3.SessionScalar>>? distinct,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session?>(
      action: 'findFirstSession',
      result: result,
      factory: (e) => e != null ? _i2.Session.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Session> findFirstOrThrow({
    _i3.SessionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionOrderByWithRelationInput>,
      _i3.SessionOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionScalar, Iterable<_i3.SessionScalar>>? distinct,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session>(
      action: 'findFirstSessionOrThrow',
      result: result,
      factory: (e) => _i2.Session.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Session>> findMany({
    _i3.SessionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionOrderByWithRelationInput>,
      _i3.SessionOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionScalar, Iterable<_i3.SessionScalar>>? distinct,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Session>>(
      action: 'findManySession',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Session.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Session> create({
    required _i1.PrismaUnion<
      _i3.SessionCreateInput,
      _i3.SessionUncheckedCreateInput
    >
    data,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {'data': data, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session>(
      action: 'createOneSession',
      result: result,
      factory: (e) => _i2.Session.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany({
    required _i1.PrismaUnion<
      _i3.SessionCreateManyInput,
      Iterable<_i3.SessionCreateManyInput>
    >
    data,
    bool? skipDuplicates,
  }) {
    final args = {'data': data, 'skipDuplicates': skipDuplicates};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManySession',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManySessionAndReturnOutputType>>
  createManyAndReturn({
    required _i1.PrismaUnion<
      _i3.SessionCreateManyInput,
      Iterable<_i3.SessionCreateManyInput>
    >
    data,
    bool? skipDuplicates,
    _i3.CreateManySessionAndReturnOutputTypeSelect? select,
    _i3.CreateManySessionAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'skipDuplicates': skipDuplicates,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManySessionAndReturnOutputType>>(
      action: 'createManySessionAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.CreateManySessionAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Session?> update({
    required _i1.PrismaUnion<
      _i3.SessionUpdateInput,
      _i3.SessionUncheckedUpdateInput
    >
    data,
    required _i3.SessionWhereUniqueInput where,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session?>(
      action: 'updateOneSession',
      result: result,
      factory: (e) => e != null ? _i2.Session.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.SessionUpdateManyMutationInput,
      _i3.SessionUncheckedUpdateManyInput
    >
    data,
    _i3.SessionWhereInput? where,
    int? limit,
  }) {
    final args = {'data': data, 'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManySession',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.UpdateManySessionAndReturnOutputType>>
  updateManyAndReturn({
    required _i1.PrismaUnion<
      _i3.SessionUpdateManyMutationInput,
      _i3.SessionUncheckedUpdateManyInput
    >
    data,
    _i3.SessionWhereInput? where,
    int? limit,
    _i3.UpdateManySessionAndReturnOutputTypeSelect? select,
    _i3.UpdateManySessionAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'limit': limit,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.updateManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.UpdateManySessionAndReturnOutputType>>(
      action: 'updateManySessionAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.UpdateManySessionAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Session> upsert({
    required _i3.SessionWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.SessionCreateInput,
      _i3.SessionUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.SessionUpdateInput,
      _i3.SessionUncheckedUpdateInput
    >
    update,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session>(
      action: 'upsertOneSession',
      result: result,
      factory: (e) => _i2.Session.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Session?> delete({
    required _i3.SessionWhereUniqueInput where,
    _i3.SessionSelect? select,
    _i3.SessionInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Session?>(
      action: 'deleteOneSession',
      result: result,
      factory: (e) => e != null ? _i2.Session.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.SessionWhereInput? where,
    int? limit,
  }) {
    final args = {'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManySession',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.SessionGroupByOutputType>> groupBy({
    _i3.SessionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionOrderByWithAggregationInput>,
      _i3.SessionOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<Iterable<_i3.SessionScalar>, _i3.SessionScalar> by,
    _i3.SessionScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.SessionGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.SessionGroupByOutputType>>(
      action: 'groupBySession',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.SessionGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateSession> aggregate({
    _i3.SessionWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionOrderByWithRelationInput>,
      _i3.SessionOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateSessionSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Session',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateSession>(
      action: 'aggregateSession',
      result: result,
      factory: (e) => _i3.AggregateSession.fromJson(e),
    );
  }
}

class AgentDelegate {
  const AgentDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Agent?> findUnique({
    required _i3.AgentWhereUniqueInput where,
    _i3.AgentSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent?>(
      action: 'findUniqueAgent',
      result: result,
      factory: (e) => e != null ? _i2.Agent.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Agent> findUniqueOrThrow({
    required _i3.AgentWhereUniqueInput where,
    _i3.AgentSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent>(
      action: 'findUniqueAgentOrThrow',
      result: result,
      factory: (e) => _i2.Agent.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Agent?> findFirst({
    _i3.AgentWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AgentOrderByWithRelationInput>,
      _i3.AgentOrderByWithRelationInput
    >?
    orderBy,
    _i3.AgentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AgentScalar, Iterable<_i3.AgentScalar>>? distinct,
    _i3.AgentSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent?>(
      action: 'findFirstAgent',
      result: result,
      factory: (e) => e != null ? _i2.Agent.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Agent> findFirstOrThrow({
    _i3.AgentWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AgentOrderByWithRelationInput>,
      _i3.AgentOrderByWithRelationInput
    >?
    orderBy,
    _i3.AgentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AgentScalar, Iterable<_i3.AgentScalar>>? distinct,
    _i3.AgentSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent>(
      action: 'findFirstAgentOrThrow',
      result: result,
      factory: (e) => _i2.Agent.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Agent>> findMany({
    _i3.AgentWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AgentOrderByWithRelationInput>,
      _i3.AgentOrderByWithRelationInput
    >?
    orderBy,
    _i3.AgentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AgentScalar, Iterable<_i3.AgentScalar>>? distinct,
    _i3.AgentSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Agent>>(
      action: 'findManyAgent',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Agent.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Agent> create({
    required _i1.PrismaUnion<
      _i3.AgentCreateInput,
      _i3.AgentUncheckedCreateInput
    >
    data,
    _i3.AgentSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent>(
      action: 'createOneAgent',
      result: result,
      factory: (e) => _i2.Agent.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany({
    required _i1.PrismaUnion<
      _i3.AgentCreateManyInput,
      Iterable<_i3.AgentCreateManyInput>
    >
    data,
    bool? skipDuplicates,
  }) {
    final args = {'data': data, 'skipDuplicates': skipDuplicates};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyAgent',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyAgentAndReturnOutputType>>
  createManyAndReturn({
    required _i1.PrismaUnion<
      _i3.AgentCreateManyInput,
      Iterable<_i3.AgentCreateManyInput>
    >
    data,
    bool? skipDuplicates,
    _i3.CreateManyAgentAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'skipDuplicates': skipDuplicates,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManyAgentAndReturnOutputType>>(
      action: 'createManyAgentAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.CreateManyAgentAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Agent?> update({
    required _i1.PrismaUnion<
      _i3.AgentUpdateInput,
      _i3.AgentUncheckedUpdateInput
    >
    data,
    required _i3.AgentWhereUniqueInput where,
    _i3.AgentSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent?>(
      action: 'updateOneAgent',
      result: result,
      factory: (e) => e != null ? _i2.Agent.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.AgentUpdateManyMutationInput,
      _i3.AgentUncheckedUpdateManyInput
    >
    data,
    _i3.AgentWhereInput? where,
    int? limit,
  }) {
    final args = {'data': data, 'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyAgent',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.UpdateManyAgentAndReturnOutputType>>
  updateManyAndReturn({
    required _i1.PrismaUnion<
      _i3.AgentUpdateManyMutationInput,
      _i3.AgentUncheckedUpdateManyInput
    >
    data,
    _i3.AgentWhereInput? where,
    int? limit,
    _i3.UpdateManyAgentAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'where': where,
      'limit': limit,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.updateManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.UpdateManyAgentAndReturnOutputType>>(
      action: 'updateManyAgentAndReturn',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i2.UpdateManyAgentAndReturnOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i2.Agent> upsert({
    required _i3.AgentWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.AgentCreateInput,
      _i3.AgentUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.AgentUpdateInput,
      _i3.AgentUncheckedUpdateInput
    >
    update,
    _i3.AgentSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent>(
      action: 'upsertOneAgent',
      result: result,
      factory: (e) => _i2.Agent.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Agent?> delete({
    required _i3.AgentWhereUniqueInput where,
    _i3.AgentSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Agent?>(
      action: 'deleteOneAgent',
      result: result,
      factory: (e) => e != null ? _i2.Agent.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.AgentWhereInput? where,
    int? limit,
  }) {
    final args = {'where': where, 'limit': limit};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyAgent',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.AgentGroupByOutputType>> groupBy({
    _i3.AgentWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AgentOrderByWithAggregationInput>,
      _i3.AgentOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<Iterable<_i3.AgentScalar>, _i3.AgentScalar> by,
    _i3.AgentScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.AgentGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.AgentGroupByOutputType>>(
      action: 'groupByAgent',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.AgentGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateAgent> aggregate({
    _i3.AgentWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AgentOrderByWithRelationInput>,
      _i3.AgentOrderByWithRelationInput
    >?
    orderBy,
    _i3.AgentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateAgentSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Agent',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateAgent>(
      action: 'aggregateAgent',
      result: result,
      factory: (e) => _i3.AggregateAgent.fromJson(e),
    );
  }
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient({
    super.datasourceUrl,
    super.datasources,
    super.errorFormat,
    super.log,
    _i1.Engine? engine,
  }) : _engine = engine;

  static final datamodel = _i4.DataModel.fromJson({
    'enums': [],
    'models': [
      {
        'name': 'Etudiant',
        'dbName': 'etudiants',
        'schema': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'nativeType': null,
            'default': {'name': 'autoincrement', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'matricule',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['20'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'nom',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['50'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'prenom',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['50'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'solde',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'nativeType': null,
            'default': 0,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'codeSecret',
            'dbName': 'code_secret',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['100'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'codeQr',
            'dbName': 'code_qr',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['100'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'transactions',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Transaction',
            'nativeType': null,
            'relationName': 'EtudiantToTransaction',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'sessions',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Session',
            'nativeType': null,
            'relationName': 'EtudiantToSession',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Transaction',
        'dbName': 'transactions',
        'schema': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['10'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'type',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['30'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'montant',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'nativeType': null,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'dateHeure',
            'dbName': 'date_heure',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'DateTime',
            'nativeType': null,
            'default': {'name': 'now', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'etudiantId',
            'dbName': 'etudiant_id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'Int',
            'nativeType': null,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'autrePartiMatricule',
            'dbName': 'autre_parti_matricule',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['20'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'service',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['20'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'etudiant',
            'kind': 'object',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Etudiant',
            'nativeType': null,
            'relationName': 'EtudiantToTransaction',
            'relationFromFields': ['etudiantId'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Session',
        'dbName': 'sessions',
        'schema': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'nativeType': null,
            'default': {'name': 'autoincrement', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'etudiantId',
            'dbName': 'etudiant_id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'Int',
            'nativeType': null,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'token',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': null,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'dateExpiration',
            'dbName': 'date_expiration',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'DateTime',
            'nativeType': null,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'etudiant',
            'kind': 'object',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Etudiant',
            'nativeType': null,
            'relationName': 'EtudiantToSession',
            'relationFromFields': ['etudiantId'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Agent',
        'dbName': 'agents',
        'schema': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'nativeType': null,
            'default': {'name': 'autoincrement', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'matricule',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['20'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'nom',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['50'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'prenom',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['50'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'codeSecret',
            'dbName': 'code_secret',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['100'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'poste',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'nativeType': [
              'VarChar',
              ['50'],
            ],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
    ],
    'types': [],
    'indexes': [
      {
        'model': 'Etudiant',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'},
        ],
      },
      {
        'model': 'Etudiant',
        'type': 'unique',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'matricule'},
        ],
      },
      {
        'model': 'Etudiant',
        'type': 'unique',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'codeQr'},
        ],
      },
      {
        'model': 'Transaction',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'},
        ],
      },
      {
        'model': 'Session',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'},
        ],
      },
      {
        'model': 'Agent',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'},
        ],
      },
      {
        'model': 'Agent',
        'type': 'unique',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'matricule'},
        ],
      },
    ],
  });

  _i1.Engine? _engine;

  _i1.TransactionClient<PrismaClient>? _transaction;

  @override
  get $transaction {
    if (_transaction != null) return _transaction!;
    PrismaClient factory(_i1.TransactionClient<PrismaClient> transaction) {
      final client = PrismaClient(
        engine: $engine,
        datasources: $options.datasources,
        datasourceUrl: $options.datasourceUrl,
        errorFormat: $options.errorFormat,
        log: $options.logEmitter.definition,
      );
      client.$options.logEmitter = $options.logEmitter;
      client._transaction = transaction;

      return client;
    }

    return _transaction = _i1.TransactionClient<PrismaClient>($engine, factory);
  }

  @override
  get $engine => _engine ??= _i5.BinaryEngine(
    schema:
        'generator client {\n  provider = "./dart_wrapper.sh run orm"\n  output   = "../lib/generated/prisma"\n}\n\ndatasource db {\n  provider = "postgresql"\n  url      = env("DATABASE_URL")\n}\n\nmodel Etudiant {\n  id           Int           @id @default(autoincrement())\n  matricule    String        @unique @db.VarChar(20)\n  nom          String        @db.VarChar(50)\n  prenom       String        @db.VarChar(50)\n  solde        Int           @default(0)\n  codeSecret   String        @map("code_secret") @db.VarChar(100)\n  codeQr       String        @unique @map("code_qr") @db.VarChar(100)\n  transactions Transaction[]\n  sessions     Session[]\n\n  @@map("etudiants")\n}\n\nmodel Transaction {\n  id                  String   @id @db.VarChar(10)\n  type                String   @db.VarChar(30)\n  montant             Int\n  dateHeure           DateTime @default(now()) @map("date_heure")\n  etudiantId          Int      @map("etudiant_id")\n  autrePartiMatricule String?  @map("autre_parti_matricule") @db.VarChar(20)\n  service             String?  @db.VarChar(20)\n  etudiant            Etudiant @relation(fields: [etudiantId], references: [id])\n\n  @@map("transactions")\n}\n\nmodel Session {\n  id             Int      @id @default(autoincrement())\n  etudiantId     Int      @map("etudiant_id")\n  token          String\n  dateExpiration DateTime @map("date_expiration")\n  etudiant       Etudiant @relation(fields: [etudiantId], references: [id])\n\n  @@map("sessions")\n}\n\nmodel Agent {\n  id         Int     @id @default(autoincrement())\n  matricule  String  @unique @db.VarChar(20)\n  nom        String  @db.VarChar(50)\n  prenom     String  @db.VarChar(50)\n  codeSecret String  @map("code_secret") @db.VarChar(100)\n  poste      String? @db.VarChar(50)\n\n  @@map("agents")\n}\n',
    datasources: const {
      'db': _i1.Datasource(
        _i1.DatasourceType.url,
        'postgresql://postgres:mMjWnhgByXaVizmYMeKqtobgVSwIajAQ@zephyr.proxy.rlwy.net:54918/railway',
      ),
    },
    options: $options,
  );

  @override
  get $datamodel => datamodel;

  EtudiantDelegate get etudiant => EtudiantDelegate._(this);

  TransactionDelegate get transaction => TransactionDelegate._(this);

  SessionDelegate get session => SessionDelegate._(this);

  AgentDelegate get agent => AgentDelegate._(this);
}
