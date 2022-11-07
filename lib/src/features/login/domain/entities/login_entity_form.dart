import 'package:equatable/equatable.dart';

class LoginFormEntity extends Equatable {
  String? countryCode;
  String? phoneNumber;
  String? password;

  LoginFormEntity({
    this.countryCode,
    this.phoneNumber,
    this.password,
  });

  @override
  List<Object?> get props => [
        countryCode,
        phoneNumber,
        password,
      ];
}
