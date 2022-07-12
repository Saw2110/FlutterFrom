import 'package:marketing/constant/api_constant.dart';

class LoginModel {
  LoginModel({
    required this.logins,
    required this.statusCode,
    required this.message,
    required this.token,
  });

  late final String token;
  late final int statusCode;
  late final String message;
  late final List<LoginDataModel> logins;

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'] ?? errorMap["StatusCode"];
    message = json['Message'] ?? errorMap["Message"];
    token = json['Token'] ?? errorMap["Token"];
    logins = List.from(json['Logins'] ?? [])
        .map((e) => LoginDataModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Token'] = token;
    _data['StatusCode'] = statusCode;
    _data['Message'] = message;
    _data['Logins'] = logins.map((e) => e.toJson()).toList();
    return _data;
  }
}

class LoginDataModel {
  LoginDataModel({
    required this.UID,
    required this.UserID,
    required this.DeviceCode,
    required this.FirstName,
    required this.MiddleName,
    required this.LastName,
    required this.Contact,
    required this.PAN,
    required this.Phone,
    required this.MaritalStatus,
    required this.DateOfBirth,
    required this.Email,
    required this.CitizenshipNo,
    required this.Gender,
    required this.BloodGroup,
    required this.Religion,
    required this.SubDepartmentID,
    required this.Address,
    required this.District,
    required this.UserImage,
    required this.IsManager,
    required this.FiscalYear,
    required this.FiscalId,
    required this.ShiftName,
    required this.ShiftStart,
    required this.ShiftEnd,
    required this.AllowedLateIn,
    required this.AllowedEarlyOut,
    required this.LaunchStart,
    required this.LaunchEnd,
    required this.ShiftType,
    required this.ShiftID,
    required this.BranchName,
    required this.BranchId,
    required this.GradeName,
    required this.GradeID,
    required this.EnrollDate,
    required this.DesignationName,
    required this.DesignationID,
    required this.DepartmentID,
    required this.DepartmentName,
    required this.SubDepartmentName,
    required this.JobType,
    required this.LeavedDate,
    required this.WorkingStatus,
    required this.WorkingDays,
  });

  late final String UID;
  late final String UserID;
  late final String DeviceCode;
  late final String FirstName;
  late final String MiddleName;
  late final String LastName;
  late final String Contact;
  late final String PAN;
  late final String Phone;
  late final String MaritalStatus;
  late final String DateOfBirth;
  late final String Email;
  late final String CitizenshipNo;
  late final String Gender;
  late final String BloodGroup;
  late final String Religion;
  late final String SubDepartmentID;
  late final String Address;
  late final String District;
  late final String UserImage;
  late final String IsManager;
  late final String FiscalYear;
  late final String FiscalId;
  late final String ShiftName;
  late final String ShiftStart;
  late final String ShiftEnd;
  late final String AllowedLateIn;
  late final String AllowedEarlyOut;
  late final String LaunchStart;
  late final String LaunchEnd;
  late final String ShiftType;
  late final String ShiftID;
  late final String BranchName;
  late final String BranchId;
  late final String GradeName;
  late final String GradeID;
  late final String EnrollDate;
  late final String DesignationName;
  late final String DesignationID;
  late final String DepartmentID;
  late final String DepartmentName;
  late final String SubDepartmentName;
  late final String JobType;
  late final String LeavedDate;
  late final String WorkingStatus;
  late final String WorkingDays;

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    UID = json['UID'] == null
        ? "-"
        : int.parse(json['UID'].toString()).toString();
    UserID = json['UserID'] ?? "-";
    DeviceCode = json['DeviceCode'] ?? "-";
    FirstName = json['FirstName'] ?? "-";
    MiddleName = json['MiddleName'] ?? "-";
    LastName = json['LastName'] ?? "-";
    Contact = json['Contact'] ?? "-";
    PAN = json['PAN'] ?? "-";
    Phone = json['Phone'] ?? "-";
    MaritalStatus = json['MaritalStatus'] ?? "-";
    DateOfBirth = json['DateOfBirth'] ?? "-";
    Email = json['Email'] ?? "-";
    CitizenshipNo = json['CitizenshipNo'] ?? "-";
    Gender = json['Gender'] ?? "-";
    BloodGroup = json['BloodGroup'] ?? "-";
    Religion = json['Religion'] ?? "-";
    SubDepartmentID = json['SubDepartmentID'] == null
        ? "-"
        : int.parse(json['SubDepartmentID'].toString()).toString();
    Address = json['Address'] ?? "-";
    District = json['District'] ?? "-";
    UserImage = json['UserImage'] ?? "-";
    IsManager = json['IsManager'] == null
        ? "-"
        : int.parse(json['IsManager'].toString()).toString();
    FiscalYear = json['FiscalYear'] ?? "-";
    FiscalId = json['FiscalId'] == null
        ? "-"
        : int.parse(json['FiscalId'].toString()).toString();
    ShiftName = json['ShiftName'] ?? "-";
    ShiftStart = json['ShiftStart'] ?? "-";
    ShiftEnd = json['ShiftEnd'] ?? "-";
    AllowedLateIn = json['AllowedLateIn'] ?? "-";
    AllowedEarlyOut = json['AllowedEarlyOut'] ?? "-";
    LaunchStart = json['LaunchStart'] ?? "-";
    LaunchEnd = json['LaunchEnd'] ?? "-";
    ShiftType = json['ShiftType'] ?? "-";
    ShiftID = json['ShiftID'] == null
        ? "-"
        : int.parse(json['ShiftID'].toString()).toString();
    BranchName = json['BranchName'] ?? "-";
    BranchId = json['BranchId'] == null
        ? "-"
        : int.parse(json['BranchId'].toString()).toString();
    GradeName = json['GradeName'] ?? "-";
    GradeID = json['GradeID'] == null
        ? "-"
        : int.parse(json['GradeID'].toString()).toString();
    EnrollDate = json['EnrollDate'] ?? "-";
    DesignationName = json['DesignationName'] ?? "-";
    DesignationID = json['DesignationID'] == null
        ? "-"
        : int.parse(json['DesignationID'].toString()).toString();
    DepartmentID = json['DepartmentID'] == null
        ? "-"
        : int.parse(json['DepartmentID'].toString()).toString();
    DepartmentName = json['DepartmentName'] ?? "-";
    SubDepartmentName = json['SubDepartmentName'] ?? "-";
    JobType = json['JobType'] ?? "-";
    LeavedDate = json['LeavedDate'] ?? "-";
    WorkingStatus = json['WorkingStatus'] ?? "-";
    WorkingDays = json['WorkingDays'] ?? "-";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UID'] = UID;
    _data['UserID'] = UserID;
    _data['DeviceCode'] = DeviceCode;
    _data['FirstName'] = FirstName;
    _data['MiddleName'] = MiddleName;
    _data['LastName'] = LastName;
    _data['Contact'] = Contact;
    _data['PAN'] = PAN;
    _data['Phone'] = Phone;
    _data['MaritalStatus'] = MaritalStatus;
    _data['DateOfBirth'] = DateOfBirth;
    _data['Email'] = Email;
    _data['CitizenshipNo'] = CitizenshipNo;
    _data['Gender'] = Gender;
    _data['BloodGroup'] = BloodGroup;
    _data['Religion'] = Religion;
    _data['SubDepartmentID'] = SubDepartmentID;
    _data['Address'] = Address;
    _data['District'] = District;
    _data['UserImage'] = UserImage;
    _data['IsManager'] = IsManager;
    _data['FiscalYear'] = FiscalYear;
    _data['FiscalId'] = FiscalId;
    _data['ShiftName'] = ShiftName;
    _data['ShiftStart'] = ShiftStart;
    _data['ShiftEnd'] = ShiftEnd;
    _data['AllowedLateIn'] = AllowedLateIn;
    _data['AllowedEarlyOut'] = AllowedEarlyOut;
    _data['LaunchStart'] = LaunchStart;
    _data['LaunchEnd'] = LaunchEnd;
    _data['ShiftType'] = ShiftType;
    _data['ShiftID'] = ShiftID;
    _data['BranchName'] = BranchName;
    _data['BranchId'] = BranchId;
    _data['GradeName'] = GradeName;
    _data['GradeID'] = GradeID;
    _data['EnrollDate'] = EnrollDate;
    _data['DesignationName'] = DesignationName;
    _data['DesignationID'] = DesignationID;
    _data['DepartmentID'] = DepartmentID;
    _data['DepartmentName'] = DepartmentName;
    _data['SubDepartmentName'] = SubDepartmentName;
    _data['JobType'] = JobType;
    _data['LeavedDate'] = LeavedDate;
    _data['WorkingStatus'] = WorkingStatus;
    _data['WorkingDays'] = WorkingDays;
    return _data;
  }
}
