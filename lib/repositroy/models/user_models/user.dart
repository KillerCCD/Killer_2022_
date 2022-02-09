import 'package:smart_apaga/repositroy/models/company_model/company.dart';

class User {
  final String fullname;
  final String phoneNumber;

  final String email;
  final String password;
  final Company company;
  User({
    this.fullname,
    this.phoneNumber,
    this.email,
    this.password,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fullname: json['fullname'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        company: json['company'] ?? '');
  }

  Map toMap() {
    return {
      'fullName': fullname ?? '',
      'phoneNumber': phoneNumber ?? '',
      'email': email ?? '',
      'password': password ?? '',
      'company': company != null ? company.toMap() : company,
    };
  }

  User copyWith({
    String fullname,
    String phoneNumber,
    String email,
    String password,
    Company company,
  }) {
    return User(
      fullname: fullname ?? this.fullname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      company: company ?? this.company,
    );
  }
}
