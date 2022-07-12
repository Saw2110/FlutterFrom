class EntryDetailModel {
  late final String? primaryId;
  late final String flag;
  late final String orgName;
  late final String orgAddress;
  late final String orgType;
  late final String orgDistrict;
  late final String orgContactPerson;
  late final String orgLandlineNo;
  late final String mobileNo;
  late final String softwareType;
  late final String website;
  late final String software;
  late final String attendanceSystem;
  late final String smsService;
  late final String cloudBackUp;
  late final String email;
  late final String orgPAN;
  late final String socialMedia;
  late final String latitude;
  late final String longitude;
  late final String leadSource;
  late final String leadProduct;
  late final String leadStatus;
  late final String leadStaff;
  late final String leadDate;
  late final String enquiryTime;
  late final String leadRemark;
  late final String quotePrice;
  late final String followFor;
  late final String followDate;
  late final String followTime;
  late final String followStaff;
  late final String followRemark;

  EntryDetailModel();

  EntryDetailModel.name(
      {this.primaryId,
      required this.flag,
      required this.orgName,
      required this.orgAddress,
      required this.orgType,
      required this.orgDistrict,
      required this.orgContactPerson,
      required this.orgLandlineNo,
      required this.mobileNo,
      required this.softwareType,
      required this.website,
      required this.software,
      required this.attendanceSystem,
      required this.smsService,
      required this.cloudBackUp,
      required this.email,
      required this.orgPAN,
      required this.socialMedia,
      required this.latitude,
      required this.longitude,
      required this.leadSource,
      required this.leadProduct,
      required this.leadStatus,
      required this.leadStaff,
      required this.leadDate,
      required this.enquiryTime,
      required this.leadRemark,
      required this.quotePrice,
      required this.followFor,
      required this.followDate,
      required this.followTime,
      required this.followStaff,
      required this.followRemark});

  EntryDetailModel.fromJson(Map<String, dynamic> json) {
    primaryId = int.parse(json['PrimaryID'].toString()).toString();
    flag = json['Flag'] ?? "-";
    orgName = json['OrgName'] ?? "-";
    orgAddress = json['OrgAddress'] ?? "-";
    orgType = json['OrgType'] ?? "-";
    orgDistrict = json['OrgDistrict'] ?? "-";
    orgContactPerson = json['OrgContactPerson'] ?? "-";
    orgLandlineNo = json['OrgLandlineNo'] ?? "-";
    mobileNo = json['MobileNo'] ?? "-";
    softwareType = json['SoftwareType'] ?? "-";
    website = json['Website'] ?? "-";
    software = json['Software'] ?? "-";
    attendanceSystem = json['AttendanceSystem'] ?? "-";
    smsService = json['SMSService'] ?? "-";
    cloudBackUp = json['CloudBackup'] ?? "-";
    email = json['Email'] ?? "-";
    orgPAN = json['PAN'] ?? "-";
    socialMedia = json['SocialMedia'] ?? "-";
    latitude = json['Latitude'] ?? "-";
    longitude = json['Longitude'] ?? "-";
    leadSource = json['LeadSource'] ?? "-";
    leadProduct = json['LeadProduct'] ?? "-";
    leadStatus = json['LeadStatus'] ?? "-";
    leadStaff = json['LeadStaff'] ?? "-";
    leadDate = json['LeadDate'] ?? "-";
    enquiryTime = json['EnquiryTime'] ?? "-";
    leadRemark = json['LeadRemark'] ?? "-";
    quotePrice = json['QuotePrice'] ?? "-";
    followFor = json['FollowFor'] ?? "-";
    followDate = json['FollowDate'] ?? "-";
    followTime = json['FollowTime'] ?? "-";
    followStaff = json['FollowStaff'] ?? "-";
    followRemark = json['FollowRemark'] ?? "-";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['PrimaryID'] = primaryId;
    _data['Flag'] = flag;
    _data['OrgName'] = orgName;
    _data['OrgAddress'] = orgAddress;
    _data['OrgType'] = orgType;
    _data['OrgDistrict'] = orgDistrict;
    _data['OrgContactPerson'] = orgContactPerson;
    _data['OrgLandlineNo'] = orgLandlineNo;
    _data['MobileNo'] = mobileNo;
    _data['SoftwareType'] = softwareType;
    _data['Website'] = website;
    _data['Software'] = software;
    _data['AttendanceSystem'] = attendanceSystem;
    _data['SMSService'] = smsService;
    _data['CloudBackup'] = cloudBackUp;
    _data['Email'] = email;
    _data['PAN'] = orgPAN;
    _data['SocialMedia'] = socialMedia;
    _data['Latitude'] = latitude;
    _data['Longitude'] = longitude;
    _data['LeadSource'] = leadSource;
    _data['LeadProduct'] = leadProduct;
    _data['LeadStatus'] = leadStatus;
    _data['LeadStaff'] = leadStaff;
    _data['LeadDate'] = leadDate;
    _data['EnquiryTime'] = enquiryTime;
    _data['LeadRemark'] = leadRemark;
    _data['QuotePrice'] = quotePrice;
    _data['FollowFor'] = followFor;
    _data['FollowDate'] = followDate;
    _data['FollowTime'] = followTime;
    _data['FollowStaff'] = followStaff;
    _data['FollowRemark'] = followRemark;
    return _data;
  }
}
