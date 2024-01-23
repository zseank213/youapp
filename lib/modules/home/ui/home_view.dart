import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';
import 'package:youapp/modules/home/cubit/profile_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = ProfileCubit();

  @override
  void initState() {
    bloc.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerForm(
      bgColor: backgroundColors0,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (cProfile, sProfile) {},
          builder: (cProfile, sProfile) {
            if (sProfile is OnLoadingProfile) {
              return SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: neutral30,
                              ),
                              AppDimens.horizontalSpace6,
                              Text(
                                "Back",
                                style: textNormal(color: neutral30),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width / 3,
                              child: ShimmerEffect(
                                borderRadius: 8,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.keyboard_control,
                              color: neutral30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppDimens.verticalSpace24,
                    Container(
                      height: 190,
                      child: ShimmerEffect(
                        borderRadius: 16,
                      ),
                    ),
                    AppDimens.verticalSpace24,
                    Container(
                      height: 120,
                      child: ShimmerEffect(),
                    ),
                    AppDimens.verticalSpace12,
                    Container(
                      height: 120,
                      child: ShimmerEffect(),
                    ),
                  ],
                ),
              );
            }
            if (sProfile is OnSuccessProfile) {
              final birthday = sProfile.data?.data?.birthday != null
                  ? DateTime.now().year -
                      int.parse("${sProfile.data?.data?.birthday?.split(" ").last}")
                  : "-";
              return SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: neutral30,
                              ),
                              AppDimens.horizontalSpace6,
                              Text(
                                "Back",
                                style: textNormal(color: neutral30),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "@${sProfile.data?.data?.username}",
                              style: textNormal(color: neutral30),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.keyboard_control,
                              color: neutral30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          CardWidget(
                            width: double.infinity,
                            height: 190,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: Image.asset(
                                    editIcon,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "@${sProfile.data?.data?.username}, $birthday",
                                        style: textMedium(color: neutral30, isBold: true),
                                      ),
                                      AppDimens.verticalSpace6,
                                      Text(
                                        "Male",
                                        style: textNormal(color: neutral30),
                                      ),
                                      if (sProfile.data?.data?.birthday != null) ...[
                                        AppDimens.verticalSpace12,
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.05),
                                                borderRadius: BorderRadius.circular(100),
                                              ),
                                              child: Text(
                                                "${sProfile.data?.data?.horoscope}",
                                                style: textNormal(color: neutral30),
                                              ),
                                            ),
                                            AppDimens.horizontalSpace6,
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.05),
                                                borderRadius: BorderRadius.circular(100),
                                              ),
                                              child: Text(
                                                "${sProfile.data?.data?.zodiac}",
                                                style: textNormal(color: neutral30),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppDimens.verticalSpace24,
                          CardWidget(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "About",
                                      style: textNormal(color: neutral30, isBold: true),
                                    ),
                                    Image.asset(
                                      editIcon,
                                    ),
                                  ],
                                ),
                                if (sProfile.data?.data?.birthday != null) ...[
                                  AppDimens.verticalSpace24,
                                  TitleDetailWidget(
                                    title: 'Birthday',
                                    detail: '${sProfile.data?.data?.birthday} (Age $birthday)',
                                  ),
                                  TitleDetailWidget(
                                    title: 'Horoscope',
                                    detail: '${sProfile.data?.data?.horoscope}',
                                  ),
                                  TitleDetailWidget(
                                    title: 'Zodiac',
                                    detail: '${sProfile.data?.data?.zodiac}',
                                  ),
                                  TitleDetailWidget(
                                    title: 'Height',
                                    detail: '${sProfile.data?.data?.height} cm',
                                  ),
                                  TitleDetailWidget(
                                    title: 'Weight',
                                    detail: '${sProfile.data?.data?.horoscope} kg',
                                  ),
                                ],
                              ],
                            ),
                          ),
                          AppDimens.verticalSpace24,
                          CardWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Interest",
                                      style: textNormal(color: neutral30, isBold: true),
                                    ),
                                    Image.asset(
                                      editIcon,
                                    ),
                                  ],
                                ),
                                AppDimens.verticalSpace12,
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: List.generate(
                                    sProfile.data?.data?.interests?.length ?? 0,
                                    (index) => Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      child: Text(
                                        sProfile.data?.data?.interests?[index] ?? '',
                                        style: textNormal(color: neutral30, isBold: true),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
