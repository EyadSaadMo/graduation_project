import 'package:covid/layout/cubit/cubit.dart';
import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/login/login_screen.dart';
import 'package:covid/modules/onBoarding/onBoarding_screen.dart';
import 'package:covid/shared/component/constants.dart';
import 'package:covid/shared/cubit/cubit.dart';
import 'package:covid/shared/cubit/states.dart';
import 'package:covid/shared/network/local/cache_helper.dart';
import 'package:covid/shared/network/remote/dio_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  // bool isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'token');
  print(token);
  Widget widget = LayoutScreen();
  if (onBoarding != null) {
    if (token != null)
      widget = LayoutScreen();
    else
      widget = LoginScreen();
  } else
    widget = OnBoardingScreen();

  runApp(MyApp(
    // isDark: isDark,
    homeWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget homeWidget;

  const MyApp({Key key, this.homeWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ApppCubit()),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<ApppCubit, ApppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: OnBoardingScreen(),
            ),
          );
        },
      ),
    );
  }
}
