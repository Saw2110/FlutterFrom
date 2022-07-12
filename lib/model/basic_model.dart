import 'package:marketing/constant/api_constant.dart';

class BasicModel {
  BasicModel({
    required this.statusCode,
    required this.message,
  });

  late final int statusCode;
  late final String message;

  BasicModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'] ?? errorMap['StatusCode'];
    message = json['Message'] ?? errorMap['Message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['StatusCode'] = statusCode;
    _data['Message'] = message;
    return _data;
  }
}
