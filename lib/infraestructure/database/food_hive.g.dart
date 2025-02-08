// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodHiveAdapter extends TypeAdapter<FoodHive> {
  @override
  final int typeId = 1;

  @override
  FoodHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodHive(
      name: fields[0] as String,
      imageURL: fields[1] as String,
      portion: fields[2] as double,
      kcal: fields[3] as double,
      kJ: fields[4] as double,
      fat: fields[5] as double,
      saturatedFat: fields[6] as double,
      carbohydrates: fields[7] as double,
      sugar: fields[8] as double,
      fiber: fields[9] as double,
      proteins: fields[10] as double,
      productBy: fields[11] as String,
      type: fields[12] as String,
      promoted: fields[13] as bool,
      quantity: fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FoodHive obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageURL)
      ..writeByte(2)
      ..write(obj.portion)
      ..writeByte(3)
      ..write(obj.kcal)
      ..writeByte(4)
      ..write(obj.kJ)
      ..writeByte(5)
      ..write(obj.fat)
      ..writeByte(6)
      ..write(obj.saturatedFat)
      ..writeByte(7)
      ..write(obj.carbohydrates)
      ..writeByte(8)
      ..write(obj.sugar)
      ..writeByte(9)
      ..write(obj.fiber)
      ..writeByte(10)
      ..write(obj.proteins)
      ..writeByte(11)
      ..write(obj.productBy)
      ..writeByte(12)
      ..write(obj.type)
      ..writeByte(13)
      ..write(obj.promoted)
      ..writeByte(14)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
