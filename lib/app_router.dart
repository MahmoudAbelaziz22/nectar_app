import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/number_screen/number_screen.dart';
import 'package:nectar_app/presentation/screens/onBording_Screen/onBording_screen.dart';
import 'package:nectar_app/presentation/screens/sign_in_screen/sign_in_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBordingScreen.routeName:
        return MaterialPageRoute(builder: (_) => OnBordingScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case NumberScreen.routeName:
        return MaterialPageRoute(builder: (_) => NumberScreen());
    }
  }
}
