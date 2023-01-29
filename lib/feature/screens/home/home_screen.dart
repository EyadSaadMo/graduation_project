
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/protection_model.dart';
import '../../models/symptoms_model.dart';
import '../../widget/component.dart';
import '../layout_screen/cubit/cubit.dart';
import '../layout_screen/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
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
                     defaultAppBar(text: 'COVID_19'),
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'الوقاية',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            buildProtectionItem(protection[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: protection.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'جهة اتصال للطوارئ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        width: double.infinity,
                        height: 109,
                        color: HexColor('#C8E3D4'),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'حالة طوارئ',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '122 ',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                  Spacer(),
                                  IconButton(icon: new Icon(Icons.phone),
                                    onPressed: ()
                                    {
                                      cubit.makePhoneCall('tel:122');
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'روابط مفيده',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        width: double.infinity,
                        height: 140,
                        color: HexColor('#C8E3D4'),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' نصائح بخصوص فيروس كورونا',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              InkWell(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    'https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                                onTap: (){cubit.launchURL('https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public');},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        );
  }

  Widget buildSymptomsItem(SymptomsModel model) {
    return Container(
      width: 100,
      height: 110,
      decoration: BoxDecoration(
        color:model.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container( width: 60,
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
  Widget buildProtectionItem(ProtectionModel model){
    return  Container(
      width: double.infinity,
      height: 110,
      color: Colors.blue.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: HexColor('#AAE3FF'),
              child: Image(image: AssetImage('${model.image}'),),
            ),
            SizedBox(width: 25.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.text1}',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Flexible(
                  child: Text('${model.text2}',

                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
