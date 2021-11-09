import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  PhoneAuthenticationServices({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  String? _phoneAuthVerificationId;

  String phoneAuthVerificationId() {
    return _phoneAuthVerificationId!;
  }

  Future<void> login(String phone) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result =
              await _firebaseAuth.signInWithCredential(credential);
          User user = result.user!;
          print(user);
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          _phoneAuthVerificationId = verificationId;

          // verificationId1 = verificationId;
          // setState(() {
          //   isVerification = true;
          // });
        },
        codeAutoRetrievalTimeout: (_) {});
  }
}
