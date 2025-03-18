import 'dart:convert';

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) =>
      LoginParams.fromMap(json.decode(source));
}
