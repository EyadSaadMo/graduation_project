
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../widget/component.dart';

class ChangePasswordScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var oldPasswordController = TextEditingController();
    var newpasswordController = TextEditingController();
    var confirmnewPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultAppBar(text: 'تغيير كلمة السر '),
                SizedBox(height: 100,),
                defaultFormField(
                  controller: oldPasswordController,
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
                  label: 'كلمه السر القديمة',
                  prefix: Icons.lock_outline,
                ),
                SizedBox(height: 15,),
                defaultFormField(
                  controller: newpasswordController,
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
                  controller: confirmnewPasswordController,
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
                  label: 'تأكيد كلمه السر الجديدة',
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
                              key: 'changePassword', value: true);
                        }
                      }
                    },
                    text: ' حفظ التغييرات  '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
