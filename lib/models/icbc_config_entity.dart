import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/icbc_config_entity.g.dart';
import 'dart:convert';
export 'package:gateflow/generated/json/icbc_config_entity.g.dart';

@JsonSerializable()
class IcbcConfigEntity {
	late String corpId;
	late String url;
	late String yccode;
	late String eqp;

	IcbcConfigEntity();

	factory IcbcConfigEntity.fromJson(Map<String, dynamic> json) => $IcbcConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $IcbcConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}