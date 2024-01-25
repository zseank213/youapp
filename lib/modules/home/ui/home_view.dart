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
    return InterestWidget(bloc: bloc);
  }

  Widget renderContent() {
    return Expanded(
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
                  renderContent(),
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
