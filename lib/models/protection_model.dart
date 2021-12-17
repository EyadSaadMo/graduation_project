import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProtectionModel {
  final String image;
  final String text1;
  final String text2;

  ProtectionModel({
    @required this.image,
    @required this.text1,
    @required this.text2,
  });
}

List<ProtectionModel> protection = [
  ProtectionModel(
      image: 'assets/icons/outline_home_white_24dp.png',
      text1: 'البقاء في المنزل',
      text2: 'الحجر الصحي - طريقه  لوقف انتشار \n فيروس كورونا'),
  ProtectionModel(
      image: 'assets/icons/outline_accessibility_white_24dp.png',
      text1: 'الحد من الاجتماعات الشخصيه',
      text2: 'التواصل الاقل - يقلل من فرص الاصابه بالعدوى'),
  ProtectionModel(
      image: 'assets/icons/outline_social_distance_white_24dp.png',
      text1: 'الحفاظ علي التباعد الاجتماعي',
      text2: 'حافظ علي مسافه 2 متر\n علي الأقل بينك وبين أي شخص'),
  ProtectionModel(
      image: 'assets/icons/outline_clean_hands_white_24dp.png',
      text1: 'اغسل يديك بشكل متكرر',
      text2:
          'قم بتنظيف هاتفك ومفتاحك \n وبطاقتك الائتمانيه بعد \n كل خروج الي الشارع'),
  ProtectionModel(
      image: 'assets/icons/outline_masks_white_24dp.png',
      text1: 'متي نستخدم الكمامه ؟',
      text2: 'أرتدي الكمامه اذا شعرت بالمرض \n وعندما تكون مع اشخاص اخرين'),
  ProtectionModel(
      image: 'assets/icons/outline_self_improvement_white_24dp.png',
      text1: 'حافظ على هدوئك',
      text2:
          'احصل علي قس كافي من النوم \n وتناول الطعام الصحي \n وممارسه الرياضه في المنزل'),
  ProtectionModel(
      image: 'assets/icons/outline_chat_white_24dp.png',
      text1: 'التواصل',
      text2: 'تحدث مع الأصدقاء والعائله \n وابق علي اتصال معهم'),
];
