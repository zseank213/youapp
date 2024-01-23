import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPassword = true;
  bool isLoading = false;

  // final RegisterService _registerService = RegisterService();

  // late RegisterModel _data;

  Future<void> post() async {
    final bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text);

    isLoading = true;
    errorMessage = '';
    emit(OnLoadingRegister());

    // var res = await _registerService.post(
    //   data: emailValid
    //       ? RegisterParamModel(
    //           email: emailController.text,
    //           username: '',
    //           password: passwordController.text,
    //         )
    //       : RegisterParamModel(
    //           email: '',
    //           username: emailController.text,
    //           password: passwordController.text,
    //         ),
    // );

    // _data = RegisterModel.fromJson(res.data);

    // if (_data.message == "User has been logged in successfully") {
    //   errorMessage = '';
    //   debugPrint('Get Auth Status : Success');
    //   isLoading = false;
    //   await SecureStorage.setAccessToken(token: '${_data.accessToken}');
    //   emit(OnSuccessRegister(data: _data));
    // } else {
    //   isLoading = false;
    //   errorMessage = '${_data.message}';
    //   emit(OnErrorRegister(errorMessage: _data.message));
    // }

    emit(RegisterInitial());
  }
}
