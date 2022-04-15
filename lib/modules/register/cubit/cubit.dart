import 'package:covid/models/register_login_model.dart';
import 'package:covid/modules/register/cubit/states.dart';
import 'package:covid/shared/network/end_points.dart';
import 'package:covid/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates>{
  AppRegisterCubit(): super(AppRegisterInitialState());
  static AppRegisterCubit get(context) => BlocProvider.of(context);

  UserRegisterAndLoginModel userRegisterAndLoginModel;
  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
})
  {
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
      userRegisterAndLoginModel = UserRegisterAndLoginModel.fromJson(value.data);
      emit(AppRegisterSuccessState(userRegisterAndLoginModel));
    }).catchError((error){
      print(error.toString());
      emit(AppRegisterErrorState(error.toString()));
    });
  }
}