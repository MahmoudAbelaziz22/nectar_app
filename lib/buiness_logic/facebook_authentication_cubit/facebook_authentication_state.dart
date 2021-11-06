part of 'facebook_authentication_cubit.dart';

@immutable
abstract class FacebookAuthenticationState {}

class FacebookAuthenticationInitial extends FacebookAuthenticationState {}

class FacebookAuthenticationLoading extends FacebookAuthenticationState {}

class FacebookAuthenticationLogOut extends FacebookAuthenticationState {}

class FacebookAuthenticationFailure extends FacebookAuthenticationState {
  final facebookCredintial;

  FacebookAuthenticationFailure(this.facebookCredintial);
}

class FacebookAuthenticationSuccess extends FacebookAuthenticationState {
  final facebookCredintial;

  FacebookAuthenticationSuccess(this.facebookCredintial);
}
