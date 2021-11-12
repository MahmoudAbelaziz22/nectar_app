import 'package:nectar_app/data/web_services/phone_authentication_services.dart';

class PhoneAuthenticationRepository {
  final PhoneAuthenticationServices phoneAuthenticationServices;

  PhoneAuthenticationRepository(this.phoneAuthenticationServices);

  String verificationId() {
    return phoneAuthenticationServices.phoneAuthVerificationId();
  }

  Future<void> login(String phone) async {
    await phoneAuthenticationServices.login(phone);
  }
}
