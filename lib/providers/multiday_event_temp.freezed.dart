// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiday_event_temp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultidayEventTemp {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String get bookmarkStickerId => throw _privateConstructorUsedError;
  int get bookmarkColorInt => throw _privateConstructorUsedError;
  List<int> get eventIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultidayEventTempCopyWith<MultidayEventTemp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultidayEventTempCopyWith<$Res> {
  factory $MultidayEventTempCopyWith(
          MultidayEventTemp value, $Res Function(MultidayEventTemp) then) =
      _$MultidayEventTempCopyWithImpl<$Res, MultidayEventTemp>;
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime? startDate,
      DateTime? endDate,
      String bookmarkStickerId,
      int bookmarkColorInt,
      List<int> eventIds});
}

/// @nodoc
class _$MultidayEventTempCopyWithImpl<$Res, $Val extends MultidayEventTemp>
    implements $MultidayEventTempCopyWith<$Res> {
  _$MultidayEventTempCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? bookmarkStickerId = null,
    Object? bookmarkColorInt = null,
    Object? eventIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookmarkStickerId: null == bookmarkStickerId
          ? _value.bookmarkStickerId
          : bookmarkStickerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkColorInt: null == bookmarkColorInt
          ? _value.bookmarkColorInt
          : bookmarkColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      eventIds: null == eventIds
          ? _value.eventIds
          : eventIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MultidayEventTempCopyWith<$Res>
    implements $MultidayEventTempCopyWith<$Res> {
  factory _$$_MultidayEventTempCopyWith(_$_MultidayEventTemp value,
          $Res Function(_$_MultidayEventTemp) then) =
      __$$_MultidayEventTempCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime? startDate,
      DateTime? endDate,
      String bookmarkStickerId,
      int bookmarkColorInt,
      List<int> eventIds});
}

/// @nodoc
class __$$_MultidayEventTempCopyWithImpl<$Res>
    extends _$MultidayEventTempCopyWithImpl<$Res, _$_MultidayEventTemp>
    implements _$$_MultidayEventTempCopyWith<$Res> {
  __$$_MultidayEventTempCopyWithImpl(
      _$_MultidayEventTemp _value, $Res Function(_$_MultidayEventTemp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? bookmarkStickerId = null,
    Object? bookmarkColorInt = null,
    Object? eventIds = null,
  }) {
    return _then(_$_MultidayEventTemp(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookmarkStickerId: null == bookmarkStickerId
          ? _value.bookmarkStickerId
          : bookmarkStickerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkColorInt: null == bookmarkColorInt
          ? _value.bookmarkColorInt
          : bookmarkColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      eventIds: null == eventIds
          ? _value._eventIds
          : eventIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_MultidayEventTemp implements _MultidayEventTemp {
  _$_MultidayEventTemp(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.bookmarkStickerId,
      required this.bookmarkColorInt,
      required final List<int> eventIds})
      : _eventIds = eventIds;

  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String bookmarkStickerId;
  @override
  final int bookmarkColorInt;
  final List<int> _eventIds;
  @override
  List<int> get eventIds {
    if (_eventIds is EqualUnmodifiableListView) return _eventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventIds);
  }

  @override
  String toString() {
    return 'MultidayEventTemp(id: $id, title: $title, startDate: $startDate, endDate: $endDate, bookmarkStickerId: $bookmarkStickerId, bookmarkColorInt: $bookmarkColorInt, eventIds: $eventIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultidayEventTemp &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.bookmarkStickerId, bookmarkStickerId) ||
                other.bookmarkStickerId == bookmarkStickerId) &&
            (identical(other.bookmarkColorInt, bookmarkColorInt) ||
                other.bookmarkColorInt == bookmarkColorInt) &&
            const DeepCollectionEquality().equals(other._eventIds, _eventIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      startDate,
      endDate,
      bookmarkStickerId,
      bookmarkColorInt,
      const DeepCollectionEquality().hash(_eventIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultidayEventTempCopyWith<_$_MultidayEventTemp> get copyWith =>
      __$$_MultidayEventTempCopyWithImpl<_$_MultidayEventTemp>(
          this, _$identity);
}

abstract class _MultidayEventTemp implements MultidayEventTemp {
  factory _MultidayEventTemp(
      {required final int id,
      required final String title,
      required final DateTime? startDate,
      required final DateTime? endDate,
      required final String bookmarkStickerId,
      required final int bookmarkColorInt,
      required final List<int> eventIds}) = _$_MultidayEventTemp;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String get bookmarkStickerId;
  @override
  int get bookmarkColorInt;
  @override
  List<int> get eventIds;
  @override
  @JsonKey(ignore: true)
  _$$_MultidayEventTempCopyWith<_$_MultidayEventTemp> get copyWith =>
      throw _privateConstructorUsedError;
}
