import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nectar_app/data/repository/phone_authentication_repository.dart';

part 'phone_authentication_state.dart';

class PhoneAuthenticationCubit extends Cubit<PhoneAuthenticationState> {
  PhoneAuthenticationCubit(
      this.phoneAuthenticationRepository, this.firebaseAuth)
      : super(PhoneAuthenticationInitial());

  final PhoneAuthenticationRepository phoneAuthenticationRepository;
  final FirebaseAuth firebaseAuth;
  late UserCredential userCredential;
  User? _user;
  Future<void> sendOTP(String phoneNumber) async {
    emit(PhoneAuthenticationLoading());

    phoneAuthenticationRepository.login(phoneNumber).then((_) async {
      emit(PhoneAuthenticationOTPSent());
    });
  }

  Future<void> login(String smsCode) async {
    String verificationId = phoneAuthenticationRepository.verificationId();
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    firebaseAuth.signInWithCredential(credential).then((value) {
      UserCredential result = value;
      emit(PhoneAuthenticationSuccess(result));
      _user = result.user!;
      print(_user);
      return _user;
    });
    //  return _user!;
  }
}
