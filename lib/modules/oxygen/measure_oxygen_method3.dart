import 'package:covid/modules/oxygen/measure_oxygen_method1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OxygenMethod3 extends StatelessWidget {
  const OxygenMethod3({Key key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '%',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '90',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: Image(
                    image: AssetImage('assets/images/oxygen-saturation2.png'),
                    fit: BoxFit.fill,
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
              height: 70,
            ),
            Text('يمكنك رفع اصبعك عن الكاميرا الآن ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            SizedBox(
              height: 35,
            ),
            Container(
              width: 170,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 3.0,
                    ),
                  ]),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OxygenMethodOne()),
                  );
                },
                child: Text(
                  'المحاولة مرة أخري',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
