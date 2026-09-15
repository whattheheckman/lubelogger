import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    int? remoteId,
    required String year,
    required String make,
    required String model,
    @Default('') String licensePlate,
    String? imagePath,
    @Default(false) bool isElectric,
    @Default(false) bool isDiesel,
    @Default(false) bool useHours,
    @Default([]) List<String> tags,
    @Default({}) Map<String, dynamic> extraFields,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
