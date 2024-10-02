part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const AuthSignUp({required this.email, required this.password, required this.name});
}



final class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  const AuthSignIn({required this.email, required this.password});
}

final class AuthSignOut extends AuthEvent {

 
}

class AuthSignUpWithGoogle extends AuthEvent {}
class AuthSignInWithGoogle extends AuthEvent {}

class AuthSignUpWithApple extends AuthEvent {}



final class AuthIsUserLoggedIn extends AuthEvent {}


final class AuthForgotPassword extends AuthEvent {
  final String email;

  const AuthForgotPassword({required this.email, });
}


final class AuthForgotPasswordWithToken extends AuthEvent {
  final String email;
  final String password;
  final String token;

  const AuthForgotPasswordWithToken({required this.email, required this.password, required this.token,});
}