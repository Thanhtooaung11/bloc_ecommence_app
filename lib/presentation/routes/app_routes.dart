import 'package:bloc_ecommence_app/data/model/user_model.dart';
import 'package:bloc_ecommence_app/presentation/cart_screen.dart';
import 'package:bloc_ecommence_app/presentation/screens/home/home_screen.dart';
import 'package:bloc_ecommence_app/presentation/screens/login/login_screen.dart';
import 'package:bloc_ecommence_app/presentation/screens/splash/splash_screen.dart';
import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route<dynamic>? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case appCartScreen:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case appSplashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case appHomeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(
                  user: UserModel.fromJson(settings.arguments as Map),
                ));
      case appLoginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    return null;
  }
}
