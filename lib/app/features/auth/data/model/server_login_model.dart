import 'package:easy_vat_v2/app/features/auth/domain/entities/server_login_entity.dart';

class ServerLoginModel extends ServerLoginEntity {
  ServerLoginModel({
    required super.isAuthenticated,
    required super.message,
    super.accessTokens,
    super.expairyTime,
    super.userInfo,
    super.companyDetails,
  });

  factory ServerLoginModel.fromJson(Map<String, dynamic> json) =>
      ServerLoginModel(
        isAuthenticated: json["isAuthenticated"],
        message: json["message"],
        accessTokens: json["accessTokens"],
        expairyTime: DateTime.parse(json["expairyTime"]),
        userInfo: UserInfoModel.fromJson(json["userInfo"]),
        companyDetails: List<CompanyDetailModel>.from(
            json["companyDetails"].map((x) => CompanyDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isAuthenticated": isAuthenticated,
        "message": message,
        "accessTokens": accessTokens,
        "expairyTime": expairyTime?.toIso8601String(),
        // "userInfo": userInfo.toJson(),
        // "companyDetails":
        //     List<dynamic>.from(companyDetails.map((x) => x.toJson())),
      };
}

class CompanyDetailModel extends CompanyDetailEntity {
  CompanyDetailModel({
    super.companyIdpk,
    super.autherizationUserIdpk,
    super.companyId,
    super.companyName,
    super.companyNameArabic,
    super.connectionInfo,
    super.tradeLicenceNo,
    super.licenceExpiryDate,
    super.isActive,
    super.mailingName,
    super.authorisedPerson,
    super.address,
    super.location,
    super.phone,
    super.mobile,
    super.email,
    super.fax,
    super.website,
    super.countryIdpk,
    super.stateIdpk,
    super.taxRegNo,
    super.incomeTaxNo,
    super.description,
    super.logo,
    super.logoPath,
    super.softwareType,
    super.instalationDate,
    super.activationDate,
    super.lastRenewalDate,
    super.amcExpairyDate,
    super.serverExpairyDate,
    super.softwareExpairyDate,
    super.expairyDate,
    super.serverType,
    super.isOnline,
  });

  factory CompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      CompanyDetailModel(
        companyIdpk: json["companyIDPK"],
        autherizationUserIdpk: json["autherizationUserIDPK"],
        companyId: json["companyID"],
        companyName: json["companyName"],
        companyNameArabic: json["companyNameArabic"],
        connectionInfo: json["connectionInfo"],
        tradeLicenceNo: json["tradeLicenceNo"],
        licenceExpiryDate: DateTime.parse(json["licenceExpiryDate"]),
        isActive: json["isActive"],
        mailingName: json["mailingName"],
        authorisedPerson: json["authorisedPerson"],
        address: json["address"],
        location: json["location"],
        phone: json["phone"],
        mobile: json["mobile"],
        email: json["email"],
        fax: json["fax"],
        website: json["website"],
        countryIdpk: json["countryIDPK"],
        stateIdpk: json["stateIDPK"],
        taxRegNo: json["taxRegNo"],
        incomeTaxNo: json["incomeTaxNo"],
        description: json["description"],
        logo: json["logo"],
        logoPath: json["logoPath"],
        softwareType: json["softwareType"],
        instalationDate: DateTime.parse(json["instalationDate"]),
        activationDate: DateTime.parse(json["activationDate"]),
        lastRenewalDate: DateTime.parse(json["lastRenewalDate"]),
        amcExpairyDate: DateTime.parse(json["amcExpairyDate"]),
        serverExpairyDate: DateTime.parse(json["serverExpairyDate"]),
        softwareExpairyDate: DateTime.parse(json["softwareExpairyDate"]),
        expairyDate: DateTime.parse(json["expairyDate"]),
        serverType: json["serverType"],
        isOnline: json["isOnline"],
      );

  Map<String, dynamic> toJson() => {
        "companyIDPK": companyIdpk,
        "autherizationUserIDPK": autherizationUserIdpk,
        "companyID": companyId,
        "companyName": companyName,
        "companyNameArabic": companyNameArabic,
        "connectionInfo": connectionInfo,
        "tradeLicenceNo": tradeLicenceNo,
        "licenceExpiryDate": licenceExpiryDate?.toIso8601String(),
        "isActive": isActive,
        "mailingName": mailingName,
        "authorisedPerson": authorisedPerson,
        "address": address,
        "location": location,
        "phone": phone,
        "mobile": mobile,
        "email": email,
        "fax": fax,
        "website": website,
        "countryIDPK": countryIdpk,
        "stateIDPK": stateIdpk,
        "taxRegNo": taxRegNo,
        "incomeTaxNo": incomeTaxNo,
        "description": description,
        "logo": logo,
        "logoPath": logoPath,
        "softwareType": softwareType,
        "instalationDate": instalationDate?.toIso8601String(),
        "activationDate": activationDate?.toIso8601String(),
        "lastRenewalDate": lastRenewalDate?.toIso8601String(),
        "amcExpairyDate": amcExpairyDate?.toIso8601String(),
        "serverExpairyDate": serverExpairyDate?.toIso8601String(),
        "softwareExpairyDate": softwareExpairyDate?.toIso8601String(),
        "expairyDate": expairyDate?.toIso8601String(),
        "serverType": serverType,
        "isOnline": isOnline,
      };
}

class UserInfoModel extends UserInfoEntity {
  UserInfoModel({
    super.userIdpk,
    super.userTypeId,
    super.userType,
    super.username,
    super.password,
    super.autherizationPerson,
    super.isActive,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userIdpk: json["userIDPK"],
        userTypeId: json["userTypeID"],
        userType: json["userType"],
        username: json["username"],
        password: json["password"],
        autherizationPerson: json["autherizationPerson"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "userIDPK": userIdpk,
        "userTypeID": userTypeId,
        "userType": userType,
        "username": username,
        "password": password,
        "autherizationPerson": autherizationPerson,
        "isActive": isActive,
      };
}
