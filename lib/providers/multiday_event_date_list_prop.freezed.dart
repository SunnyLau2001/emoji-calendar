// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiday_event_date_list_prop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultidayEventDateListProp {
  String get dateString => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  DateDetail get dateDetail => throw _privateConstructorUsedError;
  List<EventTemp> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultidayEventDateListPropCopyWith<MultidayEventDateListProp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultidayEventDateListPropCopyWith<$Res> {
  factory $MultidayEventDateListPropCopyWith(MultidayEventDateListProp value,
          $Res Function(MultidayEventDateListProp) then) =
      _$MultidayEventDateListPropCopyWithImpl<$Res, MultidayEventDateListProp>;
  @useResult
  $Res call(
      {String dateString,
      DateTime dateTime,
      DateDetail dateDetail,
      List<EventTemp> events});
}

/// @nodoc
class _$MultidayEventDateListPropCopyWithImpl<$Res,
        $Val extends MultidayEventDateListProp>
    implements $MultidayEventDateListPropCopyWith<$Res> {
  _$MultidayEventDateListPropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateString = null,
    Object? dateTime = null,
    Object? dateDetail = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateDetail: null == dateDetail
          ? _value.dateDetail
          : dateDetail // ignore: cast_nullable_to_non_nullable
              as DateDetail,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventTemp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MultidayEventDateListPropCopyWith<$Res>
    implements $MultidayEventDateListPropCopyWith<$Res> {
  factory _$$_MultidayEventDateListPropCopyWith(
          _$_MultidayEventDateListProp value,
          $Res Function(_$_MultidayEventDateListProp) then) =
      __$$_MultidayEventDateListPropCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateString,
      DateTime dateTime,
      DateDetail dateDetail,
      List<EventTemp> events});
}

/// @nodoc
class __$$_MultidayEventDateListPropCopyWithImpl<$Res>
    extends _$MultidayEventDateListPropCopyWithImpl<$Res,
        _$_MultidayEventDateListProp>
    implements _$$_MultidayEventDateListPropCopyWith<$Res> {
  __$$_MultidayEventDateListPropCopyWithImpl(
      _$_MultidayEventDateListProp _value,
      $Res Function(_$_MultidayEventDateListProp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateString = null,
    Object? dateTime = null,
    Object? dateDetail = null,
    Object? events = null,
  }) {
    return _then(_$_MultidayEventDateListProp(
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateDetail: null == dateDetail
          ? _value.dateDetail
          : dateDetail // ignore: cast_nullable_to_non_nullable
              as DateDetail,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventTemp>,
    ));
  }
}

/// @nodoc

class _$_MultidayEventDateListProp implements _MultidayEventDateListProp {
  _$_MultidayEventDateListProp(
      {required this.dateString,
      required this.dateTime,
      required this.dateDetail,
      required final List<EventTemp> events})
      : _events = events;

  @override
  final String dateString;
  @override
  final DateTime dateTime;
  @override
  final DateDetail dateDetail;
  final List<EventTemp> _events;
  @override
  List<EventTemp> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'MultidayEventDateListProp(dateString: $dateString, dateTime: $dateTime, dateDetail: $dateDetail, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultidayEventDateListProp &&
            (identical(other.dateString, dateString) ||
                other.dateString == dateString) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.dateDetail, dateDetail) ||
                other.dateDetail == dateDetail) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateString, dateTime, dateDetail,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultidayEventDateListPropCopyWith<_$_MultidayEventDateListProp>
      get copyWith => __$$_MultidayEventDateListPropCopyWithImpl<
          _$_MultidayEventDateListProp>(this, _$identity);
}

abstract class _MultidayEventDateListProp implements MultidayEventDateListProp {
  factory _MultidayEventDateListProp(
      {required final String dateString,
      required final DateTime dateTime,
      required final DateDetail dateDetail,
      required final List<EventTemp> events}) = _$_MultidayEventDateListProp;

  @override
  String get dateString;
  @override
  DateTime get dateTime;
  @override
  DateDetail get dateDetail;
  @override
  List<EventTemp> get events;
  @override
  @JsonKey(ignore: true)
  _$$_MultidayEventDateListPropCopyWith<_$_MultidayEventDateListProp>
      get copyWith => throw _privateConstructorUsedError;
}
