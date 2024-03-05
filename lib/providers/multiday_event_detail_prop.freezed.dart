// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiday_event_detail_prop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MultidayEventDetailProp {
  MultidayEventTemp get multidayEventTemp => throw _privateConstructorUsedError;
  bool get selectFirstDate => throw _privateConstructorUsedError;
  List<int> get removedEventIds => throw _privateConstructorUsedError;
  List<int> get removedChecklistIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultidayEventDetailPropCopyWith<MultidayEventDetailProp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultidayEventDetailPropCopyWith<$Res> {
  factory $MultidayEventDetailPropCopyWith(MultidayEventDetailProp value,
          $Res Function(MultidayEventDetailProp) then) =
      _$MultidayEventDetailPropCopyWithImpl<$Res, MultidayEventDetailProp>;
  @useResult
  $Res call(
      {MultidayEventTemp multidayEventTemp,
      bool selectFirstDate,
      List<int> removedEventIds,
      List<int> removedChecklistIds});

  $MultidayEventTempCopyWith<$Res> get multidayEventTemp;
}

/// @nodoc
class _$MultidayEventDetailPropCopyWithImpl<$Res,
        $Val extends MultidayEventDetailProp>
    implements $MultidayEventDetailPropCopyWith<$Res> {
  _$MultidayEventDetailPropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? multidayEventTemp = null,
    Object? selectFirstDate = null,
    Object? removedEventIds = null,
    Object? removedChecklistIds = null,
  }) {
    return _then(_value.copyWith(
      multidayEventTemp: null == multidayEventTemp
          ? _value.multidayEventTemp
          : multidayEventTemp // ignore: cast_nullable_to_non_nullable
              as MultidayEventTemp,
      selectFirstDate: null == selectFirstDate
          ? _value.selectFirstDate
          : selectFirstDate // ignore: cast_nullable_to_non_nullable
              as bool,
      removedEventIds: null == removedEventIds
          ? _value.removedEventIds
          : removedEventIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      removedChecklistIds: null == removedChecklistIds
          ? _value.removedChecklistIds
          : removedChecklistIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MultidayEventTempCopyWith<$Res> get multidayEventTemp {
    return $MultidayEventTempCopyWith<$Res>(_value.multidayEventTemp, (value) {
      return _then(_value.copyWith(multidayEventTemp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MultidayEventDetailPropImplCopyWith<$Res>
    implements $MultidayEventDetailPropCopyWith<$Res> {
  factory _$$MultidayEventDetailPropImplCopyWith(
          _$MultidayEventDetailPropImpl value,
          $Res Function(_$MultidayEventDetailPropImpl) then) =
      __$$MultidayEventDetailPropImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MultidayEventTemp multidayEventTemp,
      bool selectFirstDate,
      List<int> removedEventIds,
      List<int> removedChecklistIds});

  @override
  $MultidayEventTempCopyWith<$Res> get multidayEventTemp;
}

/// @nodoc
class __$$MultidayEventDetailPropImplCopyWithImpl<$Res>
    extends _$MultidayEventDetailPropCopyWithImpl<$Res,
        _$MultidayEventDetailPropImpl>
    implements _$$MultidayEventDetailPropImplCopyWith<$Res> {
  __$$MultidayEventDetailPropImplCopyWithImpl(
      _$MultidayEventDetailPropImpl _value,
      $Res Function(_$MultidayEventDetailPropImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? multidayEventTemp = null,
    Object? selectFirstDate = null,
    Object? removedEventIds = null,
    Object? removedChecklistIds = null,
  }) {
    return _then(_$MultidayEventDetailPropImpl(
      multidayEventTemp: null == multidayEventTemp
          ? _value.multidayEventTemp
          : multidayEventTemp // ignore: cast_nullable_to_non_nullable
              as MultidayEventTemp,
      selectFirstDate: null == selectFirstDate
          ? _value.selectFirstDate
          : selectFirstDate // ignore: cast_nullable_to_non_nullable
              as bool,
      removedEventIds: null == removedEventIds
          ? _value._removedEventIds
          : removedEventIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      removedChecklistIds: null == removedChecklistIds
          ? _value._removedChecklistIds
          : removedChecklistIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$MultidayEventDetailPropImpl implements _MultidayEventDetailProp {
  _$MultidayEventDetailPropImpl(
      {required this.multidayEventTemp,
      required this.selectFirstDate,
      required final List<int> removedEventIds,
      required final List<int> removedChecklistIds})
      : _removedEventIds = removedEventIds,
        _removedChecklistIds = removedChecklistIds;

  @override
  final MultidayEventTemp multidayEventTemp;
  @override
  final bool selectFirstDate;
  final List<int> _removedEventIds;
  @override
  List<int> get removedEventIds {
    if (_removedEventIds is EqualUnmodifiableListView) return _removedEventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedEventIds);
  }

  final List<int> _removedChecklistIds;
  @override
  List<int> get removedChecklistIds {
    if (_removedChecklistIds is EqualUnmodifiableListView)
      return _removedChecklistIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedChecklistIds);
  }

  @override
  String toString() {
    return 'MultidayEventDetailProp(multidayEventTemp: $multidayEventTemp, selectFirstDate: $selectFirstDate, removedEventIds: $removedEventIds, removedChecklistIds: $removedChecklistIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultidayEventDetailPropImpl &&
            (identical(other.multidayEventTemp, multidayEventTemp) ||
                other.multidayEventTemp == multidayEventTemp) &&
            (identical(other.selectFirstDate, selectFirstDate) ||
                other.selectFirstDate == selectFirstDate) &&
            const DeepCollectionEquality()
                .equals(other._removedEventIds, _removedEventIds) &&
            const DeepCollectionEquality()
                .equals(other._removedChecklistIds, _removedChecklistIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      multidayEventTemp,
      selectFirstDate,
      const DeepCollectionEquality().hash(_removedEventIds),
      const DeepCollectionEquality().hash(_removedChecklistIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultidayEventDetailPropImplCopyWith<_$MultidayEventDetailPropImpl>
      get copyWith => __$$MultidayEventDetailPropImplCopyWithImpl<
          _$MultidayEventDetailPropImpl>(this, _$identity);
}

abstract class _MultidayEventDetailProp implements MultidayEventDetailProp {
  factory _MultidayEventDetailProp(
          {required final MultidayEventTemp multidayEventTemp,
          required final bool selectFirstDate,
          required final List<int> removedEventIds,
          required final List<int> removedChecklistIds}) =
      _$MultidayEventDetailPropImpl;

  @override
  MultidayEventTemp get multidayEventTemp;
  @override
  bool get selectFirstDate;
  @override
  List<int> get removedEventIds;
  @override
  List<int> get removedChecklistIds;
  @override
  @JsonKey(ignore: true)
  _$$MultidayEventDetailPropImplCopyWith<_$MultidayEventDetailPropImpl>
      get copyWith => throw _privateConstructorUsedError;
}
