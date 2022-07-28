import 'dart:convert';

import 'package:customstuff/utils/log_print.dart';
import 'package:customstuff/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:marketing/model/login_model.dart';
import 'package:marketing/service/networkhelper/validation/login_api.dart';
import 'package:marketing/service/routehelper/route_name.dart';
import 'package:marketing/utils/device_info.dart';
import 'package:marketing/utils/show_toast.dart';

class LoginState extends ChangeNotifier {
  late BuildContext context;

  late bool isLoading, isRemember, isPasswordVisibility;
  late GlobalKey<FormState> cooperativeKey, usernameFormKey, passwordFormKey;
  late TextEditingController cooperativeController,
      userController,
      passController;

  late String mobileToken, imei, randomString;

  late List<String> sliderImageList;

  LoginState() {
    cooperativeKey = GlobalKey<FormState>();
    usernameFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();

    sliderImageList = [];

    clear();
  }

  init() async {
    await clear();
    await getDeviceInfo();
    await getSharePerf();
  }

  clear() async {
    // cooperativeController = TextEditingController(text: "ES25");
    // userController = TextEditingController(text: "ghpravash");
    // passController = TextEditingController(text: "easy@123");

    cooperativeController = TextEditingController(text: "");
    userController = TextEditingController(text: "");
    passController = TextEditingController(text: "");

    isLoading = false;
    isRemember = false;
    isPasswordVisibility = false;

    mobileToken = "";
    imei = "";
    randomString = "";

    sliderImageList.clear();
  }

  set getLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set getPasswordVisibility(bool value) {
    isPasswordVisibility = value;
    notifyListeners();
  }

  set getRemember(bool value) {
    isRemember = value;
    CustomLog.actionLog(value: "Is Remember => $value");
    SharedPref.setData(key: "Remember", dValue: value, type: "bool");
    notifyListeners();
  }

  set getUserName(String value) {
    userController.text = value;
    notifyListeners();
  }

  set getContext(BuildContext value) {
    context = value;
  }

  getSharePerf() async {
    mobileToken = await SharedPref.getData(
      key: "mobile_token",
      type: "String",
      dValue: "error",
    );
    CustomLog.actionLog(value: "Mobile Token  =>  $mobileToken");

    CustomLog.actionLog(value: "Remember Value onInit => $isRemember");
    isRemember =
        await SharedPref.getData(key: "Remember", dValue: false, type: "bool");
    if (isRemember) {
      getUserName =
          await SharedPref.getData(key: "UserName", dValue: "", type: "String");
    }

    notifyListeners();
  }

  onLogin() async {
    if (usernameFormKey.currentState!.validate()) {
      if (passwordFormKey.currentState!.validate()) {
        getLoading = true;
        await getAPICall();
      }
    }
    notifyListeners();
  }

  getDeviceInfo() async {
    await DeviceInfo.getDeviceInfo().then((value) {
      imei = value["imei"];
    });

    CustomLog.actionLog(value: "{imei: $imei}");
    notifyListeners();
  }

  getAPICall() async {
    getLoading = true;
    LoginModel modelData = await LoginAPI.apiCall(
      cooperativeCode: "ES25",
      userName: userController.text.trim(),
      password: passController.text.trim(),
      mobileToken: "sdasdasdasdasdasd",
      deviceId: imei,
    );
    if (modelData.statusCode == 200) {
      getLoading = false;
      await onSuccess(modelData: modelData.logins);
      ShowToast.success(msg: modelData.message);
    } else {
      ShowToast.failure(msg: modelData.message);
      getLoading = false;
    }
    notifyListeners();
  }

  onSuccess({required List<LoginDataModel> modelData}) async {
    await SharedPref.setData(
      key: "LoginDetail",
      dValue: jsonEncode(modelData[0]),
      type: "String",
    );
    await SharedPref.setData(
      key: "CooperativeCode",
      dValue: cooperativeController.text.trim(),
      type: "String",
    );
    await SharedPref.setData(
      key: "UserName",
      dValue: userController.text.trim(),
      type: "String",
    );
    await SharedPref.setData(
      key: "isLogin",
      dValue: true,
      type: "bool",
    );

    Navigator.pushNamed(context, indexPath);
    notifyListeners();
  }
}
