// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiday_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMultidayEventCollection on Isar {
  IsarCollection<MultidayEvent> get multidayEvents => this.collection();
}

const MultidayEventSchema = CollectionSchema(
  name: r'MultidayEvent',
  id: -3477405085871088255,
  properties: {
    r'bookmarkColorInt': PropertySchema(
      id: 0,
      name: r'bookmarkColorInt',
      type: IsarType.long,
    ),
    r'bookmarkStickerId': PropertySchema(
      id: 1,
      name: r'bookmarkStickerId',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 2,
      name: r'endDate',
      type: IsarType.string,
    ),
    r'eventsId': PropertySchema(
      id: 3,
      name: r'eventsId',
      type: IsarType.longList,
    ),
    r'startDate': PropertySchema(
      id: 4,
      name: r'startDate',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _multidayEventEstimateSize,
  serialize: _multidayEventSerialize,
  deserialize: _multidayEventDeserialize,
  deserializeProp: _multidayEventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _multidayEventGetId,
  getLinks: _multidayEventGetLinks,
  attach: _multidayEventAttach,
  version: '3.1.0+1',
);

int _multidayEventEstimateSize(
  MultidayEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookmarkStickerId.length * 3;
  bytesCount += 3 + object.endDate.length * 3;
  bytesCount += 3 + object.eventsId.length * 8;
  bytesCount += 3 + object.startDate.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _multidayEventSerialize(
  MultidayEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bookmarkColorInt);
  writer.writeString(offsets[1], object.bookmarkStickerId);
  writer.writeString(offsets[2], object.endDate);
  writer.writeLongList(offsets[3], object.eventsId);
  writer.writeString(offsets[4], object.startDate);
  writer.writeString(offsets[5], object.title);
}

MultidayEvent _multidayEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MultidayEvent();
  object.bookmarkColorInt = reader.readLong(offsets[0]);
  object.bookmarkStickerId = reader.readString(offsets[1]);
  object.endDate = reader.readString(offsets[2]);
  object.eventsId = reader.readLongList(offsets[3]) ?? [];
  object.id = id;
  object.startDate = reader.readString(offsets[4]);
  object.title = reader.readString(offsets[5]);
  return object;
}

P _multidayEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _multidayEventGetId(MultidayEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _multidayEventGetLinks(MultidayEvent object) {
  return [];
}

void _multidayEventAttach(
    IsarCollection<dynamic> col, Id id, MultidayEvent object) {
  object.id = id;
}

extension MultidayEventQueryWhereSort
    on QueryBuilder<MultidayEvent, MultidayEvent, QWhere> {
  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MultidayEventQueryWhere
    on QueryBuilder<MultidayEvent, MultidayEvent, QWhereClause> {
  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterWhereClause> idBetween(
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

extension MultidayEventQueryFilter
    on QueryBuilder<MultidayEvent, MultidayEvent, QFilterCondition> {
  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkColorIntEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookmarkColorInt',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkColorIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookmarkColorInt',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkColorIntLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookmarkColorInt',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkColorIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookmarkColorInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookmarkStickerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookmarkStickerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookmarkStickerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookmarkStickerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      bookmarkStickerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookmarkStickerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      endDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endDate',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      eventsIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eventsId',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      startDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startDate',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension MultidayEventQueryObject
    on QueryBuilder<MultidayEvent, MultidayEvent, QFilterCondition> {}

extension MultidayEventQueryLinks
    on QueryBuilder<MultidayEvent, MultidayEvent, QFilterCondition> {}

extension MultidayEventQuerySortBy
    on QueryBuilder<MultidayEvent, MultidayEvent, QSortBy> {
  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      sortByBookmarkColorInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkColorInt', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      sortByBookmarkColorIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkColorInt', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      sortByBookmarkStickerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkStickerId', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      sortByBookmarkStickerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkStickerId', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MultidayEventQuerySortThenBy
    on QueryBuilder<MultidayEvent, MultidayEvent, QSortThenBy> {
  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      thenByBookmarkColorInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkColorInt', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      thenByBookmarkColorIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkColorInt', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      thenByBookmarkStickerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkStickerId', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      thenByBookmarkStickerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkStickerId', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MultidayEventQueryWhereDistinct
    on QueryBuilder<MultidayEvent, MultidayEvent, QDistinct> {
  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct>
      distinctByBookmarkColorInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookmarkColorInt');
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct>
      distinctByBookmarkStickerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookmarkStickerId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct> distinctByEndDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct> distinctByEventsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventsId');
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct> distinctByStartDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MultidayEvent, MultidayEvent, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension MultidayEventQueryProperty
    on QueryBuilder<MultidayEvent, MultidayEvent, QQueryProperty> {
  QueryBuilder<MultidayEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MultidayEvent, int, QQueryOperations>
      bookmarkColorIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookmarkColorInt');
    });
  }

  QueryBuilder<MultidayEvent, String, QQueryOperations>
      bookmarkStickerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookmarkStickerId');
    });
  }

  QueryBuilder<MultidayEvent, String, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<MultidayEvent, List<int>, QQueryOperations> eventsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventsId');
    });
  }

  QueryBuilder<MultidayEvent, String, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<MultidayEvent, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
