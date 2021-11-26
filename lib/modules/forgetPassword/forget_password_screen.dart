import 'package:covid/modules/ReEditPassword/re_edit_password.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
              onPressed: () {
                CacheHelper.saveData(key: 'forgetPass', value: true)
                    .then((value) {
                  navigateAndFinish(context, ReEditPassword());
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'نسيت كلمة السر'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 40.0,
                        color: bluelightColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage(
                        'assets/images/undraw_Forgot_password_re_hxwm.png'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
                  defaultButton(
                      width: 200,
                      background: bluelightColor,
                      function: () {
                        {
                          if (formKey.currentState.validate()) {
                            CacheHelper.saveData(key: 'forgetPass', value: true)
                                .then((value) {
                              navigateAndFinish(context, ReEditPassword());
                            });
                          }
                        }
                      },
                      text: 'تسجيل دخول '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
