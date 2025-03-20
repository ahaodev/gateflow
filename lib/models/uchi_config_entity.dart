import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/uchi_config_entity.g.dart';
import 'dart:convert';
export 'package:gateflow/generated/json/uchi_config_entity.g.dart';

@JsonSerializable()
class UchiConfigEntity {
	@JSONField(name: 'Url')
	late String url;
	@JSONField(name: 'DeviceCode')
	late String deviceCode;

	UchiConfigEntity();

	factory UchiConfigEntity.fromJson(Map<String, dynamic> json) => $UchiConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $UchiConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}