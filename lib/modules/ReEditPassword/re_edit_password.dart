import 'package:covid/layout/layout_screen.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class ReEditPassword extends StatelessWidget {
  const ReEditPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
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
                CacheHelper.saveData(key: 'saveChanges', value: true)
                    .then((value) {
                  navigateAndFinish(context, LayoutScreen());
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
                    'تسجيل الدخول'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 40.0,
                        color: bluelightColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage(
                        'assets/images/undraw_Access_account_re_8spm.png'),
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
                    label: 'كلمه السر الجديدة',
                    prefix: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: confirmPasswordController,
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
                    label: 'تأكيد كلمه السر',
                    prefix: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      width: 200,
                      background: bluelightColor,
                      function: () {
                        {
                          if (formKey.currentState.validate()) {
                            CacheHelper.saveData(
                                key: 'ReEditPass', value: true).then((value) {
                                  navigateTo(context, LayoutScreen());
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
