import 'dart:convert';

import 'package:customstuff/utils/log_print.dart';
import 'package:customstuff/utils/share_pref.dart';
import 'package:marketing/model/login_model.dart';

class LoginSharePref {
  static getLoginSharePrefData() async {
    String userData = await SharedPref.getData(
        key: "LoginDetail", dValue: "-", type: "String");
    if (userData != "-") {
      CustomLog.actionLog(value: "UserData => $userData");
      Map<String, dynamic> userAuthData = jsonDecode(userData);
      return LoginDataModel.fromJson(userAuthData);
    } else {
      return LoginDataModel.fromJson({});
    }
  }
}
