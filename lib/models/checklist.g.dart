// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetChecklistCollection on Isar {
  IsarCollection<Checklist> get checklists => this.collection();
}

const ChecklistSchema = CollectionSchema(
  name: r'Checklist',
  id: 2111955095109499340,
  properties: {
    r'checklist': PropertySchema(
      id: 0,
      name: r'checklist',
      type: IsarType.objectList,
      target: r'ChecklistItem',
    ),
    r'eventId': PropertySchema(
      id: 1,
      name: r'eventId',
      type: IsarType.long,
    )
  },
  estimateSize: _checklistEstimateSize,
  serialize: _checklistSerialize,
  deserialize: _checklistDeserialize,
  deserializeProp: _checklistDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ChecklistItem': ChecklistItemSchema},
  getId: _checklistGetId,
  getLinks: _checklistGetLinks,
  attach: _checklistAttach,
  version: '3.0.5',
);

int _checklistEstimateSize(
  Checklist object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.checklist;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ChecklistItem]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ChecklistItemSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _checklistSerialize(
  Checklist object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ChecklistItem>(
    offsets[0],
    allOffsets,
    ChecklistItemSchema.serialize,
    object.checklist,
  );
  writer.writeLong(offsets[1], object.eventId);
}

Checklist _checklistDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Checklist();
  object.checklist = reader.readObjectList<ChecklistItem>(
    offsets[0],
    ChecklistItemSchema.deserialize,
    allOffsets,
    ChecklistItem(),
  );
  object.eventId = reader.readLong(offsets[1]);
  object.id = id;
  return object;
}

P _checklistDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ChecklistItem>(
        offset,
        ChecklistItemSchema.deserialize,
        allOffsets,
        ChecklistItem(),
      )) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _checklistGetId(Checklist object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _checklistGetLinks(Checklist object) {
  return [];
}

void _checklistAttach(IsarCollection<dynamic> col, Id id, Checklist object) {
  object.id = id;
}

extension ChecklistQueryWhereSort
    on QueryBuilder<Checklist, Checklist, QWhere> {
  QueryBuilder<Checklist, Checklist, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChecklistQueryWhere
    on QueryBuilder<Checklist, Checklist, QWhereClause> {
  QueryBuilder<Checklist, Checklist, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Checklist, Checklist, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterWhereClause> idBetween(
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

extension ChecklistQueryFilter
    on QueryBuilder<Checklist, Checklist, QFilterCondition> {
  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> checklistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'checklist',
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'checklist',
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> checklistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition>
      checklistLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'checklist',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> eventIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventId',
        value: value,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> eventIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventId',
        value: value,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> eventIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventId',
        value: value,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> eventIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> idBetween(
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
}

extension ChecklistQueryObject
    on QueryBuilder<Checklist, Checklist, QFilterCondition> {
  QueryBuilder<Checklist, Checklist, QAfterFilterCondition> checklistElement(
      FilterQuery<ChecklistItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'checklist');
    });
  }
}

extension ChecklistQueryLinks
    on QueryBuilder<Checklist, Checklist, QFilterCondition> {}

extension ChecklistQuerySortBy on QueryBuilder<Checklist, Checklist, QSortBy> {
  QueryBuilder<Checklist, Checklist, QAfterSortBy> sortByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterSortBy> sortByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }
}

extension ChecklistQuerySortThenBy
    on QueryBuilder<Checklist, Checklist, QSortThenBy> {
  QueryBuilder<Checklist, Checklist, QAfterSortBy> thenByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterSortBy> thenByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Checklist, Checklist, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ChecklistQueryWhereDistinct
    on QueryBuilder<Checklist, Checklist, QDistinct> {
  QueryBuilder<Checklist, Checklist, QDistinct> distinctByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventId');
    });
  }
}

extension ChecklistQueryProperty
    on QueryBuilder<Checklist, Checklist, QQueryProperty> {
  QueryBuilder<Checklist, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Checklist, List<ChecklistItem>?, QQueryOperations>
      checklistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checklist');
    });
  }

  QueryBuilder<Checklist, int, QQueryOperations> eventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ChecklistItemSchema = Schema(
  name: r'ChecklistItem',
  id: 6734995178179243527,
  properties: {
    r'checked': PropertySchema(
      id: 0,
      name: r'checked',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 1,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _checklistItemEstimateSize,
  serialize: _checklistItemSerialize,
  deserialize: _checklistItemDeserialize,
  deserializeProp: _checklistItemDeserializeProp,
);

int _checklistItemEstimateSize(
  ChecklistItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _checklistItemSerialize(
  ChecklistItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.checked);
  writer.writeString(offsets[1], object.title);
}

ChecklistItem _checklistItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChecklistItem();
  object.checked = reader.readBool(offsets[0]);
  object.title = reader.readString(offsets[1]);
  return object;
}

P _checklistItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ChecklistItemQueryFilter
    on QueryBuilder<ChecklistItem, ChecklistItem, QFilterCondition> {
  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
      checkedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checked',
        value: value,
      ));
    });
  }

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
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

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChecklistItem, ChecklistItem, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ChecklistItemQueryObject
    on QueryBuilder<ChecklistItem, ChecklistItem, QFilterCondition> {}