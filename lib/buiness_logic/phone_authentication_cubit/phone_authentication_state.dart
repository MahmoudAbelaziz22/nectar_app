part of 'phone_authentication_cubit.dart';

@immutable
abstract class PhoneAuthenticationState {}

class PhoneAuthenticationInitial extends PhoneAuthenticationState {}

class PhoneAuthenticationLoading extends PhoneAuthenticationState {}

class PhoneAuthenticationOTPSent extends PhoneAuthenticationState {}

class PhoneAuthenticationFailure extends PhoneAuthenticationState {
  final phoneCredintial;

  PhoneAuthenticationFailure(this.phoneCredintial);
}

class PhoneAuthenticationSuccess extends PhoneAuthenticationState {
  final phoneCredintial;

  PhoneAuthenticationSuccess(this.phoneCredintial);
}
