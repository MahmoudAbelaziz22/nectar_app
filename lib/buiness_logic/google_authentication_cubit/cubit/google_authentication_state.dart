part of 'google_authentication_cubit.dart';

@immutable
abstract class GoogleAuthenticationState {}

class GoogleAuthenticationInitial extends GoogleAuthenticationState {}

class GoogleAuthenticationLoading extends GoogleAuthenticationState {}

class GoogleAuthenticationLogOut extends GoogleAuthenticationState {}

class GoogleAuthenticationFailure extends GoogleAuthenticationState {
  final googleCredintial;

  GoogleAuthenticationFailure(this.googleCredintial);
}

class GoogleAuthenticationSuccess extends GoogleAuthenticationState {
  final googleCredintial;

  GoogleAuthenticationSuccess(this.googleCredintial);
}
