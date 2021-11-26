import 'package:covid/models/symptoms_model.dart';
import 'package:covid/shared/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(
                    'COVID_19',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: bluelightColor),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: double.infinity,
                  height: 4,
                  color: bluelightColor,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'الأعراض',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                     buildSymptomsItem(symptomModel[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: symptomModel.length,
                    shrinkWrap: true,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (int index){
          setState(() {
            currentIndex=index;
          });
        },
          items: [
            BottomNavigationBarItem( icon: Icon(Icons.access_alarm),label: 'home'),
            BottomNavigationBarItem( icon: Icon(Icons.access_alarm),label: 'categories'),
            BottomNavigationBarItem( icon: Icon(Icons.access_alarm),label: 'favourites'),
            BottomNavigationBarItem( icon: Icon(Icons.access_alarm),label: 'settings'),
          ],
        currentIndex: currentIndex,
      ),
    );
  }

  Widget buildSymptomsItem(SymptomsModel model) {
    Container(
      width: 100,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              width: 60,
              child: Image(
                image: AssetImage('${model.image}'),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Text(
                '${model.text}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Color backgroundColor;
//   final Color titleColor;
//   final String title;
//   final AppBar appBar;
//   final List<Widget> widgets;
//   final RoundedRectangleBorder shape;
//
//   DefaultAppBar({
//     Key key,
//     @required this.title,
//     @required this.appBar,
//     this.widgets,
//     @required this.backgroundColor,
//     this.shape,
//     @required this.titleColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       title: Text(
//         title,
//         style: TextStyle(
//             fontSize: 30.0, fontWeight: FontWeight.bold, color: titleColor),
//       ),
//       backgroundColor: backgroundColor,
//       // actions: [
//       //   Padding(
//       //     padding: EdgeInsets.all(10.0),
//       //     child: Icon(
//       //       Icons.navigate_next,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       // ],
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(5.0),
//           bottomLeft: Radius.circular(5.0),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
// }
