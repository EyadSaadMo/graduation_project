import 'package:covid/models/register_login_model.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppChangeBottomNavState extends AppStates{}
class AppSuccessLaunchCalling extends AppStates{}
class AppErrorLaunchCalling extends AppStates{
  final String error;

  AppErrorLaunchCalling(this.error);

}
class AppLaunchLinks extends AppStates{}


class AppLoadingUserDataState extends AppStates {}

class AppSuccessUserDataState extends AppStates
{
  final AppLoginModel loginModel;

  AppSuccessUserDataState(this.loginModel);
}

class AppErrorUserDataState extends AppStates {}

class AppLoadingUpdateUserState extends AppStates {}

class AppSuccessUpdateUserState extends AppStates
{
  final AppLoginModel loginModel;

  AppSuccessUpdateUserState(this.loginModel);
}

class AppErrorUpdateUserState extends AppStates {}

