import 'package:covid/models/register_login_model.dart';

abstract class AppLoginStates{}
class AppLoginInitialState extends AppLoginStates{}
class AppLoginLoadingState extends AppLoginStates{}
class AppLoginSuccessState extends AppLoginStates{
  final UserRegisterAndLoginModel userLoginAndLoginModel;

  AppLoginSuccessState(this.userLoginAndLoginModel);
}
class AppLoginErrorState extends AppLoginStates{
  final String error;

  AppLoginErrorState(this.error);
}
