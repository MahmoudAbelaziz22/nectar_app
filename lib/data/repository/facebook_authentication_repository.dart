import 'package:nectar_app/data/web_services/facebook_authentication_services.dart';

class FacebookSignInRepository {
  final FacebookAuthenticationWebServices facebookSignInWebServices;

  FacebookSignInRepository(this.facebookSignInWebServices);

  Future<Map> login() async {
    final currentUserCredential = await facebookSignInWebServices.login();
    return currentUserCredential;
  }

  Future<void> logout() async {
    await facebookSignInWebServices.logout();
  }
}
