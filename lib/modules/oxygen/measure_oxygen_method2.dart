import 'package:covid/modules/oxygen/measure_oxygen_method3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OxygenMethod2 extends StatelessWidget {
  const OxygenMethod2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexColor("#AAE3FF"), HexColor("#19B0FA")])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'هيا نحسب نسبة تشبع الأكسجين ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 240,
              height: 240,
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'من فضلك انتظر قليلا',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OxygenMethod3()),
                      );
                    },
                    child: Image(
                      image: AssetImage('assets/images/oxygen-saturation2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120.0),
                border: Border.all(
                  width: 7,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Text(
                'ضع اصبعك ليغطي علي الكاميرا الخلفية والفلاش \n من فضلك لا تتحدث او تتحرك اثناء اتمام العملية ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
          ]),
        ));
  }
}
