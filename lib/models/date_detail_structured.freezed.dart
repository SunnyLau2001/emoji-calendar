// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_detail_structured.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateDetailStructured {
  DateDetail? get dateDetail => throw _privateConstructorUsedError;
  List<Event?> get events => throw _privateConstructorUsedError;
  List<MultidayEvent?> get multidayEvents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateDetailStructuredCopyWith<DateDetailStructured> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateDetailStructuredCopyWith<$Res> {
  factory $DateDetailStructuredCopyWith(DateDetailStructured value,
          $Res Function(DateDetailStructured) then) =
      _$DateDetailStructuredCopyWithImpl<$Res, DateDetailStructured>;
  @useResult
  $Res call(
      {DateDetail? dateDetail,
      List<Event?> events,
      List<MultidayEvent?> multidayEvents});
}

/// @nodoc
class _$DateDetailStructuredCopyWithImpl<$Res,
        $Val extends DateDetailStructured>
    implements $DateDetailStructuredCopyWith<$Res> {
  _$DateDetailStructuredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDetail = freezed,
    Object? events = null,
    Object? multidayEvents = null,
  }) {
    return _then(_value.copyWith(
      dateDetail: freezed == dateDetail
          ? _value.dateDetail
          : dateDetail // ignore: cast_nullable_to_non_nullable
              as DateDetail?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event?>,
      multidayEvents: null == multidayEvents
          ? _value.multidayEvents
          : multidayEvents // ignore: cast_nullable_to_non_nullable
              as List<MultidayEvent?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateDetailStructuredImplCopyWith<$Res>
    implements $DateDetailStructuredCopyWith<$Res> {
  factory _$$DateDetailStructuredImplCopyWith(_$DateDetailStructuredImpl value,
          $Res Function(_$DateDetailStructuredImpl) then) =
      __$$DateDetailStructuredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateDetail? dateDetail,
      List<Event?> events,
      List<MultidayEvent?> multidayEvents});
}

/// @nodoc
class __$$DateDetailStructuredImplCopyWithImpl<$Res>
    extends _$DateDetailStructuredCopyWithImpl<$Res, _$DateDetailStructuredImpl>
    implements _$$DateDetailStructuredImplCopyWith<$Res> {
  __$$DateDetailStructuredImplCopyWithImpl(_$DateDetailStructuredImpl _value,
      $Res Function(_$DateDetailStructuredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDetail = freezed,
    Object? events = null,
    Object? multidayEvents = null,
  }) {
    return _then(_$DateDetailStructuredImpl(
      dateDetail: freezed == dateDetail
          ? _value.dateDetail
          : dateDetail // ignore: cast_nullable_to_non_nullable
              as DateDetail?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event?>,
      multidayEvents: null == multidayEvents
          ? _value._multidayEvents
          : multidayEvents // ignore: cast_nullable_to_non_nullable
              as List<MultidayEvent?>,
    ));
  }
}

/// @nodoc

class _$DateDetailStructuredImpl implements _DateDetailStructured {
  _$DateDetailStructuredImpl(
      {required this.dateDetail,
      required final List<Event?> events,
      required final List<MultidayEvent?> multidayEvents})
      : _events = events,
        _multidayEvents = multidayEvents;

  @override
  final DateDetail? dateDetail;
  final List<Event?> _events;
  @override
  List<Event?> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<MultidayEvent?> _multidayEvents;
  @override
  List<MultidayEvent?> get multidayEvents {
    if (_multidayEvents is EqualUnmodifiableListView) return _multidayEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multidayEvents);
  }

  @override
  String toString() {
    return 'DateDetailStructured(dateDetail: $dateDetail, events: $events, multidayEvents: $multidayEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateDetailStructuredImpl &&
            (identical(other.dateDetail, dateDetail) ||
                other.dateDetail == dateDetail) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._multidayEvents, _multidayEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateDetail,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_multidayEvents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateDetailStructuredImplCopyWith<_$DateDetailStructuredImpl>
      get copyWith =>
          __$$DateDetailStructuredImplCopyWithImpl<_$DateDetailStructuredImpl>(
              this, _$identity);
}

abstract class _DateDetailStructured implements DateDetailStructured {
  factory _DateDetailStructured(
          {required final DateDetail? dateDetail,
          required final List<Event?> events,
          required final List<MultidayEvent?> multidayEvents}) =
      _$DateDetailStructuredImpl;

  @override
  DateDetail? get dateDetail;
  @override
  List<Event?> get events;
  @override
  List<MultidayEvent?> get multidayEvents;
  @override
  @JsonKey(ignore: true)
  _$$DateDetailStructuredImplCopyWith<_$DateDetailStructuredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
