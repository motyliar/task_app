// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_stat_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataStatM _$DataStatMFromJson(Map<String, dynamic> json) {
  return _DataStatM.fromJson(json);
}

/// @nodoc
mixin _$DataStatM {
  @HiveField(0)
  DataMarkerModel get create => throw _privateConstructorUsedError;
  @HiveField(1)
  DataMarkerModel get execution => throw _privateConstructorUsedError;
  @HiveField(2)
  DataMarkerModel get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataStatMCopyWith<DataStatM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStatMCopyWith<$Res> {
  factory $DataStatMCopyWith(DataStatM value, $Res Function(DataStatM) then) =
      _$DataStatMCopyWithImpl<$Res, DataStatM>;
  @useResult
  $Res call(
      {@HiveField(0) DataMarkerModel create,
      @HiveField(1) DataMarkerModel execution,
      @HiveField(2) DataMarkerModel done});

  $DataMarkerModelCopyWith<$Res> get create;
  $DataMarkerModelCopyWith<$Res> get execution;
  $DataMarkerModelCopyWith<$Res> get done;
}

/// @nodoc
class _$DataStatMCopyWithImpl<$Res, $Val extends DataStatM>
    implements $DataStatMCopyWith<$Res> {
  _$DataStatMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? create = null,
    Object? execution = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      create: null == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataMarkerModelCopyWith<$Res> get create {
    return $DataMarkerModelCopyWith<$Res>(_value.create, (value) {
      return _then(_value.copyWith(create: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataMarkerModelCopyWith<$Res> get execution {
    return $DataMarkerModelCopyWith<$Res>(_value.execution, (value) {
      return _then(_value.copyWith(execution: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataMarkerModelCopyWith<$Res> get done {
    return $DataMarkerModelCopyWith<$Res>(_value.done, (value) {
      return _then(_value.copyWith(done: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataStatMImplCopyWith<$Res>
    implements $DataStatMCopyWith<$Res> {
  factory _$$DataStatMImplCopyWith(
          _$DataStatMImpl value, $Res Function(_$DataStatMImpl) then) =
      __$$DataStatMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DataMarkerModel create,
      @HiveField(1) DataMarkerModel execution,
      @HiveField(2) DataMarkerModel done});

  @override
  $DataMarkerModelCopyWith<$Res> get create;
  @override
  $DataMarkerModelCopyWith<$Res> get execution;
  @override
  $DataMarkerModelCopyWith<$Res> get done;
}

/// @nodoc
class __$$DataStatMImplCopyWithImpl<$Res>
    extends _$DataStatMCopyWithImpl<$Res, _$DataStatMImpl>
    implements _$$DataStatMImplCopyWith<$Res> {
  __$$DataStatMImplCopyWithImpl(
      _$DataStatMImpl _value, $Res Function(_$DataStatMImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? create = null,
    Object? execution = null,
    Object? done = null,
  }) {
    return _then(_$DataStatMImpl(
      create: null == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as DataMarkerModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataStatMImpl extends _DataStatM {
  const _$DataStatMImpl(
      {@HiveField(0) required this.create,
      @HiveField(1) required this.execution,
      @HiveField(2) required this.done})
      : super._();

  factory _$DataStatMImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataStatMImplFromJson(json);

  @override
  @HiveField(0)
  final DataMarkerModel create;
  @override
  @HiveField(1)
  final DataMarkerModel execution;
  @override
  @HiveField(2)
  final DataMarkerModel done;

  @override
  String toString() {
    return 'DataStatM(create: $create, execution: $execution, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStatMImpl &&
            (identical(other.create, create) || other.create == create) &&
            (identical(other.execution, execution) ||
                other.execution == execution) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, create, execution, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataStatMImplCopyWith<_$DataStatMImpl> get copyWith =>
      __$$DataStatMImplCopyWithImpl<_$DataStatMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataStatMImplToJson(
      this,
    );
  }
}

abstract class _DataStatM extends DataStatM {
  const factory _DataStatM(
      {@HiveField(0) required final DataMarkerModel create,
      @HiveField(1) required final DataMarkerModel execution,
      @HiveField(2) required final DataMarkerModel done}) = _$DataStatMImpl;
  const _DataStatM._() : super._();

  factory _DataStatM.fromJson(Map<String, dynamic> json) =
      _$DataStatMImpl.fromJson;

  @override
  @HiveField(0)
  DataMarkerModel get create;
  @override
  @HiveField(1)
  DataMarkerModel get execution;
  @override
  @HiveField(2)
  DataMarkerModel get done;
  @override
  @JsonKey(ignore: true)
  _$$DataStatMImplCopyWith<_$DataStatMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
