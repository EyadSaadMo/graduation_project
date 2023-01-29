import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class SymptomsModel {
  final String image;
  final String text;
  final HexColor color;

  SymptomsModel({
    @required this.image,
    @required this.text,
    @required this.color,
  });
}

List<SymptomsModel> symptomModel = [
  SymptomsModel(
    image: 'assets/icons/fever.png',
    text: 'حمي',
    color: HexColor('#AAE3FF'),
  ),
  SymptomsModel(
    image: 'assets/icons/dry-cough.png',
    text: 'سعال',
    color: HexColor('#F6D7A7'),
  ),
  SymptomsModel(
    image: 'assets/icons/fatigue.png',
    text: 'إرهاق',
    color: HexColor('#CAB8FF'),
  ),
  SymptomsModel(
    image: 'assets/icons/lack-of-air.png',
    text: 'ضيق تنفس',
    color: HexColor('#F0F38A'),
  ),
  SymptomsModel(
    image: 'assets/icons/loss-of-sense-of-smell.png',
    text: 'فقدان حاسة الشم أو التذوق',
    color: HexColor('#C1DFCE'),
  ),
];
