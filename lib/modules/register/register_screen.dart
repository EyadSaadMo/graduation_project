import 'package:conditional_builder/conditional_builder.dart';
import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/login/login_screen.dart';
import 'package:covid/modules/register/cubit/cubit.dart';
import 'package:covid/modules/register/cubit/states.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:covid/shared/component/constants.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit,AppRegisterStates>(
        listener: (context, state)
        {
          if (state is AppRegisterSuccessState)
          {
            if (state.userRegisterAndLoginModel.status)
            {
              print(state.userRegisterAndLoginModel.message);
              print(state.userRegisterAndLoginModel.data.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.userRegisterAndLoginModel.data.token,
              ).then((value)
              {
                token = state.userRegisterAndLoginModel.data.token;

                navigateAndFinish(
                  context,
                  LayoutScreen(),
                );
              });
            } else {
              print(state.userRegisterAndLoginModel.message);

              showToast(
                text: state.userRegisterAndLoginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
           builder: (context,state){
             return  Scaffold(
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
                           ConditionalBuilder(condition: state is ! AppRegisterLoadingState,
                               builder: (context)=>defaultButton(
                                   width: 200,
                                   background: bluelightColor,
                                   function: () {
                                     {
                                       if (formKey.currentState.validate())
                                       {
                                         AppRegisterCubit.get(context).userRegister
                                           (name: nameController.text,
                                             email: emailController.text,
                                             password: passwordController.text,
                                             phone: phoneController.text);


                                       }
                                     }
                                   },
                                   text: 'اشتراك '),
                              fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                           ),


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
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             );
           },
      ),
    );
  }
}
