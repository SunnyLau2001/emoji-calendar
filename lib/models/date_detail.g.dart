// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDateDetailCollection on Isar {
  IsarCollection<DateDetail> get dateDetails => this.collection();
}

const DateDetailSchema = CollectionSchema(
  name: r'DateDetail',
  id: 6103370944398646265,
  properties: {
    r'availableTracks': PropertySchema(
      id: 0,
      name: r'availableTracks',
      type: IsarType.longList,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.string,
    ),
    r'eventsId': PropertySchema(
      id: 2,
      name: r'eventsId',
      type: IsarType.longList,
    ),
    r'lastUpdate': PropertySchema(
      id: 3,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'multidayEventsId': PropertySchema(
      id: 4,
      name: r'multidayEventsId',
      type: IsarType.longList,
    )
  },
  estimateSize: _dateDetailEstimateSize,
  serialize: _dateDetailSerialize,
  deserialize: _dateDetailDeserialize,
  deserializeProp: _dateDetailDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dateDetailGetId,
  getLinks: _dateDetailGetLinks,
  attach: _dateDetailAttach,
  version: '3.0.6-dev.0',
);

int _dateDetailEstimateSize(
  DateDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.availableTracks.length * 8;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.eventsId.length * 8;
  bytesCount += 3 + object.multidayEventsId.length * 8;
  return bytesCount;
}

void _dateDetailSerialize(
  DateDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.availableTracks);
  writer.writeString(offsets[1], object.date);
  writer.writeLongList(offsets[2], object.eventsId);
  writer.writeDateTime(offsets[3], object.lastUpdate);
  writer.writeLongList(offsets[4], object.multidayEventsId);
}

DateDetail _dateDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DateDetail();
  object.availableTracks = reader.readLongList(offsets[0]) ?? [];
  object.date = reader.readString(offsets[1]);
  object.eventsId = reader.readLongList(offsets[2]) ?? [];
  object.lastUpdate = reader.readDateTime(offsets[3]);
  object.multidayEventsId = reader.readLongList(offsets[4]) ?? [];
  return object;
}

P _dateDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dateDetailGetId(DateDetail object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _dateDetailGetLinks(DateDetail object) {
  return [];
}

void _dateDetailAttach(IsarCollection<dynamic> col, Id id, DateDetail object) {}

extension DateDetailQueryWhereSort
    on QueryBuilder<DateDetail, DateDetail, QWhere> {
  QueryBuilder<DateDetail, DateDetail, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DateDetailQueryWhere
    on QueryBuilder<DateDetail, DateDetail, QWhereClause> {
  QueryBuilder<DateDetail, DateDetail, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DateDetailQueryFilter
    on QueryBuilder<DateDetail, DateDetail, QFilterCondition> {
  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableTracks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      availableTracksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableTracks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      eventsIdElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
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

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> lastUpdateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition> lastUpdateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'multidayEventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'multidayEventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'multidayEventsId',
        value: value,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'multidayEventsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterFilterCondition>
      multidayEventsIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'multidayEventsId',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DateDetailQueryObject
    on QueryBuilder<DateDetail, DateDetail, QFilterCondition> {}

extension DateDetailQueryLinks
    on QueryBuilder<DateDetail, DateDetail, QFilterCondition> {}

extension DateDetailQuerySortBy
    on QueryBuilder<DateDetail, DateDetail, QSortBy> {
  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension DateDetailQuerySortThenBy
    on QueryBuilder<DateDetail, DateDetail, QSortThenBy> {
  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QAfterSortBy> thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension DateDetailQueryWhereDistinct
    on QueryBuilder<DateDetail, DateDetail, QDistinct> {
  QueryBuilder<DateDetail, DateDetail, QDistinct> distinctByAvailableTracks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableTracks');
    });
  }

  QueryBuilder<DateDetail, DateDetail, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DateDetail, DateDetail, QDistinct> distinctByEventsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventsId');
    });
  }

  QueryBuilder<DateDetail, DateDetail, QDistinct> distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<DateDetail, DateDetail, QDistinct> distinctByMultidayEventsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'multidayEventsId');
    });
  }
}

extension DateDetailQueryProperty
    on QueryBuilder<DateDetail, DateDetail, QQueryProperty> {
  QueryBuilder<DateDetail, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<DateDetail, List<int>, QQueryOperations>
      availableTracksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableTracks');
    });
  }

  QueryBuilder<DateDetail, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DateDetail, List<int>, QQueryOperations> eventsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventsId');
    });
  }

  QueryBuilder<DateDetail, DateTime, QQueryOperations> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<DateDetail, List<int>, QQueryOperations>
      multidayEventsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'multidayEventsId');
    });
  }
}
