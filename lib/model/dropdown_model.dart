import 'package:marketing/constant/api_constant.dart';

class DropDownModel {
  DropDownModel({
    required this.dropdownList,
    required this.statusCode,
    required this.message,
  });

  late final List<DropDownDataModel> dropdownList;
  late final int statusCode;
  late final String message;

  DropDownModel.fromJson(Map<String, dynamic> json) {
    dropdownList = List.from(json['dropdowns'] ?? [])
        .map((e) => DropDownDataModel.fromJson(e))
        .toList();
    statusCode = json['StatusCode'] ?? errorMap['StatusCode'];
    message = json['Message'] ?? errorMap['Message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dropdowns'] = dropdownList.map((e) => e.toJson()).toList();
    _data['StatusCode'] = statusCode;
    _data['Message'] = message;
    return _data;
  }
}

class DropDownDataModel {
  DropDownDataModel({
    required this.id,
    required this.name,
    required this.type,
  });

  late final String id;
  late final String name;
  late final String type;

  DropDownDataModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] == null ? "-" : int.parse(json['ID'].toString()).toString();
    name = json['Name'] ?? "-";
    type = json['Type'] ?? "-";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = id;
    _data['Name'] = name;
    _data['Type'] = type;
    return _data;
  }
}
