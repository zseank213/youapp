import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassword = true;
  bool isLoading = false;

  final LoginService _loginService = LoginService();

  late LoginModel _data;

  Future<void> post() async {
    final bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text);

    isLoading = true;
    errorMessage = '';
    emit(OnLoadingLogin());

    var res = await _loginService.post(
      data: emailValid
          ? LoginParamModel(
              email: emailController.text,
              username: '',
              password: passwordController.text,
            )
          : LoginParamModel(
              email: '',
              username: emailController.text,
              password: passwordController.text,
            ),
    );

    _data = LoginModel.fromJson(res.data);

    if (_data.message == "User has been logged in successfully") {
      errorMessage = '';
      debugPrint('Get Auth Status : Success');
      isLoading = false;
      await SecureStorage.setAccessToken(token: '${_data.accessToken}');
      emit(OnSuccessLogin(data: _data));
    } else {
      isLoading = false;
      errorMessage = '${_data.message}';
      emit(OnErrorLogin(errorMessage: _data.message));
    }

    emit(LoginInitial());
  }
}
