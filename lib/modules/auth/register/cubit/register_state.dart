part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class OnLoadingRegister extends RegisterState {}

class OnErrorRegister extends RegisterState {
  final String? errorMessage;

  OnErrorRegister({this.errorMessage});
}

class OnSuccessRegister extends RegisterState {
  final RegisterModel? data;

  OnSuccessRegister({this.data});
}

class OnSearchRegister extends RegisterState {}
