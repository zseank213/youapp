import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';
import 'package:youapp/modules/home/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<String> signNames = [
    "Capricorn",
    "Aquarius",
    "Pisces",
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn"
  ];

  final _profileService = ProfileService();
  bool isEditing = false;

  DateTime? dateSelected;
  String? monthSelected;
  List<String>? interestSelected;

  TextEditingController displayNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController horoscopeController = TextEditingController();
  TextEditingController zodiacController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  double? heightAbout = 0;

  ProfileModel? dataProfile;

  void init() async {
    await getProfile();
    displayNameController.text = dataProfile?.data?.name ?? '';
    genderController.text = dataProfile?.data?.name ?? '';
    birthdayController.text = dataProfile?.data?.birthday != null
        ? "${dataProfile?.data?.birthday?.split(' ').first}/${convertIntMonth()}/${dataProfile?.data?.birthday?.split(' ').last}"
        : '';
    dateSelected = dataProfile?.data?.birthday != null
        ? DateTime(
            int.parse("${dataProfile?.data?.birthday?.split(' ').last}"),
            int.parse("${convertIntMonth()}"),
            int.parse("${dataProfile?.data?.birthday?.split(' ').first}"))
        : null;
    horoscopeController.text = dataProfile?.data?.horoscope ?? '';
    zodiacController.text = dataProfile?.data?.zodiac ?? '';
    heightController = dataProfile?.data?.weight != null
        ? TextEditingController(text: '${dataProfile?.data?.height}')
        : TextEditingController();
    weightController = dataProfile?.data?.height != null
        ? TextEditingController(text: '${dataProfile?.data?.weight}')
        : TextEditingController();
  }

  String? convertIntMonth() {
    String? monthInt;

    String? split = dataProfile?.data?.birthday?.split(' ')[1];

    for (int i = 0; i < monthNames.length; i++) {
      if (split == monthNames[i]) {
        monthInt = "${i < 10 ? '0' : ''}${i + 1}";
      }
    }

    return monthInt;
  }

  String? convertStringMonth() {
    String? monthString;

    String? split = birthdayController.text.split('/')[1];

    for (int i = 0; i < monthNames.length; i++) {
      if (i == int.parse(split) - 1) {
        monthString = monthNames[i];
      }
    }

    return monthString;
  }

  String? getAge() {
    String? age;
    age = "${DateTime.now().year - int.parse('${dateSelected?.year}')}";
    return age;
  }

  Future<void> getProfile() async {
    emit(OnLoadingProfile());
    var res = await _profileService.getProfile();

    dataProfile = ProfileModel.fromJson(res.data);

    debugPrint('Get Profile Status : Success');
    emit(OnSuccessProfile(data: dataProfile));
  }

  String getZodiacSign(DateTime birthdate) {
    const List<int> signDays = [0, 19, 18, 20, 19, 20, 21, 22, 22, 22, 23, 21, 21];

    if (birthdate.day <= signDays[birthdate.month]) {
      monthSelected = signNames[birthdate.month - 1];
      return signNames[birthdate.month - 1];
    } else {
      return signNames[birthdate.month];
    }
  }

  Future<void> createProfile() async {
    emit(OnLoadingCreateProfile());
    var res = await _profileService.createProfile(
      param: ProfileParamModel(
        weight: int.parse(weightController.text),
        height: int.parse(heightController.text),
        birthday:
            "${birthdayController.text.split('/').first} ${convertStringMonth()} ${birthdayController.text.split('/').last}",
        name: displayNameController.text.isEmpty
            ? dataProfile?.data?.name ?? ''
            : displayNameController.text,
        interest: dataProfile?.data?.interests ?? [],
      ),
    );

    dataProfile = ProfileModel.fromJson(res.data);

    dataProfile?.data?.birthday =
        "${birthdayController.text.split('/').first} ${convertStringMonth()} ${birthdayController.text.split('/').last}";

    debugPrint('Create Profile Status : Success');
    emit(OnSuccessCreateProfile(data: dataProfile));
  }

  Future<void> updateProfile() async {
    emit(OnLoadingUpdateProfile());
    var res = await _profileService.updateProfile(
      param: ProfileParamModel(
        weight: int.parse(weightController.text),
        height: int.parse(heightController.text),
        birthday:
            "${birthdayController.text.split('/').first} ${convertStringMonth()} ${birthdayController.text.split('/').last}",
        name: dataProfile?.data?.name ?? '',
        interest: dataProfile?.data?.interests ?? [],
      ),
    );

    dataProfile = ProfileModel.fromJson(res.data);

    debugPrint('Update Profile Status : Success');
    emit(OnSuccessUpdateProfile(data: dataProfile));
  }
}
