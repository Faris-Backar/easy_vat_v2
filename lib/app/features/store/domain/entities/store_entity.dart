class StoreEntity {
  String? storeIDPK;
  String? storeType;
  String? storeID;
  String? storeName;
  String? storeLocation;
  String? storeAddress;
  bool? isActive;
  bool? isEdit;
  bool? isDefaultStore;
  String? createdBy;
  DateTime? createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String? rowguide;

  StoreEntity(
      {this.storeIDPK,
      this.storeType,
      this.storeID,
      this.storeName,
      this.storeLocation,
      this.storeAddress,
      this.isActive,
      this.isEdit,
      this.isDefaultStore,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguide});

  @override
  String toString() {
    return "StoreEntity(storeIDPK: $storeIDPK, storeType: $storeType, storeID: $storeID, storeName: $storeName, storeLocation: $storeLocation, storeAddress: $storeAddress, isActive: $isActive, isEdit: $isEdit, isDefaultStore: $isDefaultStore, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguide: $rowguide)";
  }
}
