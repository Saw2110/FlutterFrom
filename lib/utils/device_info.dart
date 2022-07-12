import 'dart:io';

import 'package:customstuff/utils/log_print.dart';
import 'package:customstuff/utils/share_pref.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  static Future getDeviceInfo() async {
    Map<String, dynamic> returnData = {
      "imei": "-",
      "macId": "-",
      "deviceName": "-",
    };
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        var deviceName = build.model;
        var identifier =
            "${build.model}/${build.fingerprint}"; //UUID for Android
        var imei = build.fingerprint;
        returnData = {
          "imei": imei,
          "macId": identifier,
          "deviceName": deviceName,
        };
        SharedPref.setData(
            key: 'DeviceInfo', dValue: '$returnData', type: 'String');
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        var deviceName = data.name;
        var identifier = data.identifierForVendor; //UUID for iOS

        returnData = {
          "imei": identifier,
          "macId": identifier,
          "deviceName": deviceName,
        };
        SharedPref.setData(
            key: 'DeviceInfo', dValue: '$returnData', type: 'String');
      }
    } on PlatformException {
      CustomLog.warningLog(value: "Only For Android and IOS");
    } catch (e) {
      CustomLog.errorLog(value: "$e");
    }

    return returnData;
  }
}
