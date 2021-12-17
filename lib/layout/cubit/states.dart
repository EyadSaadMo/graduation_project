abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppChangeBottomNavState extends AppStates{}
class AppSuccessLaunchCalling extends AppStates{}
class AppErrorLaunchCalling extends AppStates{
  final String error;

  AppErrorLaunchCalling(this.error);

}
class AppLaunchLinks extends AppStates{}
