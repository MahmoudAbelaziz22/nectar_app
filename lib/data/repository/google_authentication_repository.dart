import 'package:firebase_auth/firebase_auth.dart';
import 'package:nectar_app/data/web_services/google_authentication_services.dart';

class GoogleSignInRepository {
  final GoogleAuthenticationWebServices googleSignInWebServices;

  GoogleSignInRepository(this.googleSignInWebServices);

  Future<UserCredential> login() async {
    final currentUserCredential = await googleSignInWebServices.login();
    return currentUserCredential;
  }

  Future<void> logout() async {
    await googleSignInWebServices.logout();
  }
}
