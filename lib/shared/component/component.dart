import 'package:covid/shared/colors/colors.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.lightBlue,
  bool isUpperCase = true,
  double radius = 15.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        textAlign: TextAlign.right,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        enableInteractiveSelection: false,
        autofocus: false,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
            ),
          )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );


void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);

Widget defaultAppBar({
  @required String text,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 30.0,
      ),
      Center(
        child: Text(
          '$text',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: bluelightColor),
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      Container(
        width: double.infinity,
        height: 4,
        color: bluelightColor,
      ),
    ],
  );
}

