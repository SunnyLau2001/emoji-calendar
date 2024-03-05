// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_temp_prop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChecklistTemp {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<ChecklistItemTemp> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChecklistTempCopyWith<ChecklistTemp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistTempCopyWith<$Res> {
  factory $ChecklistTempCopyWith(
          ChecklistTemp value, $Res Function(ChecklistTemp) then) =
      _$ChecklistTempCopyWithImpl<$Res, ChecklistTemp>;
  @useResult
  $Res call({int id, String title, List<ChecklistItemTemp> items});
}

/// @nodoc
class _$ChecklistTempCopyWithImpl<$Res, $Val extends ChecklistTemp>
    implements $ChecklistTempCopyWith<$Res> {
  _$ChecklistTempCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItemTemp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistTempImplCopyWith<$Res>
    implements $ChecklistTempCopyWith<$Res> {
  factory _$$ChecklistTempImplCopyWith(
          _$ChecklistTempImpl value, $Res Function(_$ChecklistTempImpl) then) =
      __$$ChecklistTempImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, List<ChecklistItemTemp> items});
}

/// @nodoc
class __$$ChecklistTempImplCopyWithImpl<$Res>
    extends _$ChecklistTempCopyWithImpl<$Res, _$ChecklistTempImpl>
    implements _$$ChecklistTempImplCopyWith<$Res> {
  __$$ChecklistTempImplCopyWithImpl(
      _$ChecklistTempImpl _value, $Res Function(_$ChecklistTempImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_$ChecklistTempImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItemTemp>,
    ));
  }
}

/// @nodoc

class _$ChecklistTempImpl implements _ChecklistTemp {
  _$ChecklistTempImpl(
      {required this.id,
      required this.title,
      required final List<ChecklistItemTemp> items})
      : _items = items;

  @override
  final int id;
  @override
  final String title;
  final List<ChecklistItemTemp> _items;
  @override
  List<ChecklistItemTemp> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ChecklistTemp(id: $id, title: $title, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistTempImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistTempImplCopyWith<_$ChecklistTempImpl> get copyWith =>
      __$$ChecklistTempImplCopyWithImpl<_$ChecklistTempImpl>(this, _$identity);
}

abstract class _ChecklistTemp implements ChecklistTemp {
  factory _ChecklistTemp(
      {required final int id,
      required final String title,
      required final List<ChecklistItemTemp> items}) = _$ChecklistTempImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  List<ChecklistItemTemp> get items;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistTempImplCopyWith<_$ChecklistTempImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChecklistItemTemp {
  String get detail => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChecklistItemTempCopyWith<ChecklistItemTemp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistItemTempCopyWith<$Res> {
  factory $ChecklistItemTempCopyWith(
          ChecklistItemTemp value, $Res Function(ChecklistItemTemp) then) =
      _$ChecklistItemTempCopyWithImpl<$Res, ChecklistItemTemp>;
  @useResult
  $Res call({String detail, bool checked});
}

/// @nodoc
class _$ChecklistItemTempCopyWithImpl<$Res, $Val extends ChecklistItemTemp>
    implements $ChecklistItemTempCopyWith<$Res> {
  _$ChecklistItemTempCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? checked = null,
  }) {
    return _then(_value.copyWith(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistItemTempImplCopyWith<$Res>
    implements $ChecklistItemTempCopyWith<$Res> {
  factory _$$ChecklistItemTempImplCopyWith(_$ChecklistItemTempImpl value,
          $Res Function(_$ChecklistItemTempImpl) then) =
      __$$ChecklistItemTempImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String detail, bool checked});
}

/// @nodoc
class __$$ChecklistItemTempImplCopyWithImpl<$Res>
    extends _$ChecklistItemTempCopyWithImpl<$Res, _$ChecklistItemTempImpl>
    implements _$$ChecklistItemTempImplCopyWith<$Res> {
  __$$ChecklistItemTempImplCopyWithImpl(_$ChecklistItemTempImpl _value,
      $Res Function(_$ChecklistItemTempImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? checked = null,
  }) {
    return _then(_$ChecklistItemTempImpl(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChecklistItemTempImpl implements _ChecklistItemTemp {
  _$ChecklistItemTempImpl({required this.detail, required this.checked});

  @override
  final String detail;
  @override
  final bool checked;

  @override
  String toString() {
    return 'ChecklistItemTemp(detail: $detail, checked: $checked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistItemTempImpl &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.checked, checked) || other.checked == checked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail, checked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistItemTempImplCopyWith<_$ChecklistItemTempImpl> get copyWith =>
      __$$ChecklistItemTempImplCopyWithImpl<_$ChecklistItemTempImpl>(
          this, _$identity);
}

abstract class _ChecklistItemTemp implements ChecklistItemTemp {
  factory _ChecklistItemTemp(
      {required final String detail,
      required final bool checked}) = _$ChecklistItemTempImpl;

  @override
  String get detail;
  @override
  bool get checked;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistItemTempImplCopyWith<_$ChecklistItemTempImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
