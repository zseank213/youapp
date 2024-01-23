class LoginParamModel {
  final String? email;
  final String? username;
  final String password;

  LoginParamModel({
    this.email,
    required this.password,
    this.username,
  });
}
