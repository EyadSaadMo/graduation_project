import 'package:covid/modules/Food_Advice/food_advice_screen.dart';
import 'package:covid/modules/recommended_videos/recommended_videos_screen.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HandDistancing extends StatelessWidget {
  const HandDistancing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            defaultAppBar(text: 'COVID_19'),
            SizedBox(
              height: 100,
            ),
            buildAdviceItem(image: 'assets/images/video.png',text: 'فيديوهات توعوية',function: (){
              navigateTo(context, RecommendedScreen());
            }),
            SizedBox(
              height: 30,
            ),
            buildAdviceItem(image: 'assets/images/healthy-food.png',text: 'نصائح غذائية',function: (){
              navigateTo(context, FoodAdvice());
            }),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
  Widget buildAdviceItem({String image,String text,Function function}){
    return Expanded(
      child: GestureDetector(
        child: Container(
          width: 140,
          height: 130,
          decoration: BoxDecoration(
            color: HexColor('#E0F5FF'),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                    child: Image(
                      image: AssetImage('$image'),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('$text'),
              ],
            ),
          ),
        ),
        onTap: function,
      ),
    );
  }
}
