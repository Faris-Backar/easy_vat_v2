// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInvoiceRequestModel _$SalesInvoiceRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SalesInvoiceRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SalesInvoiceRequestModel {
  String get saleIdpk => throw _privateConstructorUsedError;
  int get saleNo => throw _privateConstructorUsedError;
  String get saleMode => throw _privateConstructorUsedError;
  String get crLedgerIdfk => throw _privateConstructorUsedError;
  String get drLedgerIdfk => throw _privateConstructorUsedError;
  String get custemerIdfk => throw _privateConstructorUsedError;
  String get creditAccount => throw _privateConstructorUsedError;
  String get debitAccount => throw _privateConstructorUsedError;
  String get referenceNo => throw _privateConstructorUsedError;
  DateTime get saleDate => throw _privateConstructorUsedError;
  String get cashTrn => throw _privateConstructorUsedError;
  String get cashCustomerAddress => throw _privateConstructorUsedError;
  String get shippingAddress => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;
  String get lpoNo => throw _privateConstructorUsedError;
  String get doNo => throw _privateConstructorUsedError;
  String get diningArea => throw _privateConstructorUsedError;
  String get diningTable => throw _privateConstructorUsedError;
  String get quotationNo => throw _privateConstructorUsedError;
  String get requestNo => throw _privateConstructorUsedError;
  int get cashAmount => throw _privateConstructorUsedError;
  int get creditCardAmount => throw _privateConstructorUsedError;
  DateTime get actualSalesDate => throw _privateConstructorUsedError;
  String get vehicleNo => throw _privateConstructorUsedError;
  String get genaralNotes => throw _privateConstructorUsedError;
  String get salesOrderNo => throw _privateConstructorUsedError;
  String get soldBy => throw _privateConstructorUsedError;
  int get grossAmount => throw _privateConstructorUsedError;
  int get tax => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get netTotal => throw _privateConstructorUsedError;
  int get roundOff => throw _privateConstructorUsedError;
  int get amountTendered => throw _privateConstructorUsedError;
  String get deliveryBoy => throw _privateConstructorUsedError;
  bool get isEditable => throw _privateConstructorUsedError;
  bool get isCanceled => throw _privateConstructorUsedError;
  bool get isLockVoucher => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  String get modifiedBy => throw _privateConstructorUsedError;
  DateTime get modifiedDate => throw _privateConstructorUsedError;
  String get rowguid => throw _privateConstructorUsedError;
  bool get isPos => throw _privateConstructorUsedError;
  String get deliveryBoyIdpk => throw _privateConstructorUsedError;
  String get notesAndInstructions => throw _privateConstructorUsedError;
  String get drLedgerCashAccount => throw _privateConstructorUsedError;
  String get drLedgerBankAccount => throw _privateConstructorUsedError;
  String get orderType => throw _privateConstructorUsedError;
  int get deliveryCharge => throw _privateConstructorUsedError;
  List<SoldItem> get soldItems => throw _privateConstructorUsedError;

  /// Serializes this SalesInvoiceRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesInvoiceRequestModelCopyWith<SalesInvoiceRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInvoiceRequestModelCopyWith<$Res> {
  factory $SalesInvoiceRequestModelCopyWith(SalesInvoiceRequestModel value,
          $Res Function(SalesInvoiceRequestModel) then) =
      _$SalesInvoiceRequestModelCopyWithImpl<$Res, SalesInvoiceRequestModel>;
  @useResult
  $Res call(
      {String saleIdpk,
      int saleNo,
      String saleMode,
      String crLedgerIdfk,
      String drLedgerIdfk,
      String custemerIdfk,
      String creditAccount,
      String debitAccount,
      String referenceNo,
      DateTime saleDate,
      String cashTrn,
      String cashCustomerAddress,
      String shippingAddress,
      String customerName,
      String remarks,
      String lpoNo,
      String doNo,
      String diningArea,
      String diningTable,
      String quotationNo,
      String requestNo,
      int cashAmount,
      int creditCardAmount,
      DateTime actualSalesDate,
      String vehicleNo,
      String genaralNotes,
      String salesOrderNo,
      String soldBy,
      int grossAmount,
      int tax,
      int discount,
      int netTotal,
      int roundOff,
      int amountTendered,
      String deliveryBoy,
      bool isEditable,
      bool isCanceled,
      bool isLockVoucher,
      String createdBy,
      DateTime createdDate,
      String modifiedBy,
      DateTime modifiedDate,
      String rowguid,
      bool isPos,
      String deliveryBoyIdpk,
      String notesAndInstructions,
      String drLedgerCashAccount,
      String drLedgerBankAccount,
      String orderType,
      int deliveryCharge,
      List<SoldItem> soldItems});
}

/// @nodoc
class _$SalesInvoiceRequestModelCopyWithImpl<$Res,
        $Val extends SalesInvoiceRequestModel>
    implements $SalesInvoiceRequestModelCopyWith<$Res> {
  _$SalesInvoiceRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = null,
    Object? saleNo = null,
    Object? saleMode = null,
    Object? crLedgerIdfk = null,
    Object? drLedgerIdfk = null,
    Object? custemerIdfk = null,
    Object? creditAccount = null,
    Object? debitAccount = null,
    Object? referenceNo = null,
    Object? saleDate = null,
    Object? cashTrn = null,
    Object? cashCustomerAddress = null,
    Object? shippingAddress = null,
    Object? customerName = null,
    Object? remarks = null,
    Object? lpoNo = null,
    Object? doNo = null,
    Object? diningArea = null,
    Object? diningTable = null,
    Object? quotationNo = null,
    Object? requestNo = null,
    Object? cashAmount = null,
    Object? creditCardAmount = null,
    Object? actualSalesDate = null,
    Object? vehicleNo = null,
    Object? genaralNotes = null,
    Object? salesOrderNo = null,
    Object? soldBy = null,
    Object? grossAmount = null,
    Object? tax = null,
    Object? discount = null,
    Object? netTotal = null,
    Object? roundOff = null,
    Object? amountTendered = null,
    Object? deliveryBoy = null,
    Object? isEditable = null,
    Object? isCanceled = null,
    Object? isLockVoucher = null,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? modifiedBy = null,
    Object? modifiedDate = null,
    Object? rowguid = null,
    Object? isPos = null,
    Object? deliveryBoyIdpk = null,
    Object? notesAndInstructions = null,
    Object? drLedgerCashAccount = null,
    Object? drLedgerBankAccount = null,
    Object? orderType = null,
    Object? deliveryCharge = null,
    Object? soldItems = null,
  }) {
    return _then(_value.copyWith(
      saleIdpk: null == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      saleNo: null == saleNo
          ? _value.saleNo
          : saleNo // ignore: cast_nullable_to_non_nullable
              as int,
      saleMode: null == saleMode
          ? _value.saleMode
          : saleMode // ignore: cast_nullable_to_non_nullable
              as String,
      crLedgerIdfk: null == crLedgerIdfk
          ? _value.crLedgerIdfk
          : crLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerIdfk: null == drLedgerIdfk
          ? _value.drLedgerIdfk
          : drLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      custemerIdfk: null == custemerIdfk
          ? _value.custemerIdfk
          : custemerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      creditAccount: null == creditAccount
          ? _value.creditAccount
          : creditAccount // ignore: cast_nullable_to_non_nullable
              as String,
      debitAccount: null == debitAccount
          ? _value.debitAccount
          : debitAccount // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashTrn: null == cashTrn
          ? _value.cashTrn
          : cashTrn // ignore: cast_nullable_to_non_nullable
              as String,
      cashCustomerAddress: null == cashCustomerAddress
          ? _value.cashCustomerAddress
          : cashCustomerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      lpoNo: null == lpoNo
          ? _value.lpoNo
          : lpoNo // ignore: cast_nullable_to_non_nullable
              as String,
      doNo: null == doNo
          ? _value.doNo
          : doNo // ignore: cast_nullable_to_non_nullable
              as String,
      diningArea: null == diningArea
          ? _value.diningArea
          : diningArea // ignore: cast_nullable_to_non_nullable
              as String,
      diningTable: null == diningTable
          ? _value.diningTable
          : diningTable // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      requestNo: null == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String,
      cashAmount: null == cashAmount
          ? _value.cashAmount
          : cashAmount // ignore: cast_nullable_to_non_nullable
              as int,
      creditCardAmount: null == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      actualSalesDate: null == actualSalesDate
          ? _value.actualSalesDate
          : actualSalesDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vehicleNo: null == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String,
      genaralNotes: null == genaralNotes
          ? _value.genaralNotes
          : genaralNotes // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderNo: null == salesOrderNo
          ? _value.salesOrderNo
          : salesOrderNo // ignore: cast_nullable_to_non_nullable
              as String,
      soldBy: null == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int,
      roundOff: null == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
              as int,
      amountTendered: null == amountTendered
          ? _value.amountTendered
          : amountTendered // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryBoy: null == deliveryBoy
          ? _value.deliveryBoy
          : deliveryBoy // ignore: cast_nullable_to_non_nullable
              as String,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLockVoucher: null == isLockVoucher
          ? _value.isLockVoucher
          : isLockVoucher // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedBy: null == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rowguid: null == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String,
      isPos: null == isPos
          ? _value.isPos
          : isPos // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryBoyIdpk: null == deliveryBoyIdpk
          ? _value.deliveryBoyIdpk
          : deliveryBoyIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      notesAndInstructions: null == notesAndInstructions
          ? _value.notesAndInstructions
          : notesAndInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerCashAccount: null == drLedgerCashAccount
          ? _value.drLedgerCashAccount
          : drLedgerCashAccount // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerBankAccount: null == drLedgerBankAccount
          ? _value.drLedgerBankAccount
          : drLedgerBankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      soldItems: null == soldItems
          ? _value.soldItems
          : soldItems // ignore: cast_nullable_to_non_nullable
              as List<SoldItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInvoiceRequestModelImplCopyWith<$Res>
    implements $SalesInvoiceRequestModelCopyWith<$Res> {
  factory _$$SalesInvoiceRequestModelImplCopyWith(
          _$SalesInvoiceRequestModelImpl value,
          $Res Function(_$SalesInvoiceRequestModelImpl) then) =
      __$$SalesInvoiceRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String saleIdpk,
      int saleNo,
      String saleMode,
      String crLedgerIdfk,
      String drLedgerIdfk,
      String custemerIdfk,
      String creditAccount,
      String debitAccount,
      String referenceNo,
      DateTime saleDate,
      String cashTrn,
      String cashCustomerAddress,
      String shippingAddress,
      String customerName,
      String remarks,
      String lpoNo,
      String doNo,
      String diningArea,
      String diningTable,
      String quotationNo,
      String requestNo,
      int cashAmount,
      int creditCardAmount,
      DateTime actualSalesDate,
      String vehicleNo,
      String genaralNotes,
      String salesOrderNo,
      String soldBy,
      int grossAmount,
      int tax,
      int discount,
      int netTotal,
      int roundOff,
      int amountTendered,
      String deliveryBoy,
      bool isEditable,
      bool isCanceled,
      bool isLockVoucher,
      String createdBy,
      DateTime createdDate,
      String modifiedBy,
      DateTime modifiedDate,
      String rowguid,
      bool isPos,
      String deliveryBoyIdpk,
      String notesAndInstructions,
      String drLedgerCashAccount,
      String drLedgerBankAccount,
      String orderType,
      int deliveryCharge,
      List<SoldItem> soldItems});
}

/// @nodoc
class __$$SalesInvoiceRequestModelImplCopyWithImpl<$Res>
    extends _$SalesInvoiceRequestModelCopyWithImpl<$Res,
        _$SalesInvoiceRequestModelImpl>
    implements _$$SalesInvoiceRequestModelImplCopyWith<$Res> {
  __$$SalesInvoiceRequestModelImplCopyWithImpl(
      _$SalesInvoiceRequestModelImpl _value,
      $Res Function(_$SalesInvoiceRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = null,
    Object? saleNo = null,
    Object? saleMode = null,
    Object? crLedgerIdfk = null,
    Object? drLedgerIdfk = null,
    Object? custemerIdfk = null,
    Object? creditAccount = null,
    Object? debitAccount = null,
    Object? referenceNo = null,
    Object? saleDate = null,
    Object? cashTrn = null,
    Object? cashCustomerAddress = null,
    Object? shippingAddress = null,
    Object? customerName = null,
    Object? remarks = null,
    Object? lpoNo = null,
    Object? doNo = null,
    Object? diningArea = null,
    Object? diningTable = null,
    Object? quotationNo = null,
    Object? requestNo = null,
    Object? cashAmount = null,
    Object? creditCardAmount = null,
    Object? actualSalesDate = null,
    Object? vehicleNo = null,
    Object? genaralNotes = null,
    Object? salesOrderNo = null,
    Object? soldBy = null,
    Object? grossAmount = null,
    Object? tax = null,
    Object? discount = null,
    Object? netTotal = null,
    Object? roundOff = null,
    Object? amountTendered = null,
    Object? deliveryBoy = null,
    Object? isEditable = null,
    Object? isCanceled = null,
    Object? isLockVoucher = null,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? modifiedBy = null,
    Object? modifiedDate = null,
    Object? rowguid = null,
    Object? isPos = null,
    Object? deliveryBoyIdpk = null,
    Object? notesAndInstructions = null,
    Object? drLedgerCashAccount = null,
    Object? drLedgerBankAccount = null,
    Object? orderType = null,
    Object? deliveryCharge = null,
    Object? soldItems = null,
  }) {
    return _then(_$SalesInvoiceRequestModelImpl(
      saleIdpk: null == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      saleNo: null == saleNo
          ? _value.saleNo
          : saleNo // ignore: cast_nullable_to_non_nullable
              as int,
      saleMode: null == saleMode
          ? _value.saleMode
          : saleMode // ignore: cast_nullable_to_non_nullable
              as String,
      crLedgerIdfk: null == crLedgerIdfk
          ? _value.crLedgerIdfk
          : crLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerIdfk: null == drLedgerIdfk
          ? _value.drLedgerIdfk
          : drLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      custemerIdfk: null == custemerIdfk
          ? _value.custemerIdfk
          : custemerIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      creditAccount: null == creditAccount
          ? _value.creditAccount
          : creditAccount // ignore: cast_nullable_to_non_nullable
              as String,
      debitAccount: null == debitAccount
          ? _value.debitAccount
          : debitAccount // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashTrn: null == cashTrn
          ? _value.cashTrn
          : cashTrn // ignore: cast_nullable_to_non_nullable
              as String,
      cashCustomerAddress: null == cashCustomerAddress
          ? _value.cashCustomerAddress
          : cashCustomerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      lpoNo: null == lpoNo
          ? _value.lpoNo
          : lpoNo // ignore: cast_nullable_to_non_nullable
              as String,
      doNo: null == doNo
          ? _value.doNo
          : doNo // ignore: cast_nullable_to_non_nullable
              as String,
      diningArea: null == diningArea
          ? _value.diningArea
          : diningArea // ignore: cast_nullable_to_non_nullable
              as String,
      diningTable: null == diningTable
          ? _value.diningTable
          : diningTable // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      requestNo: null == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String,
      cashAmount: null == cashAmount
          ? _value.cashAmount
          : cashAmount // ignore: cast_nullable_to_non_nullable
              as int,
      creditCardAmount: null == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      actualSalesDate: null == actualSalesDate
          ? _value.actualSalesDate
          : actualSalesDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vehicleNo: null == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String,
      genaralNotes: null == genaralNotes
          ? _value.genaralNotes
          : genaralNotes // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderNo: null == salesOrderNo
          ? _value.salesOrderNo
          : salesOrderNo // ignore: cast_nullable_to_non_nullable
              as String,
      soldBy: null == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int,
      roundOff: null == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
              as int,
      amountTendered: null == amountTendered
          ? _value.amountTendered
          : amountTendered // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryBoy: null == deliveryBoy
          ? _value.deliveryBoy
          : deliveryBoy // ignore: cast_nullable_to_non_nullable
              as String,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLockVoucher: null == isLockVoucher
          ? _value.isLockVoucher
          : isLockVoucher // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedBy: null == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rowguid: null == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String,
      isPos: null == isPos
          ? _value.isPos
          : isPos // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryBoyIdpk: null == deliveryBoyIdpk
          ? _value.deliveryBoyIdpk
          : deliveryBoyIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      notesAndInstructions: null == notesAndInstructions
          ? _value.notesAndInstructions
          : notesAndInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerCashAccount: null == drLedgerCashAccount
          ? _value.drLedgerCashAccount
          : drLedgerCashAccount // ignore: cast_nullable_to_non_nullable
              as String,
      drLedgerBankAccount: null == drLedgerBankAccount
          ? _value.drLedgerBankAccount
          : drLedgerBankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      soldItems: null == soldItems
          ? _value._soldItems
          : soldItems // ignore: cast_nullable_to_non_nullable
              as List<SoldItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInvoiceRequestModelImpl implements _SalesInvoiceRequestModel {
  const _$SalesInvoiceRequestModelImpl(
      {required this.saleIdpk,
      required this.saleNo,
      required this.saleMode,
      required this.crLedgerIdfk,
      required this.drLedgerIdfk,
      required this.custemerIdfk,
      required this.creditAccount,
      required this.debitAccount,
      required this.referenceNo,
      required this.saleDate,
      required this.cashTrn,
      required this.cashCustomerAddress,
      required this.shippingAddress,
      required this.customerName,
      required this.remarks,
      required this.lpoNo,
      required this.doNo,
      required this.diningArea,
      required this.diningTable,
      required this.quotationNo,
      required this.requestNo,
      required this.cashAmount,
      required this.creditCardAmount,
      required this.actualSalesDate,
      required this.vehicleNo,
      required this.genaralNotes,
      required this.salesOrderNo,
      required this.soldBy,
      required this.grossAmount,
      required this.tax,
      required this.discount,
      required this.netTotal,
      required this.roundOff,
      required this.amountTendered,
      required this.deliveryBoy,
      required this.isEditable,
      required this.isCanceled,
      required this.isLockVoucher,
      required this.createdBy,
      required this.createdDate,
      required this.modifiedBy,
      required this.modifiedDate,
      required this.rowguid,
      required this.isPos,
      required this.deliveryBoyIdpk,
      required this.notesAndInstructions,
      required this.drLedgerCashAccount,
      required this.drLedgerBankAccount,
      required this.orderType,
      required this.deliveryCharge,
      required final List<SoldItem> soldItems})
      : _soldItems = soldItems;

  factory _$SalesInvoiceRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInvoiceRequestModelImplFromJson(json);

  @override
  final String saleIdpk;
  @override
  final int saleNo;
  @override
  final String saleMode;
  @override
  final String crLedgerIdfk;
  @override
  final String drLedgerIdfk;
  @override
  final String custemerIdfk;
  @override
  final String creditAccount;
  @override
  final String debitAccount;
  @override
  final String referenceNo;
  @override
  final DateTime saleDate;
  @override
  final String cashTrn;
  @override
  final String cashCustomerAddress;
  @override
  final String shippingAddress;
  @override
  final String customerName;
  @override
  final String remarks;
  @override
  final String lpoNo;
  @override
  final String doNo;
  @override
  final String diningArea;
  @override
  final String diningTable;
  @override
  final String quotationNo;
  @override
  final String requestNo;
  @override
  final int cashAmount;
  @override
  final int creditCardAmount;
  @override
  final DateTime actualSalesDate;
  @override
  final String vehicleNo;
  @override
  final String genaralNotes;
  @override
  final String salesOrderNo;
  @override
  final String soldBy;
  @override
  final int grossAmount;
  @override
  final int tax;
  @override
  final int discount;
  @override
  final int netTotal;
  @override
  final int roundOff;
  @override
  final int amountTendered;
  @override
  final String deliveryBoy;
  @override
  final bool isEditable;
  @override
  final bool isCanceled;
  @override
  final bool isLockVoucher;
  @override
  final String createdBy;
  @override
  final DateTime createdDate;
  @override
  final String modifiedBy;
  @override
  final DateTime modifiedDate;
  @override
  final String rowguid;
  @override
  final bool isPos;
  @override
  final String deliveryBoyIdpk;
  @override
  final String notesAndInstructions;
  @override
  final String drLedgerCashAccount;
  @override
  final String drLedgerBankAccount;
  @override
  final String orderType;
  @override
  final int deliveryCharge;
  final List<SoldItem> _soldItems;
  @override
  List<SoldItem> get soldItems {
    if (_soldItems is EqualUnmodifiableListView) return _soldItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soldItems);
  }

  @override
  String toString() {
    return 'SalesInvoiceRequestModel(saleIdpk: $saleIdpk, saleNo: $saleNo, saleMode: $saleMode, crLedgerIdfk: $crLedgerIdfk, drLedgerIdfk: $drLedgerIdfk, custemerIdfk: $custemerIdfk, creditAccount: $creditAccount, debitAccount: $debitAccount, referenceNo: $referenceNo, saleDate: $saleDate, cashTrn: $cashTrn, cashCustomerAddress: $cashCustomerAddress, shippingAddress: $shippingAddress, customerName: $customerName, remarks: $remarks, lpoNo: $lpoNo, doNo: $doNo, diningArea: $diningArea, diningTable: $diningTable, quotationNo: $quotationNo, requestNo: $requestNo, cashAmount: $cashAmount, creditCardAmount: $creditCardAmount, actualSalesDate: $actualSalesDate, vehicleNo: $vehicleNo, genaralNotes: $genaralNotes, salesOrderNo: $salesOrderNo, soldBy: $soldBy, grossAmount: $grossAmount, tax: $tax, discount: $discount, netTotal: $netTotal, roundOff: $roundOff, amountTendered: $amountTendered, deliveryBoy: $deliveryBoy, isEditable: $isEditable, isCanceled: $isCanceled, isLockVoucher: $isLockVoucher, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, isPos: $isPos, deliveryBoyIdpk: $deliveryBoyIdpk, notesAndInstructions: $notesAndInstructions, drLedgerCashAccount: $drLedgerCashAccount, drLedgerBankAccount: $drLedgerBankAccount, orderType: $orderType, deliveryCharge: $deliveryCharge, soldItems: $soldItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInvoiceRequestModelImpl &&
            (identical(other.saleIdpk, saleIdpk) ||
                other.saleIdpk == saleIdpk) &&
            (identical(other.saleNo, saleNo) || other.saleNo == saleNo) &&
            (identical(other.saleMode, saleMode) ||
                other.saleMode == saleMode) &&
            (identical(other.crLedgerIdfk, crLedgerIdfk) ||
                other.crLedgerIdfk == crLedgerIdfk) &&
            (identical(other.drLedgerIdfk, drLedgerIdfk) ||
                other.drLedgerIdfk == drLedgerIdfk) &&
            (identical(other.custemerIdfk, custemerIdfk) ||
                other.custemerIdfk == custemerIdfk) &&
            (identical(other.creditAccount, creditAccount) ||
                other.creditAccount == creditAccount) &&
            (identical(other.debitAccount, debitAccount) ||
                other.debitAccount == debitAccount) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.cashTrn, cashTrn) || other.cashTrn == cashTrn) &&
            (identical(other.cashCustomerAddress, cashCustomerAddress) ||
                other.cashCustomerAddress == cashCustomerAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.lpoNo, lpoNo) || other.lpoNo == lpoNo) &&
            (identical(other.doNo, doNo) || other.doNo == doNo) &&
            (identical(other.diningArea, diningArea) ||
                other.diningArea == diningArea) &&
            (identical(other.diningTable, diningTable) ||
                other.diningTable == diningTable) &&
            (identical(other.quotationNo, quotationNo) ||
                other.quotationNo == quotationNo) &&
            (identical(other.requestNo, requestNo) ||
                other.requestNo == requestNo) &&
            (identical(other.cashAmount, cashAmount) ||
                other.cashAmount == cashAmount) &&
            (identical(other.creditCardAmount, creditCardAmount) ||
                other.creditCardAmount == creditCardAmount) &&
            (identical(other.actualSalesDate, actualSalesDate) ||
                other.actualSalesDate == actualSalesDate) &&
            (identical(other.vehicleNo, vehicleNo) ||
                other.vehicleNo == vehicleNo) &&
            (identical(other.genaralNotes, genaralNotes) ||
                other.genaralNotes == genaralNotes) &&
            (identical(other.salesOrderNo, salesOrderNo) ||
                other.salesOrderNo == salesOrderNo) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.roundOff, roundOff) ||
                other.roundOff == roundOff) &&
            (identical(other.amountTendered, amountTendered) ||
                other.amountTendered == amountTendered) &&
            (identical(other.deliveryBoy, deliveryBoy) ||
                other.deliveryBoy == deliveryBoy) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled) &&
            (identical(other.isLockVoucher, isLockVoucher) ||
                other.isLockVoucher == isLockVoucher) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid) &&
            (identical(other.isPos, isPos) || other.isPos == isPos) &&
            (identical(other.deliveryBoyIdpk, deliveryBoyIdpk) ||
                other.deliveryBoyIdpk == deliveryBoyIdpk) &&
            (identical(other.notesAndInstructions, notesAndInstructions) ||
                other.notesAndInstructions == notesAndInstructions) &&
            (identical(other.drLedgerCashAccount, drLedgerCashAccount) ||
                other.drLedgerCashAccount == drLedgerCashAccount) &&
            (identical(other.drLedgerBankAccount, drLedgerBankAccount) ||
                other.drLedgerBankAccount == drLedgerBankAccount) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            const DeepCollectionEquality()
                .equals(other._soldItems, _soldItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        saleIdpk,
        saleNo,
        saleMode,
        crLedgerIdfk,
        drLedgerIdfk,
        custemerIdfk,
        creditAccount,
        debitAccount,
        referenceNo,
        saleDate,
        cashTrn,
        cashCustomerAddress,
        shippingAddress,
        customerName,
        remarks,
        lpoNo,
        doNo,
        diningArea,
        diningTable,
        quotationNo,
        requestNo,
        cashAmount,
        creditCardAmount,
        actualSalesDate,
        vehicleNo,
        genaralNotes,
        salesOrderNo,
        soldBy,
        grossAmount,
        tax,
        discount,
        netTotal,
        roundOff,
        amountTendered,
        deliveryBoy,
        isEditable,
        isCanceled,
        isLockVoucher,
        createdBy,
        createdDate,
        modifiedBy,
        modifiedDate,
        rowguid,
        isPos,
        deliveryBoyIdpk,
        notesAndInstructions,
        drLedgerCashAccount,
        drLedgerBankAccount,
        orderType,
        deliveryCharge,
        const DeepCollectionEquality().hash(_soldItems)
      ]);

  /// Create a copy of SalesInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInvoiceRequestModelImplCopyWith<_$SalesInvoiceRequestModelImpl>
      get copyWith => __$$SalesInvoiceRequestModelImplCopyWithImpl<
          _$SalesInvoiceRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInvoiceRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SalesInvoiceRequestModel implements SalesInvoiceRequestModel {
  const factory _SalesInvoiceRequestModel(
          {required final String saleIdpk,
          required final int saleNo,
          required final String saleMode,
          required final String crLedgerIdfk,
          required final String drLedgerIdfk,
          required final String custemerIdfk,
          required final String creditAccount,
          required final String debitAccount,
          required final String referenceNo,
          required final DateTime saleDate,
          required final String cashTrn,
          required final String cashCustomerAddress,
          required final String shippingAddress,
          required final String customerName,
          required final String remarks,
          required final String lpoNo,
          required final String doNo,
          required final String diningArea,
          required final String diningTable,
          required final String quotationNo,
          required final String requestNo,
          required final int cashAmount,
          required final int creditCardAmount,
          required final DateTime actualSalesDate,
          required final String vehicleNo,
          required final String genaralNotes,
          required final String salesOrderNo,
          required final String soldBy,
          required final int grossAmount,
          required final int tax,
          required final int discount,
          required final int netTotal,
          required final int roundOff,
          required final int amountTendered,
          required final String deliveryBoy,
          required final bool isEditable,
          required final bool isCanceled,
          required final bool isLockVoucher,
          required final String createdBy,
          required final DateTime createdDate,
          required final String modifiedBy,
          required final DateTime modifiedDate,
          required final String rowguid,
          required final bool isPos,
          required final String deliveryBoyIdpk,
          required final String notesAndInstructions,
          required final String drLedgerCashAccount,
          required final String drLedgerBankAccount,
          required final String orderType,
          required final int deliveryCharge,
          required final List<SoldItem> soldItems}) =
      _$SalesInvoiceRequestModelImpl;

  factory _SalesInvoiceRequestModel.fromJson(Map<String, dynamic> json) =
      _$SalesInvoiceRequestModelImpl.fromJson;

  @override
  String get saleIdpk;
  @override
  int get saleNo;
  @override
  String get saleMode;
  @override
  String get crLedgerIdfk;
  @override
  String get drLedgerIdfk;
  @override
  String get custemerIdfk;
  @override
  String get creditAccount;
  @override
  String get debitAccount;
  @override
  String get referenceNo;
  @override
  DateTime get saleDate;
  @override
  String get cashTrn;
  @override
  String get cashCustomerAddress;
  @override
  String get shippingAddress;
  @override
  String get customerName;
  @override
  String get remarks;
  @override
  String get lpoNo;
  @override
  String get doNo;
  @override
  String get diningArea;
  @override
  String get diningTable;
  @override
  String get quotationNo;
  @override
  String get requestNo;
  @override
  int get cashAmount;
  @override
  int get creditCardAmount;
  @override
  DateTime get actualSalesDate;
  @override
  String get vehicleNo;
  @override
  String get genaralNotes;
  @override
  String get salesOrderNo;
  @override
  String get soldBy;
  @override
  int get grossAmount;
  @override
  int get tax;
  @override
  int get discount;
  @override
  int get netTotal;
  @override
  int get roundOff;
  @override
  int get amountTendered;
  @override
  String get deliveryBoy;
  @override
  bool get isEditable;
  @override
  bool get isCanceled;
  @override
  bool get isLockVoucher;
  @override
  String get createdBy;
  @override
  DateTime get createdDate;
  @override
  String get modifiedBy;
  @override
  DateTime get modifiedDate;
  @override
  String get rowguid;
  @override
  bool get isPos;
  @override
  String get deliveryBoyIdpk;
  @override
  String get notesAndInstructions;
  @override
  String get drLedgerCashAccount;
  @override
  String get drLedgerBankAccount;
  @override
  String get orderType;
  @override
  int get deliveryCharge;
  @override
  List<SoldItem> get soldItems;

  /// Create a copy of SalesInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesInvoiceRequestModelImplCopyWith<_$SalesInvoiceRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SoldItem _$SoldItemFromJson(Map<String, dynamic> json) {
  return _SoldItem.fromJson(json);
}

/// @nodoc
mixin _$SoldItem {
  String get saleIdpk => throw _privateConstructorUsedError;
  String get itemIdpk => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  String get itemCode => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get actualQty => throw _privateConstructorUsedError;
  int get billedQty => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;
  int get sellingPrice => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get grossTotal => throw _privateConstructorUsedError;
  int get taxAmount => throw _privateConstructorUsedError;
  int get taxPercentage => throw _privateConstructorUsedError;
  int get netTotal => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  int get profit => throw _privateConstructorUsedError;
  int get profitPercentage => throw _privateConstructorUsedError;
  bool get isSent => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  String get storeIdfk => throw _privateConstructorUsedError;
  String get projectIdpk => throw _privateConstructorUsedError;
  String get quotationIdpk => throw _privateConstructorUsedError;
  String get salesOrderIdpk => throw _privateConstructorUsedError;
  String get deliveryNoteIdpk => throw _privateConstructorUsedError;
  String get importId => throw _privateConstructorUsedError;
  String get rowguid => throw _privateConstructorUsedError;

  /// Serializes this SoldItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoldItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoldItemCopyWith<SoldItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoldItemCopyWith<$Res> {
  factory $SoldItemCopyWith(SoldItem value, $Res Function(SoldItem) then) =
      _$SoldItemCopyWithImpl<$Res, SoldItem>;
  @useResult
  $Res call(
      {String saleIdpk,
      String itemIdpk,
      String barcode,
      String itemCode,
      String itemName,
      String description,
      String unit,
      int actualQty,
      int billedQty,
      int cost,
      int sellingPrice,
      int discount,
      int grossTotal,
      int taxAmount,
      int taxPercentage,
      int netTotal,
      int currentStock,
      int profit,
      int profitPercentage,
      bool isSent,
      DateTime expiryDate,
      String storeIdfk,
      String projectIdpk,
      String quotationIdpk,
      String salesOrderIdpk,
      String deliveryNoteIdpk,
      String importId,
      String rowguid});
}

/// @nodoc
class _$SoldItemCopyWithImpl<$Res, $Val extends SoldItem>
    implements $SoldItemCopyWith<$Res> {
  _$SoldItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoldItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = null,
    Object? itemIdpk = null,
    Object? barcode = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? description = null,
    Object? unit = null,
    Object? actualQty = null,
    Object? billedQty = null,
    Object? cost = null,
    Object? sellingPrice = null,
    Object? discount = null,
    Object? grossTotal = null,
    Object? taxAmount = null,
    Object? taxPercentage = null,
    Object? netTotal = null,
    Object? currentStock = null,
    Object? profit = null,
    Object? profitPercentage = null,
    Object? isSent = null,
    Object? expiryDate = null,
    Object? storeIdfk = null,
    Object? projectIdpk = null,
    Object? quotationIdpk = null,
    Object? salesOrderIdpk = null,
    Object? deliveryNoteIdpk = null,
    Object? importId = null,
    Object? rowguid = null,
  }) {
    return _then(_value.copyWith(
      saleIdpk: null == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      itemIdpk: null == itemIdpk
          ? _value.itemIdpk
          : itemIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      itemCode: null == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      actualQty: null == actualQty
          ? _value.actualQty
          : actualQty // ignore: cast_nullable_to_non_nullable
              as int,
      billedQty: null == billedQty
          ? _value.billedQty
          : billedQty // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as int,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int,
      profitPercentage: null == profitPercentage
          ? _value.profitPercentage
          : profitPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeIdfk: null == storeIdfk
          ? _value.storeIdfk
          : storeIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      projectIdpk: null == projectIdpk
          ? _value.projectIdpk
          : projectIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      quotationIdpk: null == quotationIdpk
          ? _value.quotationIdpk
          : quotationIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderIdpk: null == salesOrderIdpk
          ? _value.salesOrderIdpk
          : salesOrderIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNoteIdpk: null == deliveryNoteIdpk
          ? _value.deliveryNoteIdpk
          : deliveryNoteIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      importId: null == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String,
      rowguid: null == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoldItemImplCopyWith<$Res>
    implements $SoldItemCopyWith<$Res> {
  factory _$$SoldItemImplCopyWith(
          _$SoldItemImpl value, $Res Function(_$SoldItemImpl) then) =
      __$$SoldItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String saleIdpk,
      String itemIdpk,
      String barcode,
      String itemCode,
      String itemName,
      String description,
      String unit,
      int actualQty,
      int billedQty,
      int cost,
      int sellingPrice,
      int discount,
      int grossTotal,
      int taxAmount,
      int taxPercentage,
      int netTotal,
      int currentStock,
      int profit,
      int profitPercentage,
      bool isSent,
      DateTime expiryDate,
      String storeIdfk,
      String projectIdpk,
      String quotationIdpk,
      String salesOrderIdpk,
      String deliveryNoteIdpk,
      String importId,
      String rowguid});
}

/// @nodoc
class __$$SoldItemImplCopyWithImpl<$Res>
    extends _$SoldItemCopyWithImpl<$Res, _$SoldItemImpl>
    implements _$$SoldItemImplCopyWith<$Res> {
  __$$SoldItemImplCopyWithImpl(
      _$SoldItemImpl _value, $Res Function(_$SoldItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoldItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = null,
    Object? itemIdpk = null,
    Object? barcode = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? description = null,
    Object? unit = null,
    Object? actualQty = null,
    Object? billedQty = null,
    Object? cost = null,
    Object? sellingPrice = null,
    Object? discount = null,
    Object? grossTotal = null,
    Object? taxAmount = null,
    Object? taxPercentage = null,
    Object? netTotal = null,
    Object? currentStock = null,
    Object? profit = null,
    Object? profitPercentage = null,
    Object? isSent = null,
    Object? expiryDate = null,
    Object? storeIdfk = null,
    Object? projectIdpk = null,
    Object? quotationIdpk = null,
    Object? salesOrderIdpk = null,
    Object? deliveryNoteIdpk = null,
    Object? importId = null,
    Object? rowguid = null,
  }) {
    return _then(_$SoldItemImpl(
      saleIdpk: null == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      itemIdpk: null == itemIdpk
          ? _value.itemIdpk
          : itemIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      itemCode: null == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      actualQty: null == actualQty
          ? _value.actualQty
          : actualQty // ignore: cast_nullable_to_non_nullable
              as int,
      billedQty: null == billedQty
          ? _value.billedQty
          : billedQty // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as int,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int,
      profitPercentage: null == profitPercentage
          ? _value.profitPercentage
          : profitPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeIdfk: null == storeIdfk
          ? _value.storeIdfk
          : storeIdfk // ignore: cast_nullable_to_non_nullable
              as String,
      projectIdpk: null == projectIdpk
          ? _value.projectIdpk
          : projectIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      quotationIdpk: null == quotationIdpk
          ? _value.quotationIdpk
          : quotationIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderIdpk: null == salesOrderIdpk
          ? _value.salesOrderIdpk
          : salesOrderIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNoteIdpk: null == deliveryNoteIdpk
          ? _value.deliveryNoteIdpk
          : deliveryNoteIdpk // ignore: cast_nullable_to_non_nullable
              as String,
      importId: null == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String,
      rowguid: null == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoldItemImpl implements _SoldItem {
  const _$SoldItemImpl(
      {required this.saleIdpk,
      required this.itemIdpk,
      required this.barcode,
      required this.itemCode,
      required this.itemName,
      required this.description,
      required this.unit,
      required this.actualQty,
      required this.billedQty,
      required this.cost,
      required this.sellingPrice,
      required this.discount,
      required this.grossTotal,
      required this.taxAmount,
      required this.taxPercentage,
      required this.netTotal,
      required this.currentStock,
      required this.profit,
      required this.profitPercentage,
      required this.isSent,
      required this.expiryDate,
      required this.storeIdfk,
      required this.projectIdpk,
      required this.quotationIdpk,
      required this.salesOrderIdpk,
      required this.deliveryNoteIdpk,
      required this.importId,
      required this.rowguid});

  factory _$SoldItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoldItemImplFromJson(json);

  @override
  final String saleIdpk;
  @override
  final String itemIdpk;
  @override
  final String barcode;
  @override
  final String itemCode;
  @override
  final String itemName;
  @override
  final String description;
  @override
  final String unit;
  @override
  final int actualQty;
  @override
  final int billedQty;
  @override
  final int cost;
  @override
  final int sellingPrice;
  @override
  final int discount;
  @override
  final int grossTotal;
  @override
  final int taxAmount;
  @override
  final int taxPercentage;
  @override
  final int netTotal;
  @override
  final int currentStock;
  @override
  final int profit;
  @override
  final int profitPercentage;
  @override
  final bool isSent;
  @override
  final DateTime expiryDate;
  @override
  final String storeIdfk;
  @override
  final String projectIdpk;
  @override
  final String quotationIdpk;
  @override
  final String salesOrderIdpk;
  @override
  final String deliveryNoteIdpk;
  @override
  final String importId;
  @override
  final String rowguid;

  @override
  String toString() {
    return 'SoldItem(saleIdpk: $saleIdpk, itemIdpk: $itemIdpk, barcode: $barcode, itemCode: $itemCode, itemName: $itemName, description: $description, unit: $unit, actualQty: $actualQty, billedQty: $billedQty, cost: $cost, sellingPrice: $sellingPrice, discount: $discount, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, netTotal: $netTotal, currentStock: $currentStock, profit: $profit, profitPercentage: $profitPercentage, isSent: $isSent, expiryDate: $expiryDate, storeIdfk: $storeIdfk, projectIdpk: $projectIdpk, quotationIdpk: $quotationIdpk, salesOrderIdpk: $salesOrderIdpk, deliveryNoteIdpk: $deliveryNoteIdpk, importId: $importId, rowguid: $rowguid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoldItemImpl &&
            (identical(other.saleIdpk, saleIdpk) ||
                other.saleIdpk == saleIdpk) &&
            (identical(other.itemIdpk, itemIdpk) ||
                other.itemIdpk == itemIdpk) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.actualQty, actualQty) ||
                other.actualQty == actualQty) &&
            (identical(other.billedQty, billedQty) ||
                other.billedQty == billedQty) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.grossTotal, grossTotal) ||
                other.grossTotal == grossTotal) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.currentStock, currentStock) ||
                other.currentStock == currentStock) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercentage, profitPercentage) ||
                other.profitPercentage == profitPercentage) &&
            (identical(other.isSent, isSent) || other.isSent == isSent) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.storeIdfk, storeIdfk) ||
                other.storeIdfk == storeIdfk) &&
            (identical(other.projectIdpk, projectIdpk) ||
                other.projectIdpk == projectIdpk) &&
            (identical(other.quotationIdpk, quotationIdpk) ||
                other.quotationIdpk == quotationIdpk) &&
            (identical(other.salesOrderIdpk, salesOrderIdpk) ||
                other.salesOrderIdpk == salesOrderIdpk) &&
            (identical(other.deliveryNoteIdpk, deliveryNoteIdpk) ||
                other.deliveryNoteIdpk == deliveryNoteIdpk) &&
            (identical(other.importId, importId) ||
                other.importId == importId) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        saleIdpk,
        itemIdpk,
        barcode,
        itemCode,
        itemName,
        description,
        unit,
        actualQty,
        billedQty,
        cost,
        sellingPrice,
        discount,
        grossTotal,
        taxAmount,
        taxPercentage,
        netTotal,
        currentStock,
        profit,
        profitPercentage,
        isSent,
        expiryDate,
        storeIdfk,
        projectIdpk,
        quotationIdpk,
        salesOrderIdpk,
        deliveryNoteIdpk,
        importId,
        rowguid
      ]);

  /// Create a copy of SoldItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoldItemImplCopyWith<_$SoldItemImpl> get copyWith =>
      __$$SoldItemImplCopyWithImpl<_$SoldItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoldItemImplToJson(
      this,
    );
  }
}

abstract class _SoldItem implements SoldItem {
  const factory _SoldItem(
      {required final String saleIdpk,
      required final String itemIdpk,
      required final String barcode,
      required final String itemCode,
      required final String itemName,
      required final String description,
      required final String unit,
      required final int actualQty,
      required final int billedQty,
      required final int cost,
      required final int sellingPrice,
      required final int discount,
      required final int grossTotal,
      required final int taxAmount,
      required final int taxPercentage,
      required final int netTotal,
      required final int currentStock,
      required final int profit,
      required final int profitPercentage,
      required final bool isSent,
      required final DateTime expiryDate,
      required final String storeIdfk,
      required final String projectIdpk,
      required final String quotationIdpk,
      required final String salesOrderIdpk,
      required final String deliveryNoteIdpk,
      required final String importId,
      required final String rowguid}) = _$SoldItemImpl;

  factory _SoldItem.fromJson(Map<String, dynamic> json) =
      _$SoldItemImpl.fromJson;

  @override
  String get saleIdpk;
  @override
  String get itemIdpk;
  @override
  String get barcode;
  @override
  String get itemCode;
  @override
  String get itemName;
  @override
  String get description;
  @override
  String get unit;
  @override
  int get actualQty;
  @override
  int get billedQty;
  @override
  int get cost;
  @override
  int get sellingPrice;
  @override
  int get discount;
  @override
  int get grossTotal;
  @override
  int get taxAmount;
  @override
  int get taxPercentage;
  @override
  int get netTotal;
  @override
  int get currentStock;
  @override
  int get profit;
  @override
  int get profitPercentage;
  @override
  bool get isSent;
  @override
  DateTime get expiryDate;
  @override
  String get storeIdfk;
  @override
  String get projectIdpk;
  @override
  String get quotationIdpk;
  @override
  String get salesOrderIdpk;
  @override
  String get deliveryNoteIdpk;
  @override
  String get importId;
  @override
  String get rowguid;

  /// Create a copy of SoldItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoldItemImplCopyWith<_$SoldItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
