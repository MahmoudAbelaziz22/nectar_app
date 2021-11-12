import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar_app/data/repository/facebook_authentication_repository.dart';

part 'facebook_authentication_state.dart';

class FacebookAuthenticationCubit extends Cubit<FacebookAuthenticationState> {
  FacebookAuthenticationCubit(this.facebookSignInRepository)
      : super(FacebookAuthenticationInitial());

  final FacebookSignInRepository facebookSignInRepository;
  late Map facebookCredintial;

  Future<void> login() async {
    emit(FacebookAuthenticationLoading());
    facebookSignInRepository.login().then((value) {
      facebookCredintial = value;
      if (facebookCredintial.isEmpty) {
        emit(FacebookAuthenticationFailure(facebookCredintial));
      } else {
        emit(FacebookAuthenticationSuccess(facebookCredintial));
        return facebookCredintial;
      }
    });
  }

  Future<void> logout() async {
    emit(FacebookAuthenticationLoading());
    facebookSignInRepository.logout().then((_) {
      emit(FacebookAuthenticationLogOut());
    });
  }
}
