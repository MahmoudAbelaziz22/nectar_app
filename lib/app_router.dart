import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar_app/buiness_logic/facebook_authentication_cubit/facebook_authentication_cubit.dart';

import 'package:nectar_app/buiness_logic/google_authentication_cubit/cubit/google_authentication_cubit.dart';
import 'package:nectar_app/buiness_logic/phone_authentication_cubit/phone_authentication_cubit.dart';
import 'package:nectar_app/buiness_logic/products_cubit/products_cubit.dart';
import 'package:nectar_app/data/repository/facebook_authentication_repository.dart';
import 'package:nectar_app/data/repository/google_authentication_repository.dart';
import 'package:nectar_app/data/repository/phone_authentication_repository.dart';
import 'package:nectar_app/data/repository/products_repository.dart';
import 'package:nectar_app/data/web_services/facebook_authentication_services.dart';
import 'package:nectar_app/data/web_services/google_authentication_services.dart';
import 'package:nectar_app/data/web_services/phone_authentication_services.dart';
import 'package:nectar_app/data/web_services/products_services.dart';
import 'package:nectar_app/presentation/screens/category_products_screen/categort_products_screen.dart';
import 'package:nectar_app/presentation/screens/home_screen/home_screen.dart';
import 'package:nectar_app/presentation/screens/number_screen/number_screen.dart';
import 'package:nectar_app/presentation/screens/onBording_Screen/onBording_screen.dart';
import 'package:nectar_app/presentation/screens/order_accepted_screen/order_accepted_screen.dart';
import 'package:nectar_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:nectar_app/presentation/screens/select_location_screen/select_location_screen.dart';
import 'package:nectar_app/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:nectar_app/presentation/screens/sign_up_screen/sign_up_screen.dart';

class AppRouter {
  late GoogleSignInRepository googleSignInRepository;
  late GoogleAuthenticationCubit googleauthenticationCubit;
  late FacebookSignInRepository facebookSignInRepository;
  late FacebookAuthenticationCubit facebookAuthenticationCubit;
  late PhoneAuthenticationRepository phoneAuthenticationRepository;
  late PhoneAuthenticationCubit phoneAuthenticationCubit;
  late ProductRepository productRepository;
  late ProductsCubit productsCubit;
  AppRouter() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    googleSignInRepository = GoogleSignInRepository(
        GoogleAuthenticationWebServices(
            googleSignIn: GoogleSignIn(), firebaseAuth: firebaseAuth));

    googleauthenticationCubit =
        GoogleAuthenticationCubit(googleSignInRepository);

    facebookSignInRepository =
        FacebookSignInRepository(FacebookAuthenticationWebServices());
    facebookAuthenticationCubit =
        FacebookAuthenticationCubit(facebookSignInRepository);

    phoneAuthenticationRepository = PhoneAuthenticationRepository(
        PhoneAuthenticationServices(firebaseAuth: firebaseAuth));
    phoneAuthenticationCubit =
        PhoneAuthenticationCubit(phoneAuthenticationRepository, firebaseAuth);

    productRepository = ProductRepository(ProductsWebServices());
    productsCubit = ProductsCubit(productRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBordingScreen.routeName:
        return MaterialPageRoute(builder: (_) => OnBordingScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => facebookAuthenticationCubit,
                    ),
                    BlocProvider(
                      create: (context) => googleauthenticationCubit,
                    ),
                  ],
                  child: SignInScreen(),
                ));
      case NumberScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => phoneAuthenticationCubit,
                  child: NumberScreen(),
                ));
      case SelectLocationScreen.routeName:
        return MaterialPageRoute(builder: (_) => SelectLocationScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => productsCubit,
                  child: HomeScreen(),
                ));
      case ProductDetailsScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());

      case CategoryProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => CategoryProductsScreen());

      case OrderAcceptedScreen.routeName:
        return MaterialPageRoute(builder: (_) => OrderAcceptedScreen());
    }
  }
}
