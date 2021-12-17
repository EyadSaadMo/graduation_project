import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FoodAdvice extends StatefulWidget {
  const FoodAdvice({Key key}) : super(key: key);

  @override
  _FoodAdviceState createState() => _FoodAdviceState();
}

class _FoodAdviceState extends State<FoodAdvice> {


  List<Map<String, dynamic>> _cats =
  [
    {'title': 'المسموح', 'isSelected': true},
    {'title': 'الممنوع', 'isSelected': false},
  ];
  int _currentCat = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          defaultAppBar(text: 'نصائح غذائية'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: _cats.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return _cartItem(index: index);
                      }),
                ),
              ],
            ),
          )
        ],
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
        width: MediaQuery.of(context).size.width/2,
        height: 40,
        decoration: BoxDecoration(
          color:  _cats[index]['isSelected']
              ? HexColor('#AAE3FF')
              : HexColor('#335F75'),
          // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),topRight: Radius.circular(15.0),),
        ),
        child: Center(child: Text(_cats[index]['title'],style: TextStyle(color: Colors.white,fontSize: 18),),),
      ),
    );
  }
}
