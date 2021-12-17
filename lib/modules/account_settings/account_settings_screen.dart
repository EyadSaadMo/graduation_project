
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var ageController = TextEditingController();
    var genderController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                defaultAppBar(text: 'اعدادات الحساب ',),
                SizedBox(height: 20,),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(120.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/Profile-Avatar-PNG.png'),
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Icon(Icons.camera_alt,color: Colors.white,),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
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
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: ageController,
                  type: TextInputType.number,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'أدخل سنك';
                    }
                  },
                  label: 'العمر ',
                  prefix: Icons.phone,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: genderController,
                  type: TextInputType.text,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'ما جنسك ';
                    }
                  },
                  label: 'النوع ',
                  prefix: Icons.person,
                ),
                SizedBox(height: 15,),
                defaultButton(
                    width: 200,
                    background: bluelightColor,
                    function: () {
                      {
                        if (formKey.currentState.validate())
                        {
                          CacheHelper.saveData(key: 'account_info', value: true);

                        }
                      }
                    },
                    text: 'حفظ التغييرات  '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
