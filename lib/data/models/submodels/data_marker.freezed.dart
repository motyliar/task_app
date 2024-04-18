// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataMarkerModel _$DataMarkerModelFromJson(Map<String, dynamic> json) {
  return _DataMarkerModel.fromJson(json);
}

/// @nodoc
mixin _$DataMarkerModel {
  @HiveField(0)
  int get day => throw _privateConstructorUsedError;
  @HiveField(1)
  int get month => throw _privateConstructorUsedError;
  @HiveField(2)
  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataMarkerModelCopyWith<DataMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataMarkerModelCopyWith<$Res> {
  factory $DataMarkerModelCopyWith(
          DataMarkerModel value, $Res Function(DataMarkerModel) then) =
      _$DataMarkerModelCopyWithImpl<$Res, DataMarkerModel>;
  @useResult
  $Res call(
      {@HiveField(0) int day, @HiveField(1) int month, @HiveField(2) int year});
}

/// @nodoc
class _$DataMarkerModelCopyWithImpl<$Res, $Val extends DataMarkerModel>
    implements $DataMarkerModelCopyWith<$Res> {
  _$DataMarkerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataMarkerModelImplCopyWith<$Res>
    implements $DataMarkerModelCopyWith<$Res> {
  factory _$$DataMarkerModelImplCopyWith(_$DataMarkerModelImpl value,
          $Res Function(_$DataMarkerModelImpl) then) =
      __$$DataMarkerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int day, @HiveField(1) int month, @HiveField(2) int year});
}

/// @nodoc
class __$$DataMarkerModelImplCopyWithImpl<$Res>
    extends _$DataMarkerModelCopyWithImpl<$Res, _$DataMarkerModelImpl>
    implements _$$DataMarkerModelImplCopyWith<$Res> {
  __$$DataMarkerModelImplCopyWithImpl(
      _$DataMarkerModelImpl _value, $Res Function(_$DataMarkerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$DataMarkerModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataMarkerModelImpl extends _DataMarkerModel {
  const _$DataMarkerModelImpl(
      {@HiveField(0) required this.day,
      @HiveField(1) required this.month,
      @HiveField(2) required this.year})
      : super._();

  factory _$DataMarkerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataMarkerModelImplFromJson(json);

  @override
  @HiveField(0)
  final int day;
  @override
  @HiveField(1)
  final int month;
  @override
  @HiveField(2)
  final int year;

  @override
  String toString() {
    return 'DataMarkerModel(day: $day, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataMarkerModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, month, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataMarkerModelImplCopyWith<_$DataMarkerModelImpl> get copyWith =>
      __$$DataMarkerModelImplCopyWithImpl<_$DataMarkerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataMarkerModelImplToJson(
      this,
    );
  }
}

abstract class _DataMarkerModel extends DataMarkerModel {
  const factory _DataMarkerModel(
      {@HiveField(0) required final int day,
      @HiveField(1) required final int month,
      @HiveField(2) required final int year}) = _$DataMarkerModelImpl;
  const _DataMarkerModel._() : super._();

  factory _DataMarkerModel.fromJson(Map<String, dynamic> json) =
      _$DataMarkerModelImpl.fromJson;

  @override
  @HiveField(0)
  int get day;
  @override
  @HiveField(1)
  int get month;
  @override
  @HiveField(2)
  int get year;
  @override
  @JsonKey(ignore: true)
  _$$DataMarkerModelImplCopyWith<_$DataMarkerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
