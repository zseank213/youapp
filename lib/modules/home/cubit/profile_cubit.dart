import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';
import 'package:youapp/modules/home/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _profileService = ProfileService();

  late ProfileModel _dataProfile;

  Future<void> getProfile() async {
    emit(OnLoadingProfile());
    var res = await _profileService.getProfile();

    _dataProfile = ProfileModel.fromJson(res.data);

    debugPrint('Get Auth Status : Success');
    emit(OnSuccessProfile(data: _dataProfile));
  }

  Future<void> createProfile() async {}

  Future<void> updateProfile() async {}
}
