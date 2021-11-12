import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthenticationWebServices {
  Map userObj = {};

  Future<Map> login() async {
    try {
      await FacebookAuth.instance.login(
        permissions: [
          'public_profile',
          'email',
        ],
      );
      userObj = await FacebookAuth.instance.getUserData();
      print(userObj);
      return userObj;
    } catch (error) {
      print(error);
    }
    return userObj;
  }

  Future<void> logout() async {
    FacebookAuth.instance.logOut().then((value) {
      userObj = {};
    });
  }
}
