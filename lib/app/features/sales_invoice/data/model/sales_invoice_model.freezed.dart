// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInvoiceModel _$SalesInvoiceModelFromJson(Map<String, dynamic> json) {
  return _SalesInvoiceModel.fromJson(json);
}

/// @nodoc
mixin _$SalesInvoiceModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<SalesListModel>? get salesList => throw _privateConstructorUsedError;

  /// Serializes this SalesInvoiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesInvoiceModelCopyWith<SalesInvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInvoiceModelCopyWith<$Res> {
  factory $SalesInvoiceModelCopyWith(
          SalesInvoiceModel value, $Res Function(SalesInvoiceModel) then) =
      _$SalesInvoiceModelCopyWithImpl<$Res, SalesInvoiceModel>;
  @useResult
  $Res call({bool? status, String? message, List<SalesListModel>? salesList});
}

/// @nodoc
class _$SalesInvoiceModelCopyWithImpl<$Res, $Val extends SalesInvoiceModel>
    implements $SalesInvoiceModelCopyWith<$Res> {
  _$SalesInvoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? salesList = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      salesList: freezed == salesList
          ? _value.salesList
          : salesList // ignore: cast_nullable_to_non_nullable
              as List<SalesListModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInvoiceModelImplCopyWith<$Res>
    implements $SalesInvoiceModelCopyWith<$Res> {
  factory _$$SalesInvoiceModelImplCopyWith(_$SalesInvoiceModelImpl value,
          $Res Function(_$SalesInvoiceModelImpl) then) =
      __$$SalesInvoiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, List<SalesListModel>? salesList});
}

/// @nodoc
class __$$SalesInvoiceModelImplCopyWithImpl<$Res>
    extends _$SalesInvoiceModelCopyWithImpl<$Res, _$SalesInvoiceModelImpl>
    implements _$$SalesInvoiceModelImplCopyWith<$Res> {
  __$$SalesInvoiceModelImplCopyWithImpl(_$SalesInvoiceModelImpl _value,
      $Res Function(_$SalesInvoiceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? salesList = freezed,
  }) {
    return _then(_$SalesInvoiceModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      salesList: freezed == salesList
          ? _value._salesList
          : salesList // ignore: cast_nullable_to_non_nullable
              as List<SalesListModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInvoiceModelImpl implements _SalesInvoiceModel {
  const _$SalesInvoiceModelImpl(
      {this.status, this.message, final List<SalesListModel>? salesList})
      : _salesList = salesList;

  factory _$SalesInvoiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInvoiceModelImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  final List<SalesListModel>? _salesList;
  @override
  List<SalesListModel>? get salesList {
    final value = _salesList;
    if (value == null) return null;
    if (_salesList is EqualUnmodifiableListView) return _salesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SalesInvoiceModel(status: $status, message: $message, salesList: $salesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInvoiceModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._salesList, _salesList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_salesList));

  /// Create a copy of SalesInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInvoiceModelImplCopyWith<_$SalesInvoiceModelImpl> get copyWith =>
      __$$SalesInvoiceModelImplCopyWithImpl<_$SalesInvoiceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInvoiceModelImplToJson(
      this,
    );
  }
}

abstract class _SalesInvoiceModel implements SalesInvoiceModel {
  const factory _SalesInvoiceModel(
      {final bool? status,
      final String? message,
      final List<SalesListModel>? salesList}) = _$SalesInvoiceModelImpl;

  factory _SalesInvoiceModel.fromJson(Map<String, dynamic> json) =
      _$SalesInvoiceModelImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  List<SalesListModel>? get salesList;

  /// Create a copy of SalesInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesInvoiceModelImplCopyWith<_$SalesInvoiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalesListModel _$SalesListModelFromJson(Map<String, dynamic> json) {
  return _SalesListModel.fromJson(json);
}

/// @nodoc
mixin _$SalesListModel {
  String? get saleIdpk => throw _privateConstructorUsedError;
  int? get saleNo => throw _privateConstructorUsedError;
  String? get saleMode => throw _privateConstructorUsedError;
  String? get crLedgerIdfk => throw _privateConstructorUsedError;
  String? get drLedgerIdfk => throw _privateConstructorUsedError;
  String? get custemerIdfk => throw _privateConstructorUsedError;
  String? get creditAccount => throw _privateConstructorUsedError;
  String? get debitAccount => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get saleDate => throw _privateConstructorUsedError;
  String? get cashTrn => throw _privateConstructorUsedError;
  String? get cashCustomerAddress => throw _privateConstructorUsedError;
  String? get shippingAddress => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  String? get lpoNo => throw _privateConstructorUsedError;
  String? get doNo => throw _privateConstructorUsedError;
  String? get diningArea => throw _privateConstructorUsedError;
  String? get diningTable => throw _privateConstructorUsedError;
  String? get quotationNo => throw _privateConstructorUsedError;
  String? get requestNo => throw _privateConstructorUsedError;
  double? get cashAmount => throw _privateConstructorUsedError;
  double? get creditCardAmount => throw _privateConstructorUsedError;
  DateTime? get actualSalesDate => throw _privateConstructorUsedError;
  String? get vehicleNo => throw _privateConstructorUsedError;
  String? get genaralNotes => throw _privateConstructorUsedError;
  String? get salesOrderNo => throw _privateConstructorUsedError;
  String? get soldBy => throw _privateConstructorUsedError;
  double? get grossAmount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  double? get roundOff => throw _privateConstructorUsedError;
  double? get amountTendered => throw _privateConstructorUsedError;
  String? get deliveryBoy => throw _privateConstructorUsedError;
  bool? get isEditable => throw _privateConstructorUsedError;
  bool? get isCanceled => throw _privateConstructorUsedError;
  bool? get isLockVoucher => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  bool? get isPos => throw _privateConstructorUsedError;
  String? get deliveryBoyIdpk => throw _privateConstructorUsedError;
  String? get notesAndInstructions => throw _privateConstructorUsedError;
  String? get drLedgerCashAccount => throw _privateConstructorUsedError;
  String? get drLedgerBankAccount => throw _privateConstructorUsedError;
  String? get orderType => throw _privateConstructorUsedError;
  int? get deliveryCharge => throw _privateConstructorUsedError;
  List<SoldItemModel>? get soldItems => throw _privateConstructorUsedError;

  /// Serializes this SalesListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesListModelCopyWith<SalesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesListModelCopyWith<$Res> {
  factory $SalesListModelCopyWith(
          SalesListModel value, $Res Function(SalesListModel) then) =
      _$SalesListModelCopyWithImpl<$Res, SalesListModel>;
  @useResult
  $Res call(
      {String? saleIdpk,
      int? saleNo,
      String? saleMode,
      String? crLedgerIdfk,
      String? drLedgerIdfk,
      String? custemerIdfk,
      String? creditAccount,
      String? debitAccount,
      String? referenceNo,
      DateTime? saleDate,
      String? cashTrn,
      String? cashCustomerAddress,
      String? shippingAddress,
      String? customerName,
      String? remarks,
      String? lpoNo,
      String? doNo,
      String? diningArea,
      String? diningTable,
      String? quotationNo,
      String? requestNo,
      double? cashAmount,
      double? creditCardAmount,
      DateTime? actualSalesDate,
      String? vehicleNo,
      String? genaralNotes,
      String? salesOrderNo,
      String? soldBy,
      double? grossAmount,
      double? tax,
      double? discount,
      double? netTotal,
      double? roundOff,
      double? amountTendered,
      String? deliveryBoy,
      bool? isEditable,
      bool? isCanceled,
      bool? isLockVoucher,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      bool? isPos,
      String? deliveryBoyIdpk,
      String? notesAndInstructions,
      String? drLedgerCashAccount,
      String? drLedgerBankAccount,
      String? orderType,
      int? deliveryCharge,
      List<SoldItemModel>? soldItems});
}

/// @nodoc
class _$SalesListModelCopyWithImpl<$Res, $Val extends SalesListModel>
    implements $SalesListModelCopyWith<$Res> {
  _$SalesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = freezed,
    Object? saleNo = freezed,
    Object? saleMode = freezed,
    Object? crLedgerIdfk = freezed,
    Object? drLedgerIdfk = freezed,
    Object? custemerIdfk = freezed,
    Object? creditAccount = freezed,
    Object? debitAccount = freezed,
    Object? referenceNo = freezed,
    Object? saleDate = freezed,
    Object? cashTrn = freezed,
    Object? cashCustomerAddress = freezed,
    Object? shippingAddress = freezed,
    Object? customerName = freezed,
    Object? remarks = freezed,
    Object? lpoNo = freezed,
    Object? doNo = freezed,
    Object? diningArea = freezed,
    Object? diningTable = freezed,
    Object? quotationNo = freezed,
    Object? requestNo = freezed,
    Object? cashAmount = freezed,
    Object? creditCardAmount = freezed,
    Object? actualSalesDate = freezed,
    Object? vehicleNo = freezed,
    Object? genaralNotes = freezed,
    Object? salesOrderNo = freezed,
    Object? soldBy = freezed,
    Object? grossAmount = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? netTotal = freezed,
    Object? roundOff = freezed,
    Object? amountTendered = freezed,
    Object? deliveryBoy = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? isLockVoucher = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? isPos = freezed,
    Object? deliveryBoyIdpk = freezed,
    Object? notesAndInstructions = freezed,
    Object? drLedgerCashAccount = freezed,
    Object? drLedgerBankAccount = freezed,
    Object? orderType = freezed,
    Object? deliveryCharge = freezed,
    Object? soldItems = freezed,
  }) {
    return _then(_value.copyWith(
      saleIdpk: freezed == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      saleNo: freezed == saleNo
          ? _value.saleNo
          : saleNo // ignore: cast_nullable_to_non_nullable
              as int?,
      saleMode: freezed == saleMode
          ? _value.saleMode
          : saleMode // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIdfk: freezed == crLedgerIdfk
          ? _value.crLedgerIdfk
          : crLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIdfk: freezed == drLedgerIdfk
          ? _value.drLedgerIdfk
          : drLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      custemerIdfk: freezed == custemerIdfk
          ? _value.custemerIdfk
          : custemerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccount: freezed == creditAccount
          ? _value.creditAccount
          : creditAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccount: freezed == debitAccount
          ? _value.debitAccount
          : debitAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: freezed == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashTrn: freezed == cashTrn
          ? _value.cashTrn
          : cashTrn // ignore: cast_nullable_to_non_nullable
              as String?,
      cashCustomerAddress: freezed == cashCustomerAddress
          ? _value.cashCustomerAddress
          : cashCustomerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      lpoNo: freezed == lpoNo
          ? _value.lpoNo
          : lpoNo // ignore: cast_nullable_to_non_nullable
              as String?,
      doNo: freezed == doNo
          ? _value.doNo
          : doNo // ignore: cast_nullable_to_non_nullable
              as String?,
      diningArea: freezed == diningArea
          ? _value.diningArea
          : diningArea // ignore: cast_nullable_to_non_nullable
              as String?,
      diningTable: freezed == diningTable
          ? _value.diningTable
          : diningTable // ignore: cast_nullable_to_non_nullable
              as String?,
      quotationNo: freezed == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAmount: freezed == cashAmount
          ? _value.cashAmount
          : cashAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      creditCardAmount: freezed == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualSalesDate: freezed == actualSalesDate
          ? _value.actualSalesDate
          : actualSalesDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      genaralNotes: freezed == genaralNotes
          ? _value.genaralNotes
          : genaralNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrderNo: freezed == salesOrderNo
          ? _value.salesOrderNo
          : salesOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      roundOff: freezed == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
              as double?,
      amountTendered: freezed == amountTendered
          ? _value.amountTendered
          : amountTendered // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryBoy: freezed == deliveryBoy
          ? _value.deliveryBoy
          : deliveryBoy // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCanceled: freezed == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLockVoucher: freezed == isLockVoucher
          ? _value.isLockVoucher
          : isLockVoucher // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPos: freezed == isPos
          ? _value.isPos
          : isPos // ignore: cast_nullable_to_non_nullable
              as bool?,
      deliveryBoyIdpk: freezed == deliveryBoyIdpk
          ? _value.deliveryBoyIdpk
          : deliveryBoyIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      notesAndInstructions: freezed == notesAndInstructions
          ? _value.notesAndInstructions
          : notesAndInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerCashAccount: freezed == drLedgerCashAccount
          ? _value.drLedgerCashAccount
          : drLedgerCashAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerBankAccount: freezed == drLedgerBankAccount
          ? _value.drLedgerBankAccount
          : drLedgerBankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      soldItems: freezed == soldItems
          ? _value.soldItems
          : soldItems // ignore: cast_nullable_to_non_nullable
              as List<SoldItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesListModelImplCopyWith<$Res>
    implements $SalesListModelCopyWith<$Res> {
  factory _$$SalesListModelImplCopyWith(_$SalesListModelImpl value,
          $Res Function(_$SalesListModelImpl) then) =
      __$$SalesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? saleIdpk,
      int? saleNo,
      String? saleMode,
      String? crLedgerIdfk,
      String? drLedgerIdfk,
      String? custemerIdfk,
      String? creditAccount,
      String? debitAccount,
      String? referenceNo,
      DateTime? saleDate,
      String? cashTrn,
      String? cashCustomerAddress,
      String? shippingAddress,
      String? customerName,
      String? remarks,
      String? lpoNo,
      String? doNo,
      String? diningArea,
      String? diningTable,
      String? quotationNo,
      String? requestNo,
      double? cashAmount,
      double? creditCardAmount,
      DateTime? actualSalesDate,
      String? vehicleNo,
      String? genaralNotes,
      String? salesOrderNo,
      String? soldBy,
      double? grossAmount,
      double? tax,
      double? discount,
      double? netTotal,
      double? roundOff,
      double? amountTendered,
      String? deliveryBoy,
      bool? isEditable,
      bool? isCanceled,
      bool? isLockVoucher,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      bool? isPos,
      String? deliveryBoyIdpk,
      String? notesAndInstructions,
      String? drLedgerCashAccount,
      String? drLedgerBankAccount,
      String? orderType,
      int? deliveryCharge,
      List<SoldItemModel>? soldItems});
}

/// @nodoc
class __$$SalesListModelImplCopyWithImpl<$Res>
    extends _$SalesListModelCopyWithImpl<$Res, _$SalesListModelImpl>
    implements _$$SalesListModelImplCopyWith<$Res> {
  __$$SalesListModelImplCopyWithImpl(
      _$SalesListModelImpl _value, $Res Function(_$SalesListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = freezed,
    Object? saleNo = freezed,
    Object? saleMode = freezed,
    Object? crLedgerIdfk = freezed,
    Object? drLedgerIdfk = freezed,
    Object? custemerIdfk = freezed,
    Object? creditAccount = freezed,
    Object? debitAccount = freezed,
    Object? referenceNo = freezed,
    Object? saleDate = freezed,
    Object? cashTrn = freezed,
    Object? cashCustomerAddress = freezed,
    Object? shippingAddress = freezed,
    Object? customerName = freezed,
    Object? remarks = freezed,
    Object? lpoNo = freezed,
    Object? doNo = freezed,
    Object? diningArea = freezed,
    Object? diningTable = freezed,
    Object? quotationNo = freezed,
    Object? requestNo = freezed,
    Object? cashAmount = freezed,
    Object? creditCardAmount = freezed,
    Object? actualSalesDate = freezed,
    Object? vehicleNo = freezed,
    Object? genaralNotes = freezed,
    Object? salesOrderNo = freezed,
    Object? soldBy = freezed,
    Object? grossAmount = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? netTotal = freezed,
    Object? roundOff = freezed,
    Object? amountTendered = freezed,
    Object? deliveryBoy = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? isLockVoucher = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? isPos = freezed,
    Object? deliveryBoyIdpk = freezed,
    Object? notesAndInstructions = freezed,
    Object? drLedgerCashAccount = freezed,
    Object? drLedgerBankAccount = freezed,
    Object? orderType = freezed,
    Object? deliveryCharge = freezed,
    Object? soldItems = freezed,
  }) {
    return _then(_$SalesListModelImpl(
      saleIdpk: freezed == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      saleNo: freezed == saleNo
          ? _value.saleNo
          : saleNo // ignore: cast_nullable_to_non_nullable
              as int?,
      saleMode: freezed == saleMode
          ? _value.saleMode
          : saleMode // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIdfk: freezed == crLedgerIdfk
          ? _value.crLedgerIdfk
          : crLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIdfk: freezed == drLedgerIdfk
          ? _value.drLedgerIdfk
          : drLedgerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      custemerIdfk: freezed == custemerIdfk
          ? _value.custemerIdfk
          : custemerIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccount: freezed == creditAccount
          ? _value.creditAccount
          : creditAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccount: freezed == debitAccount
          ? _value.debitAccount
          : debitAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: freezed == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashTrn: freezed == cashTrn
          ? _value.cashTrn
          : cashTrn // ignore: cast_nullable_to_non_nullable
              as String?,
      cashCustomerAddress: freezed == cashCustomerAddress
          ? _value.cashCustomerAddress
          : cashCustomerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      lpoNo: freezed == lpoNo
          ? _value.lpoNo
          : lpoNo // ignore: cast_nullable_to_non_nullable
              as String?,
      doNo: freezed == doNo
          ? _value.doNo
          : doNo // ignore: cast_nullable_to_non_nullable
              as String?,
      diningArea: freezed == diningArea
          ? _value.diningArea
          : diningArea // ignore: cast_nullable_to_non_nullable
              as String?,
      diningTable: freezed == diningTable
          ? _value.diningTable
          : diningTable // ignore: cast_nullable_to_non_nullable
              as String?,
      quotationNo: freezed == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAmount: freezed == cashAmount
          ? _value.cashAmount
          : cashAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      creditCardAmount: freezed == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualSalesDate: freezed == actualSalesDate
          ? _value.actualSalesDate
          : actualSalesDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      genaralNotes: freezed == genaralNotes
          ? _value.genaralNotes
          : genaralNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrderNo: freezed == salesOrderNo
          ? _value.salesOrderNo
          : salesOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      roundOff: freezed == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
              as double?,
      amountTendered: freezed == amountTendered
          ? _value.amountTendered
          : amountTendered // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryBoy: freezed == deliveryBoy
          ? _value.deliveryBoy
          : deliveryBoy // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCanceled: freezed == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLockVoucher: freezed == isLockVoucher
          ? _value.isLockVoucher
          : isLockVoucher // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPos: freezed == isPos
          ? _value.isPos
          : isPos // ignore: cast_nullable_to_non_nullable
              as bool?,
      deliveryBoyIdpk: freezed == deliveryBoyIdpk
          ? _value.deliveryBoyIdpk
          : deliveryBoyIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      notesAndInstructions: freezed == notesAndInstructions
          ? _value.notesAndInstructions
          : notesAndInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerCashAccount: freezed == drLedgerCashAccount
          ? _value.drLedgerCashAccount
          : drLedgerCashAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerBankAccount: freezed == drLedgerBankAccount
          ? _value.drLedgerBankAccount
          : drLedgerBankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      soldItems: freezed == soldItems
          ? _value._soldItems
          : soldItems // ignore: cast_nullable_to_non_nullable
              as List<SoldItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesListModelImpl implements _SalesListModel {
  const _$SalesListModelImpl(
      {this.saleIdpk,
      this.saleNo,
      this.saleMode,
      this.crLedgerIdfk,
      this.drLedgerIdfk,
      this.custemerIdfk,
      this.creditAccount,
      this.debitAccount,
      this.referenceNo,
      this.saleDate,
      this.cashTrn,
      this.cashCustomerAddress,
      this.shippingAddress,
      this.customerName,
      this.remarks,
      this.lpoNo,
      this.doNo,
      this.diningArea,
      this.diningTable,
      this.quotationNo,
      this.requestNo,
      this.cashAmount,
      this.creditCardAmount,
      this.actualSalesDate,
      this.vehicleNo,
      this.genaralNotes,
      this.salesOrderNo,
      this.soldBy,
      this.grossAmount,
      this.tax,
      this.discount,
      this.netTotal,
      this.roundOff,
      this.amountTendered,
      this.deliveryBoy,
      this.isEditable,
      this.isCanceled,
      this.isLockVoucher,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.isPos,
      this.deliveryBoyIdpk,
      this.notesAndInstructions,
      this.drLedgerCashAccount,
      this.drLedgerBankAccount,
      this.orderType,
      this.deliveryCharge,
      final List<SoldItemModel>? soldItems})
      : _soldItems = soldItems;

  factory _$SalesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesListModelImplFromJson(json);

  @override
  final String? saleIdpk;
  @override
  final int? saleNo;
  @override
  final String? saleMode;
  @override
  final String? crLedgerIdfk;
  @override
  final String? drLedgerIdfk;
  @override
  final String? custemerIdfk;
  @override
  final String? creditAccount;
  @override
  final String? debitAccount;
  @override
  final String? referenceNo;
  @override
  final DateTime? saleDate;
  @override
  final String? cashTrn;
  @override
  final String? cashCustomerAddress;
  @override
  final String? shippingAddress;
  @override
  final String? customerName;
  @override
  final String? remarks;
  @override
  final String? lpoNo;
  @override
  final String? doNo;
  @override
  final String? diningArea;
  @override
  final String? diningTable;
  @override
  final String? quotationNo;
  @override
  final String? requestNo;
  @override
  final double? cashAmount;
  @override
  final double? creditCardAmount;
  @override
  final DateTime? actualSalesDate;
  @override
  final String? vehicleNo;
  @override
  final String? genaralNotes;
  @override
  final String? salesOrderNo;
  @override
  final String? soldBy;
  @override
  final double? grossAmount;
  @override
  final double? tax;
  @override
  final double? discount;
  @override
  final double? netTotal;
  @override
  final double? roundOff;
  @override
  final double? amountTendered;
  @override
  final String? deliveryBoy;
  @override
  final bool? isEditable;
  @override
  final bool? isCanceled;
  @override
  final bool? isLockVoucher;
  @override
  final String? createdBy;
  @override
  final DateTime? createdDate;
  @override
  final String? modifiedBy;
  @override
  final DateTime? modifiedDate;
  @override
  final String? rowguid;
  @override
  final bool? isPos;
  @override
  final String? deliveryBoyIdpk;
  @override
  final String? notesAndInstructions;
  @override
  final String? drLedgerCashAccount;
  @override
  final String? drLedgerBankAccount;
  @override
  final String? orderType;
  @override
  final int? deliveryCharge;
  final List<SoldItemModel>? _soldItems;
  @override
  List<SoldItemModel>? get soldItems {
    final value = _soldItems;
    if (value == null) return null;
    if (_soldItems is EqualUnmodifiableListView) return _soldItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SalesListModel(saleIdpk: $saleIdpk, saleNo: $saleNo, saleMode: $saleMode, crLedgerIdfk: $crLedgerIdfk, drLedgerIdfk: $drLedgerIdfk, custemerIdfk: $custemerIdfk, creditAccount: $creditAccount, debitAccount: $debitAccount, referenceNo: $referenceNo, saleDate: $saleDate, cashTrn: $cashTrn, cashCustomerAddress: $cashCustomerAddress, shippingAddress: $shippingAddress, customerName: $customerName, remarks: $remarks, lpoNo: $lpoNo, doNo: $doNo, diningArea: $diningArea, diningTable: $diningTable, quotationNo: $quotationNo, requestNo: $requestNo, cashAmount: $cashAmount, creditCardAmount: $creditCardAmount, actualSalesDate: $actualSalesDate, vehicleNo: $vehicleNo, genaralNotes: $genaralNotes, salesOrderNo: $salesOrderNo, soldBy: $soldBy, grossAmount: $grossAmount, tax: $tax, discount: $discount, netTotal: $netTotal, roundOff: $roundOff, amountTendered: $amountTendered, deliveryBoy: $deliveryBoy, isEditable: $isEditable, isCanceled: $isCanceled, isLockVoucher: $isLockVoucher, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, isPos: $isPos, deliveryBoyIdpk: $deliveryBoyIdpk, notesAndInstructions: $notesAndInstructions, drLedgerCashAccount: $drLedgerCashAccount, drLedgerBankAccount: $drLedgerBankAccount, orderType: $orderType, deliveryCharge: $deliveryCharge, soldItems: $soldItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesListModelImpl &&
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

  /// Create a copy of SalesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesListModelImplCopyWith<_$SalesListModelImpl> get copyWith =>
      __$$SalesListModelImplCopyWithImpl<_$SalesListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesListModelImplToJson(
      this,
    );
  }
}

abstract class _SalesListModel implements SalesListModel {
  const factory _SalesListModel(
      {final String? saleIdpk,
      final int? saleNo,
      final String? saleMode,
      final String? crLedgerIdfk,
      final String? drLedgerIdfk,
      final String? custemerIdfk,
      final String? creditAccount,
      final String? debitAccount,
      final String? referenceNo,
      final DateTime? saleDate,
      final String? cashTrn,
      final String? cashCustomerAddress,
      final String? shippingAddress,
      final String? customerName,
      final String? remarks,
      final String? lpoNo,
      final String? doNo,
      final String? diningArea,
      final String? diningTable,
      final String? quotationNo,
      final String? requestNo,
      final double? cashAmount,
      final double? creditCardAmount,
      final DateTime? actualSalesDate,
      final String? vehicleNo,
      final String? genaralNotes,
      final String? salesOrderNo,
      final String? soldBy,
      final double? grossAmount,
      final double? tax,
      final double? discount,
      final double? netTotal,
      final double? roundOff,
      final double? amountTendered,
      final String? deliveryBoy,
      final bool? isEditable,
      final bool? isCanceled,
      final bool? isLockVoucher,
      final String? createdBy,
      final DateTime? createdDate,
      final String? modifiedBy,
      final DateTime? modifiedDate,
      final String? rowguid,
      final bool? isPos,
      final String? deliveryBoyIdpk,
      final String? notesAndInstructions,
      final String? drLedgerCashAccount,
      final String? drLedgerBankAccount,
      final String? orderType,
      final int? deliveryCharge,
      final List<SoldItemModel>? soldItems}) = _$SalesListModelImpl;

  factory _SalesListModel.fromJson(Map<String, dynamic> json) =
      _$SalesListModelImpl.fromJson;

  @override
  String? get saleIdpk;
  @override
  int? get saleNo;
  @override
  String? get saleMode;
  @override
  String? get crLedgerIdfk;
  @override
  String? get drLedgerIdfk;
  @override
  String? get custemerIdfk;
  @override
  String? get creditAccount;
  @override
  String? get debitAccount;
  @override
  String? get referenceNo;
  @override
  DateTime? get saleDate;
  @override
  String? get cashTrn;
  @override
  String? get cashCustomerAddress;
  @override
  String? get shippingAddress;
  @override
  String? get customerName;
  @override
  String? get remarks;
  @override
  String? get lpoNo;
  @override
  String? get doNo;
  @override
  String? get diningArea;
  @override
  String? get diningTable;
  @override
  String? get quotationNo;
  @override
  String? get requestNo;
  @override
  double? get cashAmount;
  @override
  double? get creditCardAmount;
  @override
  DateTime? get actualSalesDate;
  @override
  String? get vehicleNo;
  @override
  String? get genaralNotes;
  @override
  String? get salesOrderNo;
  @override
  String? get soldBy;
  @override
  double? get grossAmount;
  @override
  double? get tax;
  @override
  double? get discount;
  @override
  double? get netTotal;
  @override
  double? get roundOff;
  @override
  double? get amountTendered;
  @override
  String? get deliveryBoy;
  @override
  bool? get isEditable;
  @override
  bool? get isCanceled;
  @override
  bool? get isLockVoucher;
  @override
  String? get createdBy;
  @override
  DateTime? get createdDate;
  @override
  String? get modifiedBy;
  @override
  DateTime? get modifiedDate;
  @override
  String? get rowguid;
  @override
  bool? get isPos;
  @override
  String? get deliveryBoyIdpk;
  @override
  String? get notesAndInstructions;
  @override
  String? get drLedgerCashAccount;
  @override
  String? get drLedgerBankAccount;
  @override
  String? get orderType;
  @override
  int? get deliveryCharge;
  @override
  List<SoldItemModel>? get soldItems;

  /// Create a copy of SalesListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesListModelImplCopyWith<_$SalesListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SoldItemModel _$SoldItemModelFromJson(Map<String, dynamic> json) {
  return _SoldItemModel.fromJson(json);
}

/// @nodoc
mixin _$SoldItemModel {
  String? get saleIdpk => throw _privateConstructorUsedError;
  String? get itemIdpk => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get itemCode => throw _privateConstructorUsedError;
  String? get itemName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  int? get actualQty => throw _privateConstructorUsedError;
  int? get billedQty => throw _privateConstructorUsedError;
  int? get cost => throw _privateConstructorUsedError;
  int? get sellingPrice => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  int? get grossTotal => throw _privateConstructorUsedError;
  int? get taxAmount => throw _privateConstructorUsedError;
  int? get taxPercentage => throw _privateConstructorUsedError;
  int? get netTotal => throw _privateConstructorUsedError;
  int? get currentStock => throw _privateConstructorUsedError;
  int? get profit => throw _privateConstructorUsedError;
  int? get profitPercentage => throw _privateConstructorUsedError;
  bool? get isSent => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  String? get storeIdfk => throw _privateConstructorUsedError;
  String? get projectIdpk => throw _privateConstructorUsedError;
  String? get quotationIdpk => throw _privateConstructorUsedError;
  String? get salesOrderIdpk => throw _privateConstructorUsedError;
  String? get deliveryNoteIdpk => throw _privateConstructorUsedError;
  String? get importId => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;

  /// Serializes this SoldItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoldItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoldItemModelCopyWith<SoldItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoldItemModelCopyWith<$Res> {
  factory $SoldItemModelCopyWith(
          SoldItemModel value, $Res Function(SoldItemModel) then) =
      _$SoldItemModelCopyWithImpl<$Res, SoldItemModel>;
  @useResult
  $Res call(
      {String? saleIdpk,
      String? itemIdpk,
      String? barcode,
      String? itemCode,
      String? itemName,
      String? description,
      String? unit,
      int? actualQty,
      int? billedQty,
      int? cost,
      int? sellingPrice,
      int? discount,
      int? grossTotal,
      int? taxAmount,
      int? taxPercentage,
      int? netTotal,
      int? currentStock,
      int? profit,
      int? profitPercentage,
      bool? isSent,
      DateTime? expiryDate,
      String? storeIdfk,
      String? projectIdpk,
      String? quotationIdpk,
      String? salesOrderIdpk,
      String? deliveryNoteIdpk,
      String? importId,
      String? rowguid});
}

/// @nodoc
class _$SoldItemModelCopyWithImpl<$Res, $Val extends SoldItemModel>
    implements $SoldItemModelCopyWith<$Res> {
  _$SoldItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoldItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = freezed,
    Object? itemIdpk = freezed,
    Object? barcode = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? actualQty = freezed,
    Object? billedQty = freezed,
    Object? cost = freezed,
    Object? sellingPrice = freezed,
    Object? discount = freezed,
    Object? grossTotal = freezed,
    Object? taxAmount = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? currentStock = freezed,
    Object? profit = freezed,
    Object? profitPercentage = freezed,
    Object? isSent = freezed,
    Object? expiryDate = freezed,
    Object? storeIdfk = freezed,
    Object? projectIdpk = freezed,
    Object? quotationIdpk = freezed,
    Object? salesOrderIdpk = freezed,
    Object? deliveryNoteIdpk = freezed,
    Object? importId = freezed,
    Object? rowguid = freezed,
  }) {
    return _then(_value.copyWith(
      saleIdpk: freezed == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      itemIdpk: freezed == itemIdpk
          ? _value.itemIdpk
          : itemIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      actualQty: freezed == actualQty
          ? _value.actualQty
          : actualQty // ignore: cast_nullable_to_non_nullable
              as int?,
      billedQty: freezed == billedQty
          ? _value.billedQty
          : billedQty // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int?,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int?,
      profitPercentage: freezed == profitPercentage
          ? _value.profitPercentage
          : profitPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isSent: freezed == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeIdfk: freezed == storeIdfk
          ? _value.storeIdfk
          : storeIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      projectIdpk: freezed == projectIdpk
          ? _value.projectIdpk
          : projectIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      quotationIdpk: freezed == quotationIdpk
          ? _value.quotationIdpk
          : quotationIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrderIdpk: freezed == salesOrderIdpk
          ? _value.salesOrderIdpk
          : salesOrderIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryNoteIdpk: freezed == deliveryNoteIdpk
          ? _value.deliveryNoteIdpk
          : deliveryNoteIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      importId: freezed == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoldItemModelImplCopyWith<$Res>
    implements $SoldItemModelCopyWith<$Res> {
  factory _$$SoldItemModelImplCopyWith(
          _$SoldItemModelImpl value, $Res Function(_$SoldItemModelImpl) then) =
      __$$SoldItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? saleIdpk,
      String? itemIdpk,
      String? barcode,
      String? itemCode,
      String? itemName,
      String? description,
      String? unit,
      int? actualQty,
      int? billedQty,
      int? cost,
      int? sellingPrice,
      int? discount,
      int? grossTotal,
      int? taxAmount,
      int? taxPercentage,
      int? netTotal,
      int? currentStock,
      int? profit,
      int? profitPercentage,
      bool? isSent,
      DateTime? expiryDate,
      String? storeIdfk,
      String? projectIdpk,
      String? quotationIdpk,
      String? salesOrderIdpk,
      String? deliveryNoteIdpk,
      String? importId,
      String? rowguid});
}

/// @nodoc
class __$$SoldItemModelImplCopyWithImpl<$Res>
    extends _$SoldItemModelCopyWithImpl<$Res, _$SoldItemModelImpl>
    implements _$$SoldItemModelImplCopyWith<$Res> {
  __$$SoldItemModelImplCopyWithImpl(
      _$SoldItemModelImpl _value, $Res Function(_$SoldItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoldItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleIdpk = freezed,
    Object? itemIdpk = freezed,
    Object? barcode = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? actualQty = freezed,
    Object? billedQty = freezed,
    Object? cost = freezed,
    Object? sellingPrice = freezed,
    Object? discount = freezed,
    Object? grossTotal = freezed,
    Object? taxAmount = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? currentStock = freezed,
    Object? profit = freezed,
    Object? profitPercentage = freezed,
    Object? isSent = freezed,
    Object? expiryDate = freezed,
    Object? storeIdfk = freezed,
    Object? projectIdpk = freezed,
    Object? quotationIdpk = freezed,
    Object? salesOrderIdpk = freezed,
    Object? deliveryNoteIdpk = freezed,
    Object? importId = freezed,
    Object? rowguid = freezed,
  }) {
    return _then(_$SoldItemModelImpl(
      saleIdpk: freezed == saleIdpk
          ? _value.saleIdpk
          : saleIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      itemIdpk: freezed == itemIdpk
          ? _value.itemIdpk
          : itemIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      actualQty: freezed == actualQty
          ? _value.actualQty
          : actualQty // ignore: cast_nullable_to_non_nullable
              as int?,
      billedQty: freezed == billedQty
          ? _value.billedQty
          : billedQty // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int?,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as int?,
      profitPercentage: freezed == profitPercentage
          ? _value.profitPercentage
          : profitPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isSent: freezed == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeIdfk: freezed == storeIdfk
          ? _value.storeIdfk
          : storeIdfk // ignore: cast_nullable_to_non_nullable
              as String?,
      projectIdpk: freezed == projectIdpk
          ? _value.projectIdpk
          : projectIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      quotationIdpk: freezed == quotationIdpk
          ? _value.quotationIdpk
          : quotationIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      salesOrderIdpk: freezed == salesOrderIdpk
          ? _value.salesOrderIdpk
          : salesOrderIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryNoteIdpk: freezed == deliveryNoteIdpk
          ? _value.deliveryNoteIdpk
          : deliveryNoteIdpk // ignore: cast_nullable_to_non_nullable
              as String?,
      importId: freezed == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoldItemModelImpl implements _SoldItemModel {
  const _$SoldItemModelImpl(
      {this.saleIdpk,
      this.itemIdpk,
      this.barcode,
      this.itemCode,
      this.itemName,
      this.description,
      this.unit,
      this.actualQty,
      this.billedQty,
      this.cost,
      this.sellingPrice,
      this.discount,
      this.grossTotal,
      this.taxAmount,
      this.taxPercentage,
      this.netTotal,
      this.currentStock,
      this.profit,
      this.profitPercentage,
      this.isSent,
      this.expiryDate,
      this.storeIdfk,
      this.projectIdpk,
      this.quotationIdpk,
      this.salesOrderIdpk,
      this.deliveryNoteIdpk,
      this.importId,
      this.rowguid});

  factory _$SoldItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoldItemModelImplFromJson(json);

  @override
  final String? saleIdpk;
  @override
  final String? itemIdpk;
  @override
  final String? barcode;
  @override
  final String? itemCode;
  @override
  final String? itemName;
  @override
  final String? description;
  @override
  final String? unit;
  @override
  final int? actualQty;
  @override
  final int? billedQty;
  @override
  final int? cost;
  @override
  final int? sellingPrice;
  @override
  final int? discount;
  @override
  final int? grossTotal;
  @override
  final int? taxAmount;
  @override
  final int? taxPercentage;
  @override
  final int? netTotal;
  @override
  final int? currentStock;
  @override
  final int? profit;
  @override
  final int? profitPercentage;
  @override
  final bool? isSent;
  @override
  final DateTime? expiryDate;
  @override
  final String? storeIdfk;
  @override
  final String? projectIdpk;
  @override
  final String? quotationIdpk;
  @override
  final String? salesOrderIdpk;
  @override
  final String? deliveryNoteIdpk;
  @override
  final String? importId;
  @override
  final String? rowguid;

  @override
  String toString() {
    return 'SoldItemModel(saleIdpk: $saleIdpk, itemIdpk: $itemIdpk, barcode: $barcode, itemCode: $itemCode, itemName: $itemName, description: $description, unit: $unit, actualQty: $actualQty, billedQty: $billedQty, cost: $cost, sellingPrice: $sellingPrice, discount: $discount, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, netTotal: $netTotal, currentStock: $currentStock, profit: $profit, profitPercentage: $profitPercentage, isSent: $isSent, expiryDate: $expiryDate, storeIdfk: $storeIdfk, projectIdpk: $projectIdpk, quotationIdpk: $quotationIdpk, salesOrderIdpk: $salesOrderIdpk, deliveryNoteIdpk: $deliveryNoteIdpk, importId: $importId, rowguid: $rowguid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoldItemModelImpl &&
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

  /// Create a copy of SoldItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoldItemModelImplCopyWith<_$SoldItemModelImpl> get copyWith =>
      __$$SoldItemModelImplCopyWithImpl<_$SoldItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoldItemModelImplToJson(
      this,
    );
  }
}

abstract class _SoldItemModel implements SoldItemModel {
  const factory _SoldItemModel(
      {final String? saleIdpk,
      final String? itemIdpk,
      final String? barcode,
      final String? itemCode,
      final String? itemName,
      final String? description,
      final String? unit,
      final int? actualQty,
      final int? billedQty,
      final int? cost,
      final int? sellingPrice,
      final int? discount,
      final int? grossTotal,
      final int? taxAmount,
      final int? taxPercentage,
      final int? netTotal,
      final int? currentStock,
      final int? profit,
      final int? profitPercentage,
      final bool? isSent,
      final DateTime? expiryDate,
      final String? storeIdfk,
      final String? projectIdpk,
      final String? quotationIdpk,
      final String? salesOrderIdpk,
      final String? deliveryNoteIdpk,
      final String? importId,
      final String? rowguid}) = _$SoldItemModelImpl;

  factory _SoldItemModel.fromJson(Map<String, dynamic> json) =
      _$SoldItemModelImpl.fromJson;

  @override
  String? get saleIdpk;
  @override
  String? get itemIdpk;
  @override
  String? get barcode;
  @override
  String? get itemCode;
  @override
  String? get itemName;
  @override
  String? get description;
  @override
  String? get unit;
  @override
  int? get actualQty;
  @override
  int? get billedQty;
  @override
  int? get cost;
  @override
  int? get sellingPrice;
  @override
  int? get discount;
  @override
  int? get grossTotal;
  @override
  int? get taxAmount;
  @override
  int? get taxPercentage;
  @override
  int? get netTotal;
  @override
  int? get currentStock;
  @override
  int? get profit;
  @override
  int? get profitPercentage;
  @override
  bool? get isSent;
  @override
  DateTime? get expiryDate;
  @override
  String? get storeIdfk;
  @override
  String? get projectIdpk;
  @override
  String? get quotationIdpk;
  @override
  String? get salesOrderIdpk;
  @override
  String? get deliveryNoteIdpk;
  @override
  String? get importId;
  @override
  String? get rowguid;

  /// Create a copy of SoldItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoldItemModelImplCopyWith<_$SoldItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
