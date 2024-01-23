part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class OnLoadingLogin extends LoginState {}

class OnErrorLogin extends LoginState {
  final String? errorMessage;

  OnErrorLogin({this.errorMessage});
}

class OnSuccessLogin extends LoginState {
  final LoginModel? data;

  OnSuccessLogin({this.data});
}

class OnSearchLogin extends LoginState {}
