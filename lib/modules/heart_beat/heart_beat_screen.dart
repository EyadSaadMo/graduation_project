import 'package:covid/modules/oxygen/homePage.dart';
import 'package:covid/modules/oxygen/oxygen_saturation.dart';
import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';


class HeartBeat extends StatefulWidget {
   HeartBeat({Key key,}) : super(key: key);


  @override
  _HeartBeatState createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              defaultAppBar(text: 'COVID_19'),
              SizedBox(
                height: 20,
              ),
              buildCardItem(
                  image: 'assets/images/oxygen-saturation.png',
                  text: 'تشبع الأكسجين',
                  onTap: () {
                    navigateTo(context,OxygenSaturationScreen());
                  }),
              SizedBox(
                height: 15,
              ),
              buildCardItem(
                  text: 'معدل ضربات القلب ',
                  image: 'assets/images/heart-rate.png',
                  onTap: () {
                    navigateTo(context, MeasureHeartBeat());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardItem({String text, String image, Function onTap}) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
