part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final ShopLoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState({required this.error});
}
