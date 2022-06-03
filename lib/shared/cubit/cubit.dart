import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid/shared/cubit/states.dart';


class ApppCubit extends Cubit<ApppStates> {
  ApppCubit() : super(ApppInitialState());

  static ApppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ApppChangeBottomNavBarState());
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(ApppChangeBottomSheetState());
  }
}