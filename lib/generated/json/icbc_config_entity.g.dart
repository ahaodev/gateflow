import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/icbc_config_entity.dart';

IcbcConfigEntity $IcbcConfigEntityFromJson(Map<String, dynamic> json) {
  final IcbcConfigEntity icbcConfigEntity = IcbcConfigEntity();
  final String? corpId = jsonConvert.convert<String>(json['corpId']);
  if (corpId != null) {
    icbcConfigEntity.corpId = corpId;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    icbcConfigEntity.url = url;
  }
  final String? yccode = jsonConvert.convert<String>(json['yccode']);
  if (yccode != null) {
    icbcConfigEntity.yccode = yccode;
  }
  final String? eqp = jsonConvert.convert<String>(json['eqp']);
  if (eqp != null) {
    icbcConfigEntity.eqp = eqp;
  }
  return icbcConfigEntity;
}

Map<String, dynamic> $IcbcConfigEntityToJson(IcbcConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['corpId'] = entity.corpId;
  data['url'] = entity.url;
  data['yccode'] = entity.yccode;
  data['eqp'] = entity.eqp;
  return data;
}

extension IcbcConfigEntityExtension on IcbcConfigEntity {
  IcbcConfigEntity copyWith({
    String? corpId,
    String? url,
    String? yccode,
    String? eqp,
  }) {
    return IcbcConfigEntity()
      ..corpId = corpId ?? this.corpId
      ..url = url ?? this.url
      ..yccode = yccode ?? this.yccode
      ..eqp = eqp ?? this.eqp;
  }
}