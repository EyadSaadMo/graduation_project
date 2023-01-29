import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//////////
// allowed food model
class FoodAllowedAdviceModel {
  final String image;
  final String text1;

  FoodAllowedAdviceModel({
    @required this.image,
    @required this.text1,
  });
}

List<FoodAllowedAdviceModel> allowedFood = [

  FoodAllowedAdviceModel(
      image: 'assets/images/healthy-food.png',
      text1: 'ضرورة تناول خمس حصص \n من الفاكهة والخضراوات \n يوميا',
  ),
   FoodAllowedAdviceModel(
      image: 'assets/images/pyramid.png',
      text1: ' اتباع نظام غذائي متوازن مع \n الكربوهيدرات والدهون \n والبروتينات المعتدلة',
  ),
   FoodAllowedAdviceModel(
      image: 'assets/images/water-bottle.png',
      text1: 'الحرص على تناول من 8-10\n  أكواب من الماء يوميا',
  ),
   FoodAllowedAdviceModel(
      image: 'assets/images/coffee.png',
      text1: 'تناول الكثير من السوائل مثل \n الماء الدافئ مع النعناع \nوالزنجبيل للحد من السعال\n الجاف',
  ),
   FoodAllowedAdviceModel(
      image: 'assets/images/vitamins.png',
      text1: 'الحرص على تناول الفيتامينات\n والمعادن ومضادات الأكسدة\n وبالأخص C,D وفيتامين ',
  ),
   FoodAllowedAdviceModel(
      image: 'assets/images/checklist.png',
      text1: '  الحرص على تناول الأطعمة المعززة\n للطاقة مثل الموز أوالتفاح أو البرتقال\nأو عصير الليمون منأجل القضاء على\nالإرهاق بعد الإصابة بكورونا',
  ),

];
/////////////////////////////////////////

// not allowed food model

class NotAllowedFoodModel {
  final String image;
  final String text1;

  NotAllowedFoodModel({
    @required this.image,
    @required this.text1,
  });
}
List<NotAllowedFoodModel> notAllowedFood = [

  NotAllowedFoodModel(
      image: 'assets/images/no-coffee-cups.png',
      text1: 'تجنب المشروبات السكرية والكحولية\nوالقهوةحيث أنها تؤدي إلى\n الجفاف '
  ),
   NotAllowedFoodModel(
      image: 'assets/images/no-fast-food.png',
      text1: 'تجنب أي نوع من الأطعمة المعبأة\n أوالوجبات الخفيفة',
  ),
   NotAllowedFoodModel(
      image: 'assets/images/no-salt.png',
      text1: 'تجنب الأطعمة المالحة لانها تجعل\nالدم أكثر كثافة وهو أمر\n مضر مع فيروس كورونا',
  ),
   NotAllowedFoodModel(
      image: 'assets/images/no-carbs.png',
      text1: 'الحد من تناول الكربوهيدرات المكررة\nمثل السكر والحلويات والكعك \nوالمشروبات المحلاة بالسكر',
  ),

];
