import 'package:covid/models/register_login_model.dart';
import 'package:covid/modules/login/cubit/states.dart';
import 'package:covid/shared/network/end_points.dart';
import 'package:covid/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginCubit extends Cubit<AppLoginStates>{
  AppLoginCubit(): super(AppLoginInitialState());
  static AppLoginCubit get(context) => BlocProvider.of(context);

  UserRegisterAndLoginModel userRegisterAndLoginModel;
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
      userRegisterAndLoginModel = UserRegisterAndLoginModel.fromJson(value.data);
      emit(AppLoginSuccessState(userRegisterAndLoginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(AppLoginErrorState(error.toString()));
    });
  }
}