import 'package:easy_vat_v2/app/features/employees/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  final int? basicSalary;
  EmployeeModel({
    super.employeeIdpk,
    super.employeeId,
    super.firstName,
    super.middleName,
    super.lastName,
    super.departmentIdpk,
    super.designationIdpk,
    super.contactNumber,
    super.permanentAddress,
    super.gender,
    super.emailId,
    super.photoUrl,
    super.salaryType,
    super.remarks,
    super.companyIdpk,
    // super.documents,
    // super.ledger,
    required this.basicSalary,
    // required this.additionalInfo,
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
        salaryType: json["salaryType"],
        basicSalary: json["basicSalary"],
        remarks: json["remarks"],
        companyIdpk: json["companyIDPK"],
      );
}

class DocumentModel extends DocumentEntity {
  DocumentModel({
    super.documentsIdpk,
    super.documentsTranIdpk,
    super.documentTypeIdfk,
    super.documentNumber,
    super.referenceType,
    super.issuedDate,
    super.renewalDate,
    super.expiryDate,
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
}

class LedgerModel extends LedgerEntity {
  final int? countryIdfk;
  final int? countryStatIdfk;
  final String? taxability;
  final String? taxRegistrationType;
  final DateTime? dateOfTaxRegistration;
  final String? taxRegistrationNo;
  final int? openingBalance;
  final int? currentBalance;
  final int? creditDays;
  final int? creditLimit;
  final String? rowguid;

  LedgerModel({
    super.ledgerIdpk,
    super.underIdfk,
    super.ledgerName,
    super.description,
    super.taxPercentage,
    super.mailingName,
    super.billingAddress,
    super.mobile,
    super.phone,
    super.isActive,
    super.openingBalanceType,
    super.contactPerson,
    super.createdBy,
    super.createdDate,
    super.modifiedDate,
    super.isEdit,
    super.ledgerCode,
    super.modifiedBy,
    super.contactNo,
    super.companyIdpk,
    super.defaultPaymentMode,
    required this.countryIdfk,
    required this.countryStatIdfk,
    required this.taxability,
    required this.taxRegistrationType,
    required this.dateOfTaxRegistration,
    required this.taxRegistrationNo,
    required this.openingBalance,
    required this.currentBalance,
    required this.creditDays,
    required this.creditLimit,
    required this.rowguid,
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
}
