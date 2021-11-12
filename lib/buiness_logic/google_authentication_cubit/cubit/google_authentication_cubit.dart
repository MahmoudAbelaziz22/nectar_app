import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nectar_app/data/repository/google_authentication_repository.dart';

part 'google_authentication_state.dart';

class GoogleAuthenticationCubit extends Cubit<GoogleAuthenticationState> {
  GoogleAuthenticationCubit(this.googleSignInRepository)
      : super(GoogleAuthenticationInitial());

  final GoogleSignInRepository googleSignInRepository;

  late UserCredential currentUserCredential;

  Future<void> login() async {
    emit(GoogleAuthenticationLoading());

    googleSignInRepository.login().then((credential) {
      currentUserCredential = credential;

      if (currentUserCredential.user == null) {
        emit(GoogleAuthenticationFailure(currentUserCredential));
        return currentUserCredential;
      } else {
        emit(GoogleAuthenticationSuccess(currentUserCredential));
        return currentUserCredential;
      }
    });
  }

  Future<void> logOut() async {
    emit(GoogleAuthenticationLoading());

    googleSignInRepository.logout().then((_) {
      emit(GoogleAuthenticationLogOut());
    });
  }
}
