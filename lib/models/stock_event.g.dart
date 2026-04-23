// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockEventCollection on Isar {
  IsarCollection<StockEvent> get stockEvents => this.collection();
}

const StockEventSchema = CollectionSchema(
  name: r'StockEvent',
  id: 91906734120826028,
  properties: {
    r'dateFinished': PropertySchema(
      id: 0,
      name: r'dateFinished',
      type: IsarType.dateTime,
    ),
    r'productId': PropertySchema(
      id: 1,
      name: r'productId',
      type: IsarType.long,
    ),
    r'quantityThatFinished': PropertySchema(
      id: 2,
      name: r'quantityThatFinished',
      type: IsarType.double,
    )
  },
  estimateSize: _stockEventEstimateSize,
  serialize: _stockEventSerialize,
  deserialize: _stockEventDeserialize,
  deserializeProp: _stockEventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stockEventGetId,
  getLinks: _stockEventGetLinks,
  attach: _stockEventAttach,
  version: '3.1.0+1',
);

int _stockEventEstimateSize(
  StockEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _stockEventSerialize(
  StockEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateFinished);
  writer.writeLong(offsets[1], object.productId);
  writer.writeDouble(offsets[2], object.quantityThatFinished);
}

StockEvent _stockEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StockEvent();
  object.dateFinished = reader.readDateTime(offsets[0]);
  object.id = id;
  object.productId = reader.readLong(offsets[1]);
  object.quantityThatFinished = reader.readDouble(offsets[2]);
  return object;
}

P _stockEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stockEventGetId(StockEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stockEventGetLinks(StockEvent object) {
  return [];
}

void _stockEventAttach(IsarCollection<dynamic> col, Id id, StockEvent object) {
  object.id = id;
}

extension StockEventQueryWhereSort
    on QueryBuilder<StockEvent, StockEvent, QWhere> {
  QueryBuilder<StockEvent, StockEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StockEventQueryWhere
    on QueryBuilder<StockEvent, StockEvent, QWhereClause> {
  QueryBuilder<StockEvent, StockEvent, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StockEventQueryFilter
    on QueryBuilder<StockEvent, StockEvent, QFilterCondition> {
  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      dateFinishedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      dateFinishedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      dateFinishedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      dateFinishedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateFinished',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> productIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      productIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> productIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition> productIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      quantityThatFinishedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityThatFinished',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      quantityThatFinishedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityThatFinished',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      quantityThatFinishedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityThatFinished',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterFilterCondition>
      quantityThatFinishedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityThatFinished',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension StockEventQueryObject
    on QueryBuilder<StockEvent, StockEvent, QFilterCondition> {}

extension StockEventQueryLinks
    on QueryBuilder<StockEvent, StockEvent, QFilterCondition> {}

extension StockEventQuerySortBy
    on QueryBuilder<StockEvent, StockEvent, QSortBy> {
  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> sortByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> sortByDateFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.desc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy>
      sortByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy>
      sortByQuantityThatFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.desc);
    });
  }
}

extension StockEventQuerySortThenBy
    on QueryBuilder<StockEvent, StockEvent, QSortThenBy> {
  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenByDateFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.desc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy> thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy>
      thenByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.asc);
    });
  }

  QueryBuilder<StockEvent, StockEvent, QAfterSortBy>
      thenByQuantityThatFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.desc);
    });
  }
}

extension StockEventQueryWhereDistinct
    on QueryBuilder<StockEvent, StockEvent, QDistinct> {
  QueryBuilder<StockEvent, StockEvent, QDistinct> distinctByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateFinished');
    });
  }

  QueryBuilder<StockEvent, StockEvent, QDistinct> distinctByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId');
    });
  }

  QueryBuilder<StockEvent, StockEvent, QDistinct>
      distinctByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityThatFinished');
    });
  }
}

extension StockEventQueryProperty
    on QueryBuilder<StockEvent, StockEvent, QQueryProperty> {
  QueryBuilder<StockEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StockEvent, DateTime, QQueryOperations> dateFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateFinished');
    });
  }

  QueryBuilder<StockEvent, int, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<StockEvent, double, QQueryOperations>
      quantityThatFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityThatFinished');
    });
  }
}
