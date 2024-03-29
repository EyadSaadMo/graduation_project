import 'package:covid/feature/screens/login/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/end_points.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../models/register_login_model.dart';

class AppLoginCubit extends Cubit<AppLoginStates>{
  AppLoginCubit(): super(AppLoginInitialState());
  static AppLoginCubit get(context) => BlocProvider.of(context);

  AppLoginModel loginModel;
  void userLogin({
    @required String email,
    @required String password,
  })
  {
    emit(AppLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = AppLoginModel.fromJson(value.data);
      emit(AppLoginSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(AppLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AppChangePasswordVisibilityState());
  }
}