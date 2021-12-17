import 'package:bloc/bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:covid/layout/cubit/states.dart';
import 'package:covid/modules/account/account_screen.dart';
import 'package:covid/modules/camera/camera_screen.dart';
import 'package:covid/modules/hand_distancing/hand_distancing_screen.dart';
import 'package:covid/modules/heart_beat/heart_beat_screen.dart';
import 'package:covid/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  var selectedIndex = 0;
  List<TabItem> bottomItems =
  [
    TabItem( icon: Icon(Icons.home,color: Colors.blue.shade200),),
    TabItem( icon: Icon(Icons.handyman,color: Colors.blue.shade200),),
    TabItem( icon: Icon(Icons.camera_alt,color:Colors.blue.shade200),),
    TabItem( icon: Icon(Icons.favorite_border_outlined,color: Colors.blue.shade200)),
    TabItem( icon: Icon(Icons.person,color: Colors.blue.shade200)),
  ];
  List<Widget> bottomScreens =
  [
    HomeScreen(),
    HandDistancing(),
    Camera(),
    HeartBeat(),
    Account(),
  ];

  void changeBottom(int index) {
    selectedIndex = index;
    emit(AppChangeBottomNavState());
  }


  static const _url = 'https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public';

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url).then((value) {
        emit(AppSuccessLaunchCalling());
      }).catchError((error){
        emit(AppErrorLaunchCalling(error.toString()));
      });
    } else {
      throw 'Could not launch $url';
    }
  }
  void launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
    emit(AppLaunchLinks());
  }


}