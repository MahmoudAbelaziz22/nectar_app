import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar_app/app_router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(NectarApp(
    appRouter: AppRouter(),
  ));
}

class NectarApp extends StatelessWidget {
  final AppRouter appRouter;

  const NectarApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
