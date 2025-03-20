import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/uchi_config_entity.dart';

UchiConfigEntity $UchiConfigEntityFromJson(Map<String, dynamic> json) {
  final UchiConfigEntity uchiConfigEntity = UchiConfigEntity();
  final String? url = jsonConvert.convert<String>(json['Url']);
  if (url != null) {
    uchiConfigEntity.url = url;
  }
  final String? deviceCode = jsonConvert.convert<String>(json['DeviceCode']);
  if (deviceCode != null) {
    uchiConfigEntity.deviceCode = deviceCode;
  }
  return uchiConfigEntity;
}

Map<String, dynamic> $UchiConfigEntityToJson(UchiConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Url'] = entity.url;
  data['DeviceCode'] = entity.deviceCode;
  return data;
}

extension UchiConfigEntityExtension on UchiConfigEntity {
  UchiConfigEntity copyWith({
    String? url,
    String? deviceCode,
  }) {
    return UchiConfigEntity()
      ..url = url ?? this.url
      ..deviceCode = deviceCode ?? this.deviceCode;
  }
}