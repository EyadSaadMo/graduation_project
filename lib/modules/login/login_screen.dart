import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/forgetPassword/forget_password_screen.dart';
import 'package:covid/modules/register/register_screen.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
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
                          // suffix: ShopRegisterCubit.get(context).suffix,
                          // onSubmit: (value)
                          // {
                          //
                          // },
                          // isPassword: ShopRegisterCubit.get(context).isPassword,
                          // suffixPressed: () {
                          //   ShopRegisterCubit.get(context)
                          //       .changePasswordVisibility();
                          // },
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
                            navigateTo(context, ForgetPassword());
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultButton(
                            width: 200,
                            background: bluelightColor,
                            function: () {
                              {
                                if (formKey.currentState.validate()) {
                                  CacheHelper.saveData(key: 'Login', value: true)
                                      .then((value) {
                                    navigateAndFinish(context, LayoutScreen());
                                  });
                                }
                              }
                            },
                            text: 'تسجيل دخول '),
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
  }
}
