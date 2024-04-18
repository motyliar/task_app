// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_stat_m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataStatMAdapter extends TypeAdapter<DataStatM> {
  @override
  final int typeId = 3;

  @override
  DataStatM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataStatM(
      create: fields[0] as DataMarkerModel,
      execution: fields[1] as DataMarkerModel,
      done: fields[2] as DataMarkerModel,
    );
  }

  @override
  void write(BinaryWriter writer, DataStatM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.create)
      ..writeByte(1)
      ..write(obj.execution)
      ..writeByte(2)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataStatMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataStatMImpl _$$DataStatMImplFromJson(Map<String, dynamic> json) =>
    _$DataStatMImpl(
      create: DataMarkerModel.fromJson(json['create'] as Map<String, dynamic>),
      execution:
          DataMarkerModel.fromJson(json['execution'] as Map<String, dynamic>),
      done: DataMarkerModel.fromJson(json['done'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataStatMImplToJson(_$DataStatMImpl instance) =>
    <String, dynamic>{
      'create': instance.create,
      'execution': instance.execution,
      'done': instance.done,
    };
