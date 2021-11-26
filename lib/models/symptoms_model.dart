import 'package:flutter/cupertino.dart';

class SymptomsModel {
  final String image;
  final String text;

  SymptomsModel({
    @required this.image,
    @required this.text,
  });
}

List<SymptomsModel> symptomModel = [
  SymptomsModel(
    image: 'assets/icons/fever.png',
    text: 'حمي',
  ),
  SymptomsModel(
    image: 'assets/icons/dry-cough.png',
    text: 'سعال',
  ),
  SymptomsModel(
    image: 'assets/icons/fatigue.png',
    text: 'إرهاق',
  ),
  SymptomsModel(
    image: 'assets/icons/lack-of-air.png',
    text: 'ضيق تنفس',
  ),
  SymptomsModel(
    image: 'assets/icons/loss-of-sense-of-smell.png',
    text: 'فقدان حاسة الشم أو التذوق',
  ),
];
