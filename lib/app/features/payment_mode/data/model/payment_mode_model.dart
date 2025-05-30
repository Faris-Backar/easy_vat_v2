class PaymentModeModel {
  final String paymentModes;

  PaymentModeModel({
    required this.paymentModes,
  });

  // JSON Serialization
  factory PaymentModeModel.fromJson(Map<String, dynamic> json) {
    return PaymentModeModel(
      paymentModes: json['paymnetModes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymnetModes': paymentModes,
    };
  }
}
