import 'package:covid/layout/layout_screen.dart';
import 'package:covid/modules/onBoarding/onBoarding_screen.dart';
import 'package:covid/shared/component/constants.dart';
import 'package:covid/shared/network/local/cache_helper.dart';

import 'package:flutter/material.dart';

import 'modules/login/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(textDirection: TextDirection.ltr, child: LayoutScreen()),
    );
  }
}
