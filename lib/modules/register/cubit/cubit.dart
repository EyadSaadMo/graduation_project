import 'package:covid/models/register_login_model.dart';
import 'package:covid/modules/register/cubit/states.dart';
import 'package:covid/shared/network/end_points.dart';
import 'package:covid/shared/network/remote/dio_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  AppLoginModel loginModel;

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,

  }) {
    emit(AppRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data:
        {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,

        }
    ).then((value) {
      print(value.data);
      loginModel = AppLoginModel.fromJson(value.data);
      emit(AppRegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AppRegisterChangePasswordVisibilityState());
  }
}