// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventoStockCollection on Isar {
  IsarCollection<EventoStock> get eventoStocks => this.collection();
}

const EventoStockSchema = CollectionSchema(
  name: r'EventoStock',
  id: 4038691043353875968,
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
  estimateSize: _eventoStockEstimateSize,
  serialize: _eventoStockSerialize,
  deserialize: _eventoStockDeserialize,
  deserializeProp: _eventoStockDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _eventoStockGetId,
  getLinks: _eventoStockGetLinks,
  attach: _eventoStockAttach,
  version: '3.1.0+1',
);

int _eventoStockEstimateSize(
  EventoStock object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _eventoStockSerialize(
  EventoStock object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateFinished);
  writer.writeLong(offsets[1], object.productId);
  writer.writeDouble(offsets[2], object.quantityThatFinished);
}

EventoStock _eventoStockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventoStock();
  object.dateFinished = reader.readDateTime(offsets[0]);
  object.id = id;
  object.productId = reader.readLong(offsets[1]);
  object.quantityThatFinished = reader.readDouble(offsets[2]);
  return object;
}

P _eventoStockDeserializeProp<P>(
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

Id _eventoStockGetId(EventoStock object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eventoStockGetLinks(EventoStock object) {
  return [];
}

void _eventoStockAttach(
    IsarCollection<dynamic> col, Id id, EventoStock object) {
  object.id = id;
}

extension EventoStockQueryWhereSort
    on QueryBuilder<EventoStock, EventoStock, QWhere> {
  QueryBuilder<EventoStock, EventoStock, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventoStockQueryWhere
    on QueryBuilder<EventoStock, EventoStock, QWhereClause> {
  QueryBuilder<EventoStock, EventoStock, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<EventoStock, EventoStock, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterWhereClause> idBetween(
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

extension EventoStockQueryFilter
    on QueryBuilder<EventoStock, EventoStock, QFilterCondition> {
  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
      dateFinishedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
      productIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
      productIdLessThan(
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
      productIdBetween(
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

  QueryBuilder<EventoStock, EventoStock, QAfterFilterCondition>
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

extension EventoStockQueryObject
    on QueryBuilder<EventoStock, EventoStock, QFilterCondition> {}

extension EventoStockQueryLinks
    on QueryBuilder<EventoStock, EventoStock, QFilterCondition> {}

extension EventoStockQuerySortBy
    on QueryBuilder<EventoStock, EventoStock, QSortBy> {
  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> sortByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      sortByDateFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.desc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      sortByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      sortByQuantityThatFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.desc);
    });
  }
}

extension EventoStockQuerySortThenBy
    on QueryBuilder<EventoStock, EventoStock, QSortThenBy> {
  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> thenByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      thenByDateFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateFinished', Sort.desc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy> thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      thenByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.asc);
    });
  }

  QueryBuilder<EventoStock, EventoStock, QAfterSortBy>
      thenByQuantityThatFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityThatFinished', Sort.desc);
    });
  }
}

extension EventoStockQueryWhereDistinct
    on QueryBuilder<EventoStock, EventoStock, QDistinct> {
  QueryBuilder<EventoStock, EventoStock, QDistinct> distinctByDateFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateFinished');
    });
  }

  QueryBuilder<EventoStock, EventoStock, QDistinct> distinctByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId');
    });
  }

  QueryBuilder<EventoStock, EventoStock, QDistinct>
      distinctByQuantityThatFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityThatFinished');
    });
  }
}

extension EventoStockQueryProperty
    on QueryBuilder<EventoStock, EventoStock, QQueryProperty> {
  QueryBuilder<EventoStock, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EventoStock, DateTime, QQueryOperations> dateFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateFinished');
    });
  }

  QueryBuilder<EventoStock, int, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<EventoStock, double, QQueryOperations>
      quantityThatFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityThatFinished');
    });
  }
}
