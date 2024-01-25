import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = ProfileCubit();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  Widget renderAppBar() {
    return AppBarWidget(
      bloc: bloc,
    );
  }

  Widget renderImage() {
    return ImageWidget(
      bloc: bloc,
    );
  }

  Widget renderAbout() {
    return AboutWidget(bloc: bloc);
  }

  Widget renderInterests() {
    return CardWidget(
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
              bloc.dataProfile?.data?.interests?.length ?? 0,
              (index) => Container(
                height: 33,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  bloc.dataProfile?.data?.interests?[index] ?? '',
                  style: textNormal(color: neutral30, isBold: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderScreen() {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (cProfile, sProfile) {},
        builder: (cProfile, sProfile) {
          if (sProfile is OnLoadingProfile) {
            return const SkeletonProfileWidget();
          }
          if (bloc.dataProfile != null) {
            return SafeArea(
              child: Column(
                children: [
                  renderAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          renderImage(),
                          AppDimens.verticalSpace24,
                          renderAbout(),
                          AppDimens.verticalSpace24,
                          renderInterests(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerForm(
      bgColor: backgroundColors0,
      body: renderScreen(),
    );
  }
}
