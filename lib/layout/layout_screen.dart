import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:covid/layout/cubit/cubit.dart';
import 'package:covid/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      // BlocProvider(
      // create: (context) => AppCubit(),
      // child:
      BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              body: cubit.bottomScreens[cubit.selectedIndex],
              bottomNavigationBar: ConvexAppBar(
                style:TabStyle.reactCircle,
                backgroundColor: Colors.white,

                onTap: (index) {
                  cubit.changeBottom(index);
                },
                items: cubit.bottomItems,
                initialActiveIndex: cubit.selectedIndex,
                activeColor: HexColor('#AAE3FF'),
              ),
            );
          }
      ); }

}

