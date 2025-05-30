import 'package:easy_vat_v2/app/features/employees/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  DateTime? dateOfJoining;
  double? regularWorkingHours;
  double? hourlyRate;
  double? basicSalary;
  double? paidLeave;
  List<DocumentModel>? documents;
  List<AdditionalInfoModel>? additionalInfo;
  List<LedgerModel>? ledger;
  EmployeeModel({
    this.dateOfJoining,
    this.regularWorkingHours,
    this.hourlyRate,
    this.basicSalary,
    this.paidLeave,
    this.documents,
    this.additionalInfo,
    this.ledger,
    super.companyIdpk,
    super.contactNumber,
    super.departmentIdpk,
    super.designationIdpk,
    super.emailId,
    super.employeeId,
    super.employeeIdpk,
    super.firstName,
    super.gender,
    super.lastName,
    super.middleName,
    super.permanentAddress,
    super.photoUrl,
    super.remarks,
    super.salaryType,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        employeeIdpk: json["employeeIDPK"],
        employeeId: json["employeeID"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        departmentIdpk: json["departmentIDPK"],
        designationIdpk: json["designationIDPK"],
        contactNumber: json["contactNumber"],
        permanentAddress: json["permanentAddress"],
        gender: json["gender"],
        emailId: json["emailID"],
        photoUrl: json["photoUrl"],
        dateOfJoining: DateTime.tryParse(json["dateOfJoining"]),
        salaryType: json["salaryType"],
        regularWorkingHours: json["regularWorkingHours"]?.toDouble(),
        hourlyRate: json["hourlyRate"],
        basicSalary: json["basicSalary"],
        paidLeave: json["paidLeave"].toDouble(),
        remarks: json["remarks"],
        companyIdpk: json["companyIDPK"],
        documents: List<DocumentModel>.from(
            json["documents"].map((x) => DocumentModel.fromJson(x))),
        additionalInfo: List<AdditionalInfoModel>.from(
            json["additionalInfo"].map((x) => AdditionalInfoModel.fromJson(x))),
        ledger: List<LedgerModel>.from(
            json["ledger"].map((x) => LedgerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "employeeIDPK": employeeIdpk,
        "employeeID": employeeId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "departmentIDPK": departmentIdpk,
        "designationIDPK": designationIdpk,
        "contactNumber": contactNumber,
        "permanentAddress": permanentAddress,
        "gender": gender,
        "emailID": emailId,
        "photoUrl": photoUrl,
        "dateOfJoining": dateOfJoining?.toIso8601String(),
        "salaryType": salaryType,
        "regularWorkingHours": regularWorkingHours,
        "hourlyRate": hourlyRate,
        "basicSalary": basicSalary,
        "paidLeave": paidLeave,
        "remarks": remarks,
        "companyIDPK": companyIdpk,
        "documents":
            List<dynamic>.from(documents?.map((x) => x.toJson()) ?? []),
        "additionalInfo":
            List<dynamic>.from(additionalInfo?.map((x) => x.toJson()) ?? []),
        "ledger": List<dynamic>.from(ledger?.map((x) => x.toJson()) ?? []),
      };
}

class AdditionalInfoModel {
  String? addTranIdfk;
  String? addFieldName;
  String? addFieldValue;
  String? addFieldDataType;

  AdditionalInfoModel({
    this.addTranIdfk,
    this.addFieldName,
    this.addFieldValue,
    this.addFieldDataType,
  });

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) =>
      AdditionalInfoModel(
        addTranIdfk: json["addTranIDFK"],
        addFieldName: json["addFieldName"],
        addFieldValue: json["addFieldValue"],
        addFieldDataType: json["addFieldDataType"],
      );

  Map<String, dynamic> toJson() => {
        "addTranIDFK": addTranIdfk,
        "addFieldName": addFieldName,
        "addFieldValue": addFieldValue,
        "addFieldDataType": addFieldDataType,
      };
}

class DocumentModel {
  String? documentsIdpk;
  String? documentsTranIdpk;
  String? documentTypeIdfk;
  String? documentNumber;
  String? referenceType;
  DateTime? issuedDate;
  DateTime? renewalDate;
  DateTime? expiryDate;

  DocumentModel({
    this.documentsIdpk,
    this.documentsTranIdpk,
    this.documentTypeIdfk,
    this.documentNumber,
    this.referenceType,
    this.issuedDate,
    this.renewalDate,
    this.expiryDate,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        documentsIdpk: json["documentsIDPK"],
        documentsTranIdpk: json["documentsTranIDPK"],
        documentTypeIdfk: json["documentTypeIDFK"],
        documentNumber: json["documentNumber"],
        referenceType: json["referenceType"],
        issuedDate: DateTime.parse(json["issuedDate"]),
        renewalDate: DateTime.parse(json["renewalDate"]),
        expiryDate: DateTime.parse(json["expiryDate"]),
      );

  Map<String, dynamic> toJson() => {
        "documentsIDPK": documentsIdpk,
        "documentsTranIDPK": documentsTranIdpk,
        "documentTypeIDFK": documentTypeIdfk,
        "documentNumber": documentNumber,
        "referenceType": referenceType,
        "issuedDate": issuedDate?.toIso8601String(),
        "renewalDate": renewalDate?.toIso8601String(),
        "expiryDate": expiryDate?.toIso8601String(),
      };
}

class LedgerModel {
  String? ledgerIdpk;
  String? underIdfk;
  String? ledgerName;
  String? description;
  double? taxPercentage;
  String? mailingName;
  String? billingAddress;
  int? countryIdfk;
  int? countryStatIdfk;
  String? taxability;
  String? taxRegistrationType;
  DateTime? dateOfTaxRegistration;
  String? taxRegistrationNo;
  String? mobile;
  String? phone;
  bool? isActive;
  double? openingBalance;
  String? openingBalanceType;
  double? currentBalance;
  String? contactPerson;
  int? creditDays;
  double? creditLimit;
  String? createdBy;
  DateTime? createdDate;
  String? rowguid;
  DateTime? modifiedDate;
  bool? isEdit;
  String? ledgerCode;
  String? modifiedBy;
  String? contactNo;
  String? companyIdpk;
  String? defaultPaymentMode;

  LedgerModel({
    this.ledgerIdpk,
    this.underIdfk,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.countryIdfk,
    this.countryStatIdfk,
    this.taxability,
    this.taxRegistrationType,
    this.dateOfTaxRegistration,
    this.taxRegistrationNo,
    this.mobile,
    this.phone,
    this.isActive,
    this.openingBalance,
    this.openingBalanceType,
    this.currentBalance,
    this.contactPerson,
    this.creditDays,
    this.creditLimit,
    this.createdBy,
    this.createdDate,
    this.rowguid,
    this.modifiedDate,
    this.isEdit,
    this.ledgerCode,
    this.modifiedBy,
    this.contactNo,
    this.companyIdpk,
    this.defaultPaymentMode,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json) => LedgerModel(
        ledgerIdpk: json["ledgerIDPK"],
        underIdfk: json["underIDFK"],
        ledgerName: json["ledgerName"],
        description: json["description"],
        taxPercentage: json["taxPercentage"],
        mailingName: json["mailingName"],
        billingAddress: json["billingAddress"],
        countryIdfk: json["countryIDFK"],
        countryStatIdfk: json["countryStatIDFK"],
        taxability: json["taxability"],
        taxRegistrationType: json["taxRegistrationType"],
        dateOfTaxRegistration: DateTime.parse(json["dateOfTaxRegistration"]),
        taxRegistrationNo: json["taxRegistrationNo"],
        mobile: json["mobile"],
        phone: json["phone"],
        isActive: json["isActive"],
        openingBalance: json["openingBalance"],
        openingBalanceType: json["openingBalanceType"],
        currentBalance: json["currentBalance"],
        contactPerson: json["contactPerson"],
        creditDays: json["creditDays"],
        creditLimit: json["creditLimit"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        rowguid: json["rowguid"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        isEdit: json["isEdit"],
        ledgerCode: json["ledgerCode"],
        modifiedBy: json["modifiedBy"],
        contactNo: json["contactNo"],
        companyIdpk: json["companyIDPK"],
        defaultPaymentMode: json["defaultPaymentMode"],
      );

  Map<String, dynamic> toJson() => {
        "ledgerIDPK": ledgerIdpk,
        "underIDFK": underIdfk,
        "ledgerName": ledgerName,
        "description": description,
        "taxPercentage": taxPercentage,
        "mailingName": mailingName,
        "billingAddress": billingAddress,
        "countryIDFK": countryIdfk,
        "countryStatIDFK": countryStatIdfk,
        "taxability": taxability,
        "taxRegistrationType": taxRegistrationType,
        "dateOfTaxRegistration": dateOfTaxRegistration?.toIso8601String(),
        "taxRegistrationNo": taxRegistrationNo,
        "mobile": mobile,
        "phone": phone,
        "isActive": isActive,
        "openingBalance": openingBalance,
        "openingBalanceType": openingBalanceType,
        "currentBalance": currentBalance,
        "contactPerson": contactPerson,
        "creditDays": creditDays,
        "creditLimit": creditLimit,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "rowguid": rowguid,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "isEdit": isEdit,
        "ledgerCode": ledgerCode,
        "modifiedBy": modifiedBy,
        "contactNo": contactNo,
        "companyIDPK": companyIdpk,
        "defaultPaymentMode": defaultPaymentMode,
      };
}
