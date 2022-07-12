import 'dart:async';

import 'package:customstuff/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketing/model/login_model.dart';
import 'package:marketing/service/routehelper/route_name.dart';
import 'package:marketing/service/sharepreference/login_share_pref.dart';

class SplashState extends ChangeNotifier {
  late LoginDataModel loginModel;
  late BuildContext context;

  late String splashText;

  SplashState() {
    splashText = "Easy Marketing";
    loginModel = LoginDataModel.fromJson({});
  }

  set getContext(value) {
    context = value;
    startTimer();
  }

  void startTimer() async {
    Timer(const Duration(seconds: 2), () async {
      // await Firebase.initializeApp();
      await getSharePreference().whenComplete(() async {
        navigateUser();
        // Navigator.pushReplacementNamed(context, loginPath);
      });
    });
  }

  // checkSession() async {
  //   LoginModel modelList = await CheckSessionAPI.apiCall(
  //     cooperativeCode: loginModel.CoOperativeCode,
  //     userName: loginModel.UserName,
  //     authCode: loginModel.AuthCode,
  //   );
  //
  //   log("Login Model => ${jsonEncode(modelList)}");
  //
  //   if (modelList.STATUSCODE == "0") {
  //     await SharedPref.setSharedPreferenceData(
  //         key: "LoginDetails", dValue: jsonEncode(modelList), type: "String");
  //   } else {
  //     SharedPref.removeAllSharedPreferenceData(context);
  //     Navigator.pushReplacementNamed(context, loginPath);
  //   }
  //
  //   notifyListeners();
  // }

  void navigateUser() async {
    // await checkSession();
    bool userLogin =
        await SharedPref.getData(key: "isLogin", type: "bool", dValue: false);
    if (userLogin) {
      Navigator.pushReplacementNamed(context, indexPath);
    } else {
      Navigator.pushReplacementNamed(context, loginPath);
    }
    notifyListeners();
  }

  Future getSharePreference() async {
    loginModel = await LoginSharePref.getLoginSharePrefData();
    // firebaseCloudMessagingListeners();
    notifyListeners();
  }
}
