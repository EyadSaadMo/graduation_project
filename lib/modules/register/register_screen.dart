import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/login/login_screen.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController= TextEditingController();
    var lastnameController= TextEditingController();
    var emailController= TextEditingController();
    var passwordController= TextEditingController();
    var phoneController= TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor:white,
        elevation: 0.0,
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
                    'اشتراك'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 40.0,
                        color: bluelightColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/welcome.png'),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'أدخل أسمك';
                          }
                        },
                        label: 'الأسم الأول',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: lastnameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'أدخل الأسم الأخير';
                          }
                        },
                        label: 'الأسم الأخير',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'أدخل إيميلك الألكتروني';
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
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'أدخل رقم الهاتف';
                          }
                        },
                        label: 'رقم الهاتف',
                        prefix: Icons.phone,
                      ),
                    ],
                  ),
                ),
                  SizedBox(
                    height: 30.0,
                  ),
            defaultButton(
                width: 200,
                background: bluelightColor,
                function: () {
                  {
                    if (formKey.currentState.validate())
                    {
                      CacheHelper.saveData(key: 'Register', value: true).then((value) {
                        navigateAndFinish(context, LayoutScreen());
                      });

                    }
                  }
                },
                text: 'اشتراك '),

                  SizedBox(height: 7.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigateTo(context, LoginScreen());
                        },
                        child: Text(
                          'تسجيل الدخول' ,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.withOpacity(0.4),
                          ),
                        ),
                      ),
                      Text(
                        '  .أنا مستخدم قديم',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
