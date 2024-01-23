import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

const routeLogin = "/login";
const routeHome = "/home";
const routeRegister = "/register";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeLogin:
      return SmoothAnimationRoute(const LoginView());
    case routeHome:
      return SmoothAnimationRoute(const HomeView());
    case routeRegister:
      return SmoothAnimationRoute(const RegisterScreen());
  }
  return MaterialPageRoute(
    builder: (context) => const SplashScreenView(),
  );
}
