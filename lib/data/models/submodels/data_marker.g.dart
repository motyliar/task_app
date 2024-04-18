// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_marker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataMarkerModelAdapter extends TypeAdapter<DataMarkerModel> {
  @override
  final int typeId = 2;

  @override
  DataMarkerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataMarkerModel(
      day: fields[0] as int,
      month: fields[1] as int,
      year: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataMarkerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMarkerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataMarkerModelImpl _$$DataMarkerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataMarkerModelImpl(
      day: json['day'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
    );

Map<String, dynamic> _$$DataMarkerModelImplToJson(
        _$DataMarkerModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };
