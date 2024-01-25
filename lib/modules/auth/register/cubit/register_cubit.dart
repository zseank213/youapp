import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPassword = true;
  bool isLoading = false;

  final RegisterService _registerService = RegisterService();

  late RegisterModel _data;

  Future<void> post() async {
    isLoading = true;
    emit(OnLoadingRegister());

    var res = await _registerService.post(
      data: RegisterParamModel(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      ),
    );

    _data = RegisterModel.fromJson(res.data);

    if (_data.message == "User has been created successfully") {
      debugPrint('Get Auth Status : Success');
      isLoading = false;
      emit(OnSuccessRegister(data: _data));
    } else {
      debugPrint('Get Auth Status : UnSuccess');
      isLoading = false;
      emit(OnErrorRegister(errorMessage: _data.message));
    }
  }
}
