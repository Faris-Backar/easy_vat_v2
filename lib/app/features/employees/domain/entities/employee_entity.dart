class EmployeeEntity {
  String? employeeIdpk;
  String? employeeId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? departmentIdpk;
  String? designationIdpk;
  String? contactNumber;
  String? permanentAddress;
  String? gender;
  String? emailId;
  String? photoUrl;
  String? salaryType;
  String? remarks;
  String? companyIdpk;
  // List<DocumentEntity>? documents;
  // List<LedgerEntity>? ledger;

  EmployeeEntity({
    this.employeeIdpk,
    this.employeeId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.departmentIdpk,
    this.designationIdpk,
    this.contactNumber,
    this.permanentAddress,
    this.gender,
    this.emailId,
    this.photoUrl,
    this.salaryType,
    this.remarks,
    this.companyIdpk,
    // this.documents,
    // this.ledger,
  });
}

class DocumentEntity {
  String? documentsIdpk;
  String? documentsTranIdpk;
  String? documentTypeIdfk;
  String? documentNumber;
  String? referenceType;
  DateTime? issuedDate;
  DateTime? renewalDate;
  DateTime? expiryDate;

  DocumentEntity({
    this.documentsIdpk,
    this.documentsTranIdpk,
    this.documentTypeIdfk,
    this.documentNumber,
    this.referenceType,
    this.issuedDate,
    this.renewalDate,
    this.expiryDate,
  });
}

class LedgerEntity {
  String? ledgerIdpk;
  String? underIdfk;
  String? ledgerName;
  String? description;
  double? taxPercentage;
  String? mailingName;
  String? billingAddress;
  String? mobile;
  String? phone;
  bool? isActive;
  String? openingBalanceType;
  String? contactPerson;
  String? createdBy;
  DateTime? createdDate;
  DateTime? modifiedDate;
  bool? isEdit;
  String? ledgerCode;
  String? modifiedBy;
  String? contactNo;
  String? companyIdpk;
  String? defaultPaymentMode;

  LedgerEntity({
    this.ledgerIdpk,
    this.underIdfk,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.mobile,
    this.phone,
    this.isActive,
    this.openingBalanceType,
    this.contactPerson,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.isEdit,
    this.ledgerCode,
    this.modifiedBy,
    this.contactNo,
    this.companyIdpk,
    this.defaultPaymentMode,
  });
}
