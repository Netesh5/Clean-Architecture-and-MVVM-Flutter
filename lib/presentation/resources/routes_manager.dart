import 'package:cleanarchmvvm/presentation/forget_password/forget_password.dart';
import 'package:cleanarchmvvm/presentation/login/login.dart';
import 'package:cleanarchmvvm/presentation/register/register.dart';
import 'package:cleanarchmvvm/presentation/resources/string_manager.dart';
import 'package:cleanarchmvvm/presentation/splash/splash_screen.dart';
import 'package:cleanarchmvvm/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/onBording";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String forgetPasswordScreen = "/forgetPassword";
  static const String mainRoutes = "/main";
  static const String storeDetailRoutes = "/storeDetail";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
            builder: ((context) => const ForgetPassword()));
      case Routes.loginScreen:
        return MaterialPageRoute(builder: ((context) => LoginScreen()));
      case Routes.registerScreen:
        return MaterialPageRoute(builder: ((context) => RegisterScreen()));
      case Routes.storeDetailRoutes:
        return MaterialPageRoute(builder: ((context) => const StoreDetails()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(
                child: Text(AppString.noRouteFound),
              ),
            )));
  }
}
