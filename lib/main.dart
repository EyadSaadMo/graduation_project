

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/cubit.dart';
import 'core/cubit/states.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'feature/screens/layout_screen/cubit/cubit.dart';
import 'feature/screens/layout_screen/layout_screen.dart';
import 'feature/screens/login/login_screen.dart';
import 'feature/screens/onBoarding/onBoarding_screen.dart';
import 'feature/widget/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
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
        BlocProvider(create: (BuildContext context) => CoCubit()),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<CoCubit, ApppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: homeWidget,
            ),
          );
        },
      ),
    );
  }
}
