// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiday_event_structured.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultidayEventStructured {
  MultidayEvent? get multidayEvents => throw _privateConstructorUsedError;
  List<Event?> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultidayEventStructuredCopyWith<MultidayEventStructured> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultidayEventStructuredCopyWith<$Res> {
  factory $MultidayEventStructuredCopyWith(MultidayEventStructured value,
          $Res Function(MultidayEventStructured) then) =
      _$MultidayEventStructuredCopyWithImpl<$Res, MultidayEventStructured>;
  @useResult
  $Res call({MultidayEvent? multidayEvents, List<Event?> events});
}

/// @nodoc
class _$MultidayEventStructuredCopyWithImpl<$Res,
        $Val extends MultidayEventStructured>
    implements $MultidayEventStructuredCopyWith<$Res> {
  _$MultidayEventStructuredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? multidayEvents = freezed,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      multidayEvents: freezed == multidayEvents
          ? _value.multidayEvents
          : multidayEvents // ignore: cast_nullable_to_non_nullable
              as MultidayEvent?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MultidayEventStructuredCopyWith<$Res>
    implements $MultidayEventStructuredCopyWith<$Res> {
  factory _$$_MultidayEventStructuredCopyWith(_$_MultidayEventStructured value,
          $Res Function(_$_MultidayEventStructured) then) =
      __$$_MultidayEventStructuredCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MultidayEvent? multidayEvents, List<Event?> events});
}

/// @nodoc
class __$$_MultidayEventStructuredCopyWithImpl<$Res>
    extends _$MultidayEventStructuredCopyWithImpl<$Res,
        _$_MultidayEventStructured>
    implements _$$_MultidayEventStructuredCopyWith<$Res> {
  __$$_MultidayEventStructuredCopyWithImpl(_$_MultidayEventStructured _value,
      $Res Function(_$_MultidayEventStructured) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? multidayEvents = freezed,
    Object? events = null,
  }) {
    return _then(_$_MultidayEventStructured(
      multidayEvents: freezed == multidayEvents
          ? _value.multidayEvents
          : multidayEvents // ignore: cast_nullable_to_non_nullable
              as MultidayEvent?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event?>,
    ));
  }
}

/// @nodoc

class _$_MultidayEventStructured implements _MultidayEventStructured {
  _$_MultidayEventStructured(
      {required this.multidayEvents, required final List<Event?> events})
      : _events = events;

  @override
  final MultidayEvent? multidayEvents;
  final List<Event?> _events;
  @override
  List<Event?> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'MultidayEventStructured(multidayEvents: $multidayEvents, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultidayEventStructured &&
            (identical(other.multidayEvents, multidayEvents) ||
                other.multidayEvents == multidayEvents) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, multidayEvents,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultidayEventStructuredCopyWith<_$_MultidayEventStructured>
      get copyWith =>
          __$$_MultidayEventStructuredCopyWithImpl<_$_MultidayEventStructured>(
              this, _$identity);
}

abstract class _MultidayEventStructured implements MultidayEventStructured {
  factory _MultidayEventStructured(
      {required final MultidayEvent? multidayEvents,
      required final List<Event?> events}) = _$_MultidayEventStructured;

  @override
  MultidayEvent? get multidayEvents;
  @override
  List<Event?> get events;
  @override
  @JsonKey(ignore: true)
  _$$_MultidayEventStructuredCopyWith<_$_MultidayEventStructured>
      get copyWith => throw _privateConstructorUsedError;
}