import 'dart:convert';
import 'dart:developer';

import 'package:customstuff/utils/log_print.dart';
import 'package:flutter/material.dart';
import 'package:marketing/model/dropdown_model.dart';
import 'package:marketing/model/entry_detail_model.dart';
import 'package:marketing/model/login_model.dart';
import 'package:marketing/screen/index/component/organization_section.dart';
import 'package:marketing/service/databasehelper/dropdownhelper/dropdown_dbhelper.dart';
import 'package:marketing/service/databasehelper/organizationdetail/organization_detail_helper.dart';
import 'package:marketing/service/networkhelper/dropdown/dropdown_api.dart';
import 'package:marketing/service/sharepreference/login_share_pref.dart';
import 'package:marketing/utils/alert/confirmation_alert.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class IndexState extends ChangeNotifier {
  late LoginDataModel loginModel;
  late BuildContext context;
  late GlobalKey<FormState> validateKey;

  late bool isViewMore, isFollowUpInformation;
  SoftwareType? typeValue;

  late FocusNode organizationNameFocus,
      websiteFocus,
      softwareFocus,
      attendanceFocus,
      smsFocus,
      cloudFocus;

  late List<FocusNode> serviceTypeFocusList = [
    websiteFocus,
    softwareFocus,
    attendanceFocus,
    smsFocus,
    cloudFocus,
  ];

  late TextEditingController orgNameController,
      orgAddressController,
      orgTypeController,
      orgDistrictController,
      orgContactPersonController,
      orgLandlineController,
      orgMobileNoController,
      webSiteController,
      softwareController,
      attendanceController,
      smsController,
      cloudController,
      softwareTypeController,
      emailController,
      orgPanController,
      socialMediaController,
      latitudeController,
      longitudeController,
      leadSourceController,
      productController,
      leadStatusController,
      leadStaffController,
      leadDateController,
      leadEnquiryTimeController,
      leadRemarkController,
      quotePriceController,
      followController,
      followSelectController,
      followDateController,
      followTimeController,
      followStaffController,
      followRemarkController;

  late List<bool> isChecked;
  late final List<String> texts = [
    "Website",
    "Software",
    "Attendance System",
    "SMS Service",
    "Cloud Backup"
  ];
  late List<TextEditingController> serviceTypeControllerList = [];

  //
  // set getControllerText(){
  //   notifyListeners();
  // }

  late List<DropDownDataModel> organizationTypeList,
      districtList,
      leadSourceList,
      leadProductList,
      staffList,
      selectFollowList;

  IndexState() {
    validateKey = GlobalKey<FormState>();
    loginModel = LoginDataModel.fromJson({});
    organizationTypeList = [];
    districtList = [];
    leadSourceList = [];
    leadProductList = [];
    staffList = [];
    selectFollowList = [];
    isViewMore = false;
    isFollowUpInformation = false;
    organizationNameFocus = FocusNode();
    websiteFocus = FocusNode();
    softwareFocus = FocusNode();
    attendanceFocus = FocusNode();
    smsFocus = FocusNode();
    cloudFocus = FocusNode();
  }

  late String currentTime;

  init() async {
    await clear();
    await getSharePref();
    await getDropDownValue();
    await getDropDownDataFromDatabase();
  }

  getSharePref() async {
    loginModel = await LoginSharePref.getLoginSharePrefData();
    notifyListeners();
  }

  clear() async {
    currentTime = NepaliDateTime.now().format("hh:mm aa");
    organizationTypeList.clear;
    districtList.clear;
    leadSourceList.clear;
    leadProductList.clear;
    staffList.clear;
    selectFollowList.clear;
    typeValue = SoftwareType.offline;
    isViewMore = false;
    isFollowUpInformation = false;
    orgNameController = TextEditingController(text: "");
    orgAddressController = TextEditingController(text: "");
    orgTypeController = TextEditingController(text: "");
    orgDistrictController = TextEditingController(text: "");
    orgContactPersonController = TextEditingController(text: "");
    orgLandlineController = TextEditingController(text: "");
    orgMobileNoController = TextEditingController(text: "");

    webSiteController = TextEditingController(text: "");
    softwareController = TextEditingController(text: "");
    attendanceController = TextEditingController(text: "");
    smsController = TextEditingController(text: "");
    cloudController = TextEditingController(text: "");

    softwareTypeController = TextEditingController(text: "0");
    emailController = TextEditingController(text: "");
    orgPanController = TextEditingController(text: "");
    socialMediaController = TextEditingController(text: "");
    latitudeController = TextEditingController(text: "");
    longitudeController = TextEditingController(text: "");
    leadSourceController = TextEditingController(text: "");
    productController = TextEditingController(text: "");
    leadStatusController = TextEditingController(text: "");
    leadStaffController = TextEditingController(text: "");
    leadDateController =
        TextEditingController(text: NepaliDateTime.now().format("y/MM/dd"));
    leadEnquiryTimeController =
        TextEditingController(text: getFormattedTime(time: currentTime));
    leadRemarkController = TextEditingController(text: "");
    quotePriceController = TextEditingController(text: "");
    followController = TextEditingController(text: "");
    followSelectController = TextEditingController(text: "");

    followDateController =
        TextEditingController(text: NepaliDateTime.now().format("y/MM/dd"));
    followTimeController =
        TextEditingController(text: getFormattedTime(time: currentTime));

    followStaffController = TextEditingController(text: "");
    followRemarkController = TextEditingController(text: "");

    // organizationNameFocus.requestFocus();

    isChecked = List<bool>.filled(texts.length, false);
    serviceTypeControllerList =
        List<TextEditingController>.generate(texts.length, (index) {
      return TextEditingController(text: "");
    });
  }

  set getContext(value) {
    context = value;
  }

  set getViewMore(bool value) {
    isViewMore = value;
    notifyListeners();
  }

  set getFollowUpInformation(bool value) {
    isFollowUpInformation = value;
    notifyListeners();
  }

  set getLeadDate(String value) {
    leadDateController.text = value;
    notifyListeners();
  }

  set getFollowDate(String value) {
    followDateController.text = value;
    notifyListeners();
  }

  set getOrgType(String value) {
    orgTypeController.text = value;
    notifyListeners();
  }

  set getSoftwareType(String value) {
    softwareTypeController.text = value;
    notifyListeners();
  }

  set getOrgDistrict(String value) {
    orgDistrictController.text = value;
    notifyListeners();
  }

  set getLeadSource(String value) {
    leadSourceController.text = value;
    notifyListeners();
  }

  set getProduct(String value) {
    productController.text = value;
    notifyListeners();
  }

  set getLeadStatus(String value) {
    leadStatusController.text = getLeadValue(value: value);
    notifyListeners();
  }

  String getLeadValue({required String value}) {
    switch (value) {
      case "Pending":
        return "1";
      case "Success":
        return "2";
      case "Failed":
        return "3";
      default:
        return "0";
    }
  }

  set getLeadStaff(String value) {
    leadStaffController.text = value;
    notifyListeners();
  }

  set getFollow(String value) {
    followController.text = value;
    notifyListeners();
  }

  set getFollowStaff(String value) {
    followStaffController.text = value;
    notifyListeners();
  }

  Future<void> selectDate({
    required BuildContext context,
    required String filterFrom,
  }) async {
    NepaliDateTime date = NepaliDateTime.now();
    final NepaliDateTime? pickedDate = await showMaterialDatePicker(
      context: context,
      initialDate: date,
      firstDate: NepaliDateTime.now().subtract(const Duration(days: 90)),
      lastDate: NepaliDateTime.now(),
    );
    if (pickedDate != null && pickedDate != date) date = pickedDate;
    if (filterFrom == "Lead") {
      getLeadDate = date.toString().substring(0, 10).replaceAll("-", "/");
      validateKey.currentState!.validate();
    } else {
      getFollowDate = date.toString().substring(0, 10).replaceAll("-", "/");
      validateKey.currentState!.validate();
    }
    notifyListeners();
  }

  Future<void> getTime({
    required BuildContext context,
    required String filterFrom,
  }) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 00),
    );
    if (newTime != null) {
      if (filterFrom == "Lead") {
        String value = newTime.format(context);
        leadEnquiryTimeController.text = getFormattedTime(time: value);
        validateKey.currentState!.validate();
      } else {
        String value = newTime.format(context);
        followTimeController.text = getFormattedTime(time: value);
        validateKey.currentState!.validate();
      }
    }
    notifyListeners();
  }

  onSubmit() async {
    if (validateKey.currentState!.validate()) {
      ConfirmationAlert.confirmation(
        text: "you want to save data ?",
        context: context,
        onConfirm: () async {
          Navigator.pop(context);
          await insertToDatabase().whenComplete(() async {
            validateKey.currentState!.reset();
            await clear();
          });
        },
        onCancel: () {
          Navigator.pop(context);
        },
      );
    }
    notifyListeners();
  }

  Future insertToDatabase() async {
    EntryDetailModel detailModel = EntryDetailModel.name(
      flag: isFollowUpInformation ? "LF" : "L",
      orgName: orgNameController.text.trim(),
      orgAddress: orgAddressController.text.trim(),
      orgType: orgTypeController.text.trim(),
      orgDistrict: orgDistrictController.text.trim(),
      orgContactPerson: orgContactPersonController.text.trim(),
      orgLandlineNo: orgLandlineController.text.trim(),
      mobileNo: orgMobileNoController.text.trim(),
      softwareType: softwareTypeController.text.trim(),
      website: serviceTypeControllerList[0].text.trim(),
      //webSiteController.text.trim(),
      software: serviceTypeControllerList[1].text.trim(),
      //softwareController.text.trim(),
      attendanceSystem: serviceTypeControllerList[2].text.trim(),
      //attendanceController.text.trim(),
      smsService: serviceTypeControllerList[3].text.trim(),
      //smsController.text.trim(),
      cloudBackUp: serviceTypeControllerList[4].text.trim(),
      //cloudController.text.trim(),
      email: emailController.text.trim(),
      orgPAN: orgPanController.text.trim(),
      socialMedia: socialMediaController.text.trim(),
      latitude: latitudeController.text.isEmpty
          ? "0"
          : latitudeController.text.trim(),
      longitude: longitudeController.text.isEmpty
          ? "0"
          : longitudeController.text.trim(),
      leadSource: leadSourceController.text.trim(),
      leadProduct: productController.text.trim(),
      leadStatus: leadStatusController.text.trim(),
      leadStaff: leadStaffController.text.trim(),
      leadDate: leadDateController.text.trim(),
      enquiryTime: leadEnquiryTimeController.text.trim(),
      leadRemark: leadRemarkController.text.trim(),
      quotePrice: quotePriceController.text.trim(),
      followFor:
          followController.text.isEmpty ? "0" : followController.text.trim(),
      followDate: followDateController.text.trim(),
      followTime: followTimeController.text.trim(),
      followStaff: followStaffController.text.isEmpty
          ? "0"
          : followStaffController.text.trim(),
      followRemark: followRemarkController.text.trim(),
    );

    CustomLog.actionLog(
        value: "\n\nEntry Value  =>  ${jsonEncode(detailModel)}");

    OrgDataDBHelper.instance.insertData(detailModel);
    notifyListeners();
  }

  getDropDownValue() async {
    DropDownModel modelData = await DropDownAPI.apiCall(
      cooperativeCode: "ES25",
      branchId: loginModel.BranchId,
      departmentId: loginModel.DepartmentID,
      subDepartId: loginModel.SubDepartmentID,
    );
    if (modelData.statusCode == 200) {
      await DropdownDBHelper.instance.deleteAllData();
      for (var element in modelData.dropdownList) {
        await DropdownDBHelper.instance.insertData(element);
        CustomLog.successLog(value: element.type);
      }
    } else {
      // await getDropDownDataFromDatabase();
    }
    notifyListeners();
  }

  getDropDownDataFromDatabase() async {
    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "FOLLOWTYPE")
        .then((dataList) {
      selectFollowList = dataList;
    });

    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "PRODUCT")
        .then((dataList) {
      leadProductList = dataList;
    });

    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "LEADSOURCE")
        .then((dataList) {
      leadSourceList = dataList;
    });

    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "DISTRICT")
        .then((dataList) {
      districtList = dataList;
    });

    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "ORGTYPE")
        .then((dataList) {
      organizationTypeList = dataList;
    });

    ///
    await DropdownDBHelper.instance
        .getFilterList(filterFrom: "STAFF")
        .then((dataList) {
      staffList = dataList;
    });

    notifyListeners();
  }

  String getFormattedTime({required String time}) {
    String splitTime = "${time.split(" ")[0]}:00 ";
    String fixTime = (int.parse(splitTime.split(":").first) < 10)
        ? "0${time.split(" ")[0]}:00 "
        : "${time.split(" ")[0]}:00 ";
    String formattedTime = fixTime + time.split(" ")[1];
    log("Fix Time  => $fixTime");
    log("Lead Time  => $formattedTime");
    return formattedTime;
  }
}
