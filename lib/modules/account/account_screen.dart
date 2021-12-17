
import 'package:covid/modules/account_settings/account_settings_screen.dart';
import 'package:covid/modules/change_password/change_password_screen.dart';
import 'package:covid/modules/register/register_screen.dart';
import 'package:covid/modules/security%20and%20privacy/security_privacy_screen.dart';
import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          defaultAppBar(text: 'COVID_19'),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                    )
                  ),
                ),
                Text('اسم المستخدم ',style: TextStyle(fontSize: 18),),
                Text('البريد الالكتروني '),
                SizedBox(height: 15,),
                buildCardItem(text: 'اعدادات الحساب ',onPressed: (){
                  navigateTo(context, AccountSettingsScreen());
                }),
                SizedBox(height: 5,),
                buildCardItem(text: 'تغيير كلمة السر  ',onPressed: (){
                  navigateTo(context, ChangePasswordScreen());
                }),
                SizedBox(height: 5,),
                buildCardItem(text: 'الأمان والخصوصية  ',onPressed: (){
                  navigateTo(context, SecurityAndPrivacyScreen());
                }),
                SizedBox(height: 5,),
                buildCardItem(text: 'تسجيل الخروج  ',onPressed: (){
                  navigateTo(context, RegisterScreen());
                }),
                SizedBox(height: 5,),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCardItem({String text,Function onPressed}){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        child: Card(
          color: Colors.white,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            height: 60,
            child: Text( text,style: TextStyle(fontSize: 18),),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
