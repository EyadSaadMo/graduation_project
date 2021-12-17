import 'package:covid/models/food_advice_model.dart';
import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FoodAdvice extends StatefulWidget {
  const FoodAdvice({Key key}) : super(key: key);

  @override
  _FoodAdviceState createState() => _FoodAdviceState();
}

class _FoodAdviceState extends State<FoodAdvice> {
  List<Map<String, dynamic>> _cats = [
    {'title': 'المسموح', 'isSelected': true},
    {'title': 'الممنوع', 'isSelected': false},
  ];
  int _currentCat = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultAppBar(text: 'نصائح غذائية'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount: _cats.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return _cartItem(index: index);
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (_cats[0]['isSelected'])
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          buildAllowedFood(allowedFood[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: allowedFood.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),

                  if (_cats[1]['isSelected'])
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          buildRefusedFood(notAllowedFood[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: notAllowedFood.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildAllowedFood(FoodAllowedAdviceModel model){
    return  Container(
      width: double.infinity,
      height: 120,
      color: HexColor('#EBF8FF'),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: HexColor('#EBF8FF'),
                  image: DecorationImage(
                    image: AssetImage('${model.image}'),
                  )
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${model.text1}',
                      style: TextStyle(
                          fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildRefusedFood(NotAllowedFoodModel model){
    return  Container(
      width: double.infinity,
      height: 120,
      color: HexColor('#EBF8FF'),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: HexColor('#EBF8FF'),
                  image: DecorationImage(
                    image: AssetImage('${model.image}'),
                  )
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${model.text1}',
                      style: TextStyle(
                          fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartItem({String text, int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _cats[_currentCat]['isSelected'] = false;
          _currentCat = index;
          _cats[_currentCat]['isSelected'] = true;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 40,
        decoration: BoxDecoration(
          color: _cats[index]['isSelected']
              ? HexColor('#AAE3FF')
              : HexColor('#335F75'),
          // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),topRight: Radius.circular(15.0),),
        ),
        child: Center(
          child: Text(
            _cats[index]['title'],
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
