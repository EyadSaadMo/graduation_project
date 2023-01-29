import 'package:flutter/material.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  final String textButton;

  BoardingModel({
    @required this.title,
    @required this.image,
    @required this.body,
    @required this.textButton,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: 'assets/images/onBoardin1.png',
    title: 'مرحبا بك في تطبيق فيروس كورونا المستجد ',
    body:
    'الارتفاع في حالات فيروس كورونا أدي لزيادة الضغط علي الفريق الطبي لذلك قمنا بتطوير هذا التطبيق للتقليل من فرص انتقال العدوى نتيجة قلة احتكاك الطاقم الطبي بالحالة المشتبه في إصابتها',
    textButton: 'هيا بنا نبدأ',
  ),
  BoardingModel(
    image: 'assets/images/onBoarding2.jpg',
    title: 'تطبيق فيروس كورونا المستجد ',
    body: 'يقوم التطبيق بمسح صور الأشعة بالأشعة السينية للصدر تحديد مدي تأثر المريض بفيروس كورونا المستجد بدقة الية وفي وقت قليل بمساعدة أساليب التعلم العميق',
    textButton: 'التالي',
  ),
  BoardingModel(
    image: 'assets/images/onBoarding3.jpg',
    title: 'تطبيق فيروس كورونا المستجد ',
    body: 'يقوم التطبيق بزيادة الوعي بطرق الوقاية من فيروس ورونا والأعراض التي تصاحب الفيروس',
    textButton: 'التالي',
  ),
  BoardingModel(
    image: 'assets/images/onBoarding4.png',
    title: 'تطبيق فيروس كورونا المستجد ',
    body: 'يقوم التطبيق بمتابعة المؤشرات الحيوية لمريض فيروس كورونا مثل قياس معدل ضربات القلب ونسبة الاكسجين في الدم',
    textButton: 'اشتراك',
  ),
];