import 'package:customstuff/utils/log_print.dart';
import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static navigationHelper(
      {required BuildContext context, required String value}) async {
    CustomLog.actionLog(value: "Navigation Value => $value");

    switch (value) {
      case "-":
        Navigator.pushNamed(context, "-");
        break;

      default:
        Navigator.pushNamed(context, "error");
        break;
    }
  }
}
