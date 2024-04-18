// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  @JsonKey(name: "temperature_2")
  String get temperature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call({@JsonKey(name: "temperature_2") String temperature});
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "temperature_2") String temperature});
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
  }) {
    return _then(_$WeatherModelImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherModelImpl extends _WeatherModel {
  const _$WeatherModelImpl(
      {@JsonKey(name: "temperature_2") required this.temperature})
      : super._();

  factory _$WeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherModelImplFromJson(json);

  @override
  @JsonKey(name: "temperature_2")
  final String temperature;

  @override
  String toString() {
    return 'WeatherModel(temperature: $temperature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherModel extends WeatherModel {
  const factory _WeatherModel(
          {@JsonKey(name: "temperature_2") required final String temperature}) =
      _$WeatherModelImpl;
  const _WeatherModel._() : super._();

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$WeatherModelImpl.fromJson;

  @override
  @JsonKey(name: "temperature_2")
  String get temperature;
  @override
  @JsonKey(ignore: true)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
