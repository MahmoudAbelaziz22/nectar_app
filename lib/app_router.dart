import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/onBording_Screen/onBording_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBordingScreen.routeName:
        return MaterialPageRoute(builder: (_) => OnBordingScreen());
    }
  }
}
