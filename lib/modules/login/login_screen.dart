import 'package:conditional_builder/conditional_builder.dart';
import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/login/cubit/cubit.dart';
import 'package:covid/modules/login/cubit/states.dart';
import 'package:covid/modules/register/register_screen.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/component/constants.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          listener: (context, state) {
            if (state is AppLoginSuccessState) {
              if (state.loginModel.status ) {
                print(state.loginModel.message);
                print(state.loginModel.data.token);

                CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data.token,
                ).then((value) {
                  token = state.loginModel.data.token;

                  navigateAndFinish(
                    context,
                    LayoutScreen(),
                  );
                });
              } else {
                print(state.loginModel.message);

                showToast(
                  text: state.loginModel.message,
                  state: ToastStates.ERROR,
                );
              }
            }
          }, builder: (context, state) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: white,
            automaticallyImplyLeading: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'تسجيل الدخول'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 40.0,
                          color: bluelightColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Image(
                      image: AssetImage('assets/images/welcome.png'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'أدخل بريدك الألكتروني';
                                }
                              },
                              label: 'البريد الألكتروني',
                              prefix: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              // suffix: AppRegisterCubit.get(context).suffix,
                              // onSubmit: (value)
                              // {
                              //
                              // },
                              // isPassword: AppRegisterCubit.get(context).isPassword,
                              // suffixPressed: () {
                              //   AppRegisterCubit.get(context)
                              //       .changePasswordVisibility();
                              // },
                              suffix: AppLoginCubit.get(context).suffix,
                              onSubmit: (value) {
                                if (formKey.currentState.validate()) {
                                  AppLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isPassword: AppLoginCubit.get(context).isPassword,
                              suffixPressed: () {
                                AppLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'أدخل كلمة سر مكونة من 8 أرقام فأكثر';
                                }
                              },
                              label: 'كلمة السر',
                              prefix: Icons.lock_outline,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            GestureDetector(
                              child: Text(
                                ' هل نسيت كلمه السر ؟ ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () {
                                //navigateTo(context, ForgetPassword());
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! AppLoginLoadingState,
                              builder: (context) => defaultButton(
                                  width: 200,
                                  background: bluelightColor,
                                  function: () {
                                    {
                                      if (formKey.currentState.validate()) {
                                        AppLoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    }
                                  },
                                  text: 'تسجيل دخول '),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, RegisterScreen());
                          },
                          child: Text(
                            'اشتراك',
                            style: TextStyle(
                              fontSize: 18,
                              color: bluelightColor,
                            ),
                          ),
                        ),
                        Text(
                          '  .أنا مستخدم جديد',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
