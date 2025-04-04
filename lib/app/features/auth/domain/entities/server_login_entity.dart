class ServerLoginEntity {
  bool isAuthenticated;
  String message;
  String? accessTokens;
  DateTime? expairyTime;
  UserInfoEntity? userInfo;
  List<CompanyDetailEntity>? companyDetails;

  ServerLoginEntity({
    required this.isAuthenticated,
    required this.message,
    this.accessTokens,
    this.expairyTime,
    this.userInfo,
    this.companyDetails,
  });
}

class CompanyDetailEntity {
  String? companyIdpk;
  String? autherizationUserIdpk;
  String? companyId;
  String? companyName;
  String? companyNameArabic;
  String? connectionInfo;
  String? tradeLicenceNo;
  DateTime? licenceExpiryDate;
  bool? isActive;
  String? mailingName;
  String? authorisedPerson;
  String? address;
  String? location;
  String? phone;
  String? mobile;
  String? email;
  String? fax;
  String? website;
  int? countryIdpk;
  int? stateIdpk;
  String? taxRegNo;
  String? incomeTaxNo;
  String? description;
  String? logo;
  String? logoPath;
  String? softwareType;
  DateTime? instalationDate;
  DateTime? activationDate;
  DateTime? lastRenewalDate;
  DateTime? amcExpairyDate;
  DateTime? serverExpairyDate;
  DateTime? softwareExpairyDate;
  DateTime? expairyDate;
  String? serverType;
  bool? isOnline;
  List<CompanyPermissionEntity>? companyPermission;

  CompanyDetailEntity({
    this.companyIdpk,
    this.autherizationUserIdpk,
    this.companyId,
    this.companyName,
    this.companyNameArabic,
    this.connectionInfo,
    this.tradeLicenceNo,
    this.licenceExpiryDate,
    this.isActive,
    this.mailingName,
    this.authorisedPerson,
    this.address,
    this.location,
    this.phone,
    this.mobile,
    this.email,
    this.fax,
    this.website,
    this.countryIdpk,
    this.stateIdpk,
    this.taxRegNo,
    this.incomeTaxNo,
    this.description,
    this.logo,
    this.logoPath,
    this.softwareType,
    this.instalationDate,
    this.activationDate,
    this.lastRenewalDate,
    this.amcExpairyDate,
    this.serverExpairyDate,
    this.softwareExpairyDate,
    this.expairyDate,
    this.serverType,
    this.isOnline,
    this.companyPermission,
  });
}

class CompanyPermissionEntity {
  String? companyIdpk;
  String? formIdpk;
  String? formId;
  String? formName;
  String? formGroup;
  bool? isAuthorized;

  CompanyPermissionEntity({
    this.companyIdpk,
    this.formIdpk,
    this.formId,
    this.formName,
    this.formGroup,
    this.isAuthorized,
  });
}

class UserInfoEntity {
  String? userIdpk;
  int? userTypeId;
  String? userType;
  String? username;
  String? password;
  String? autherizationPerson;
  bool? isActive;

  UserInfoEntity({
    this.userIdpk,
    this.userTypeId,
    this.userType,
    this.username,
    this.password,
    this.autherizationPerson,
    this.isActive,
  });
}
