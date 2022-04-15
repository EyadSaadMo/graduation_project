import 'package:covid/models/register_login_model.dart';

abstract class AppRegisterStates{}
class AppRegisterInitialState extends AppRegisterStates{}
class AppRegisterLoadingState extends AppRegisterStates{}
class AppRegisterSuccessState extends AppRegisterStates{
  final UserRegisterAndLoginModel userRegisterAndLoginModel;

  AppRegisterSuccessState(this.userRegisterAndLoginModel);
}
class AppRegisterErrorState extends AppRegisterStates{
  final String error;

  AppRegisterErrorState(this.error);
}
