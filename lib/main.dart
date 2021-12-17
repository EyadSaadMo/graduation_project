import 'package:covid/layout/cubit/cubit.dart';
import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/onBoarding/onBoarding_screen.dart';

import 'package:covid/shared/network/local/cache_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: LayoutScreen(),
            ),
          );
        },
      ),
    );
  }
}
// class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Color backgroundColor;
//   final Color titleColor;
//   final String title;
//   final AppBar appBar;
//   final List<Widget> widgets;
//   final RoundedRectangleBorder shape;
//
//   DefaultAppBar({
//     Key key,
//     @required this.title,
//     @required this.appBar,
//     this.widgets,
//     @required this.backgroundColor,
//     this.shape,
//     @required this.titleColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       title: Text(
//         title,
//         style: TextStyle(
//             fontSize: 30.0, fontWeight: FontWeight.bold, color: titleColor),
//       ),
//       backgroundColor: backgroundColor,
//       // actions: [
//       //   Padding(
//       //     padding: EdgeInsets.all(10.0),
//       //     child: Icon(
//       //       Icons.navigate_next,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       // ],
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(5.0),
//           bottomLeft: Radius.circular(5.0),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
// }
