// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_temp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventTemp {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<int> get startHourMinute => throw _privateConstructorUsedError;
  List<int> get endHourMinute => throw _privateConstructorUsedError;
  Sticker? get sticker => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<double>? get latlng => throw _privateConstructorUsedError;
  String? get weather => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  DateTime? get weatherLastUpdate => throw _privateConstructorUsedError;
  ChecklistTemp get checklistTemp => throw _privateConstructorUsedError;
  int? get multidayEventId => throw _privateConstructorUsedError;
  String get dateId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventTempCopyWith<EventTemp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTempCopyWith<$Res> {
  factory $EventTempCopyWith(EventTemp value, $Res Function(EventTemp) then) =
      _$EventTempCopyWithImpl<$Res, EventTemp>;
  @useResult
  $Res call(
      {int id,
      String title,
      List<int> startHourMinute,
      List<int> endHourMinute,
      Sticker? sticker,
      String? location,
      List<double>? latlng,
      String? weather,
      double? temperature,
      DateTime? weatherLastUpdate,
      ChecklistTemp checklistTemp,
      int? multidayEventId,
      String dateId});

  $ChecklistTempCopyWith<$Res> get checklistTemp;
}

/// @nodoc
class _$EventTempCopyWithImpl<$Res, $Val extends EventTemp>
    implements $EventTempCopyWith<$Res> {
  _$EventTempCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startHourMinute = null,
    Object? endHourMinute = null,
    Object? sticker = freezed,
    Object? location = freezed,
    Object? latlng = freezed,
    Object? weather = freezed,
    Object? temperature = freezed,
    Object? weatherLastUpdate = freezed,
    Object? checklistTemp = null,
    Object? multidayEventId = freezed,
    Object? dateId = null,
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
      startHourMinute: null == startHourMinute
          ? _value.startHourMinute
          : startHourMinute // ignore: cast_nullable_to_non_nullable
              as List<int>,
      endHourMinute: null == endHourMinute
          ? _value.endHourMinute
          : endHourMinute // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sticker: freezed == sticker
          ? _value.sticker
          : sticker // ignore: cast_nullable_to_non_nullable
              as Sticker?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latlng: freezed == latlng
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      weatherLastUpdate: freezed == weatherLastUpdate
          ? _value.weatherLastUpdate
          : weatherLastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checklistTemp: null == checklistTemp
          ? _value.checklistTemp
          : checklistTemp // ignore: cast_nullable_to_non_nullable
              as ChecklistTemp,
      multidayEventId: freezed == multidayEventId
          ? _value.multidayEventId
          : multidayEventId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateId: null == dateId
          ? _value.dateId
          : dateId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChecklistTempCopyWith<$Res> get checklistTemp {
    return $ChecklistTempCopyWith<$Res>(_value.checklistTemp, (value) {
      return _then(_value.copyWith(checklistTemp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventTempCopyWith<$Res> implements $EventTempCopyWith<$Res> {
  factory _$$_EventTempCopyWith(
          _$_EventTemp value, $Res Function(_$_EventTemp) then) =
      __$$_EventTempCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      List<int> startHourMinute,
      List<int> endHourMinute,
      Sticker? sticker,
      String? location,
      List<double>? latlng,
      String? weather,
      double? temperature,
      DateTime? weatherLastUpdate,
      ChecklistTemp checklistTemp,
      int? multidayEventId,
      String dateId});

  @override
  $ChecklistTempCopyWith<$Res> get checklistTemp;
}

/// @nodoc
class __$$_EventTempCopyWithImpl<$Res>
    extends _$EventTempCopyWithImpl<$Res, _$_EventTemp>
    implements _$$_EventTempCopyWith<$Res> {
  __$$_EventTempCopyWithImpl(
      _$_EventTemp _value, $Res Function(_$_EventTemp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startHourMinute = null,
    Object? endHourMinute = null,
    Object? sticker = freezed,
    Object? location = freezed,
    Object? latlng = freezed,
    Object? weather = freezed,
    Object? temperature = freezed,
    Object? weatherLastUpdate = freezed,
    Object? checklistTemp = null,
    Object? multidayEventId = freezed,
    Object? dateId = null,
  }) {
    return _then(_$_EventTemp(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startHourMinute: null == startHourMinute
          ? _value._startHourMinute
          : startHourMinute // ignore: cast_nullable_to_non_nullable
              as List<int>,
      endHourMinute: null == endHourMinute
          ? _value._endHourMinute
          : endHourMinute // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sticker: freezed == sticker
          ? _value.sticker
          : sticker // ignore: cast_nullable_to_non_nullable
              as Sticker?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latlng: freezed == latlng
          ? _value._latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      weatherLastUpdate: freezed == weatherLastUpdate
          ? _value.weatherLastUpdate
          : weatherLastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checklistTemp: null == checklistTemp
          ? _value.checklistTemp
          : checklistTemp // ignore: cast_nullable_to_non_nullable
              as ChecklistTemp,
      multidayEventId: freezed == multidayEventId
          ? _value.multidayEventId
          : multidayEventId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateId: null == dateId
          ? _value.dateId
          : dateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EventTemp implements _EventTemp {
  _$_EventTemp(
      {required this.id,
      required this.title,
      required final List<int> startHourMinute,
      required final List<int> endHourMinute,
      this.sticker,
      this.location,
      final List<double>? latlng,
      this.weather,
      this.temperature,
      this.weatherLastUpdate,
      required this.checklistTemp,
      this.multidayEventId,
      required this.dateId})
      : _startHourMinute = startHourMinute,
        _endHourMinute = endHourMinute,
        _latlng = latlng;

  @override
  final int id;
  @override
  final String title;
  final List<int> _startHourMinute;
  @override
  List<int> get startHourMinute {
    if (_startHourMinute is EqualUnmodifiableListView) return _startHourMinute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_startHourMinute);
  }

  final List<int> _endHourMinute;
  @override
  List<int> get endHourMinute {
    if (_endHourMinute is EqualUnmodifiableListView) return _endHourMinute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_endHourMinute);
  }

  @override
  final Sticker? sticker;
  @override
  final String? location;
  final List<double>? _latlng;
  @override
  List<double>? get latlng {
    final value = _latlng;
    if (value == null) return null;
    if (_latlng is EqualUnmodifiableListView) return _latlng;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? weather;
  @override
  final double? temperature;
  @override
  final DateTime? weatherLastUpdate;
  @override
  final ChecklistTemp checklistTemp;
  @override
  final int? multidayEventId;
  @override
  final String dateId;

  @override
  String toString() {
    return 'EventTemp(id: $id, title: $title, startHourMinute: $startHourMinute, endHourMinute: $endHourMinute, sticker: $sticker, location: $location, latlng: $latlng, weather: $weather, temperature: $temperature, weatherLastUpdate: $weatherLastUpdate, checklistTemp: $checklistTemp, multidayEventId: $multidayEventId, dateId: $dateId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventTemp &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._startHourMinute, _startHourMinute) &&
            const DeepCollectionEquality()
                .equals(other._endHourMinute, _endHourMinute) &&
            (identical(other.sticker, sticker) || other.sticker == sticker) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._latlng, _latlng) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.weatherLastUpdate, weatherLastUpdate) ||
                other.weatherLastUpdate == weatherLastUpdate) &&
            (identical(other.checklistTemp, checklistTemp) ||
                other.checklistTemp == checklistTemp) &&
            (identical(other.multidayEventId, multidayEventId) ||
                other.multidayEventId == multidayEventId) &&
            (identical(other.dateId, dateId) || other.dateId == dateId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_startHourMinute),
      const DeepCollectionEquality().hash(_endHourMinute),
      sticker,
      location,
      const DeepCollectionEquality().hash(_latlng),
      weather,
      temperature,
      weatherLastUpdate,
      checklistTemp,
      multidayEventId,
      dateId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventTempCopyWith<_$_EventTemp> get copyWith =>
      __$$_EventTempCopyWithImpl<_$_EventTemp>(this, _$identity);
}

abstract class _EventTemp implements EventTemp {
  factory _EventTemp(
      {required final int id,
      required final String title,
      required final List<int> startHourMinute,
      required final List<int> endHourMinute,
      final Sticker? sticker,
      final String? location,
      final List<double>? latlng,
      final String? weather,
      final double? temperature,
      final DateTime? weatherLastUpdate,
      required final ChecklistTemp checklistTemp,
      final int? multidayEventId,
      required final String dateId}) = _$_EventTemp;

  @override
  int get id;
  @override
  String get title;
  @override
  List<int> get startHourMinute;
  @override
  List<int> get endHourMinute;
  @override
  Sticker? get sticker;
  @override
  String? get location;
  @override
  List<double>? get latlng;
  @override
  String? get weather;
  @override
  double? get temperature;
  @override
  DateTime? get weatherLastUpdate;
  @override
  ChecklistTemp get checklistTemp;
  @override
  int? get multidayEventId;
  @override
  String get dateId;
  @override
  @JsonKey(ignore: true)
  _$$_EventTempCopyWith<_$_EventTemp> get copyWith =>
      throw _privateConstructorUsedError;
}
