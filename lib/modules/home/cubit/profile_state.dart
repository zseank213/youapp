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

class OnLoadingCreateProfile extends ProfileState {}

class OnErrorCreateProfile extends ProfileState {
  final String? errorMessage;

  OnErrorCreateProfile({this.errorMessage});
}

class OnSuccessCreateProfile extends ProfileState {
  final ProfileModel? data;

  OnSuccessCreateProfile({this.data});
}

class OnLoadingUpdateProfile extends ProfileState {}

class OnErrorUpdateProfile extends ProfileState {
  final String? errorMessage;

  OnErrorUpdateProfile({this.errorMessage});
}

class OnSuccessUpdateProfile extends ProfileState {
  final ProfileModel? data;

  OnSuccessUpdateProfile({this.data});
}
