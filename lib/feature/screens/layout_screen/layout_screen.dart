import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:covid/feature/screens/layout_screen/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cubit/cubit.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
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

