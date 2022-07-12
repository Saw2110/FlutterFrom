import 'package:flutter/material.dart';
import 'package:marketing/model/basic_model.dart';
import 'package:marketing/model/entry_detail_model.dart';
import 'package:marketing/model/login_model.dart';
import 'package:marketing/service/databasehelper/dropdownhelper/dropdown_dbhelper.dart';
import 'package:marketing/service/databasehelper/organizationdetail/organization_detail_helper.dart';
import 'package:marketing/service/networkhelper/updateOrgData/updateOrg_api.dart';
import 'package:marketing/service/sharepreference/login_share_pref.dart';
import 'package:marketing/utils/show_toast.dart';

class OrgListState extends ChangeNotifier {
  late bool isLoading;
  late List<EntryDetailModel> dataList;

  late BuildContext context;
  late EntryDetailModel dataValue;
  late LoginDataModel loginData;
  late String organizationTypeName,
      districtName,
      leadStaffName,
      leadSourceName,
      leadProductName,
      followStaffName,
      followForName;

  OrgListState() {
    dataValue = EntryDetailModel();
    loginData = LoginDataModel.fromJson({});
    isLoading = false;
    dataList = [];
  }

  set getContext(value) {
    context = value;
  }

  init() async {
    Future.delayed(const Duration(seconds: 0), () async {
      await clear();
      await getSharePref();
      await getDataFromDB();
    });
  }

  clear() async {
    isLoading = false;
    organizationTypeName = "";
    districtName = "";
    leadStaffName = "";
    leadSourceName = "";
    leadProductName = "";
    followStaffName = "";
    followForName = "";
    dataList.clear();
    notifyListeners();
  }

  getSharePref() async {
    loginData = await LoginSharePref.getLoginSharePrefData();
    notifyListeners();
  }

  set getLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  deleteAll() async {
    Navigator.pop(context);
    await OrgDataDBHelper.instance.deleteAllData().whenComplete(() async {
      await getDataFromDB();
    });
    notifyListeners();
  }

  deleteById({required String idValue}) async {
    Navigator.pop(context);
    await OrgDataDBHelper.instance
        .deleteData(idValue: idValue)
        .whenComplete(() async {
      await getDataFromDB();
    });
    notifyListeners();
  }

  getDataFromDB() async {
    dataList.clear();
    await OrgDataDBHelper.instance.getDataList().then((value) {
      dataList = value;
    });
    notifyListeners();
  }

  EntryDetailModel filterList({required String orgName}) {
    List<EntryDetailModel> outputList;
    outputList = dataList.where((value) => value.orgName == orgName).toList();
    return outputList[0];
  }

  onDataUpload({required String from}) async {
    getLoading = true;
    Navigator.pop(context);

    BasicModel basicModel = await UpdateOrgAPI.apiCall(
        data: dataValue, loginData: loginData, cooperativeCode: "ES25");
    if (basicModel.statusCode == 200) {
      if (from != "List") {
        Navigator.pop(context);
      }
      await OrgDataDBHelper.instance.deleteData(idValue: dataValue.primaryId!);
      await getDataFromDB();
      ShowToast.success(msg: basicModel.message);
      getLoading = false;
    } else {
      getLoading = false;
      ShowToast.failure(msg: basicModel.message);
    }
    notifyListeners();
  }

  getDropDownDataFromDatabase() async {
    ///
    organizationTypeName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "ORGTYPE", id: dataValue.orgType);
    // CustomLog.actionLog(value: "ORGTYPE  =>  $organizationTypeName");

    ///
    districtName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "DISTRICT", id: dataValue.orgDistrict);
    // CustomLog.actionLog(value: "DISTRICT  =>  $districtName");

    ///
    leadStaffName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "STAFF", id: dataValue.leadStaff);
    // CustomLog.actionLog(value: "leadStaffName  =>  $leadStaffName");

    ///
    leadSourceName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "LEADSOURCE", id: dataValue.leadSource);
    // CustomLog.actionLog(value: "LEADSOURCE  =>  $leadSourceName");

    ///
    leadProductName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "PRODUCT", id: dataValue.leadProduct);
    // CustomLog.actionLog(value: "PRODUCT  =>  $leadProductName");

    ///
    followStaffName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "STAFF", id: dataValue.followStaff);
    // CustomLog.actionLog(value: "FollowStaffName  =>  $followStaffName");

    ///
    followForName = await DropdownDBHelper.instance
        .getNameFromID(filterFrom: "FOLLOWTYPE", id: dataValue.followFor);
    // CustomLog.actionLog(value: "followForName  =>  $followForName");

    notifyListeners();
  }

  String getLeadStatusName({required String value}) {
    switch (value) {
      case "1":
        return "Pending";
      case "2":
        return "Success";
      case "3":
        return "Failed";
      default:
        return "0";
    }
  }
}
