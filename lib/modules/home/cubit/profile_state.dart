part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class OnLoadingProfile extends ProfileState {}

class OnErrorProfile extends ProfileState {
  final String? errorMessage;

  OnErrorProfile({this.errorMessage});
}

class OnSuccessProfile extends ProfileState {
  final ProfileModel? data;

  OnSuccessProfile({this.data});
}
