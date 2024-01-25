import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  _SplashScreenViewState() {
    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        cubit.isVisibleLogo = true;
      });
    });
  }

  final cubit = SplashScreenCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bgPrimary,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          AnimatedOpacity(
            opacity: cubit.isVisibleLogo ? 1.0 : 0,
            duration: const Duration(milliseconds: 2000),
            onEnd: () async {
              var token = await SecureStorage.getAccessToken();

              if (token != null) {
                Navigator.pushReplacementNamed(context, routeHome);
              } else {
                Navigator.pushReplacementNamed(context, routeLogin);
              }
            },
            child: Center(
              child: Text(
                "YouApp",
                style: textXXXL(
                  color: neutral30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
