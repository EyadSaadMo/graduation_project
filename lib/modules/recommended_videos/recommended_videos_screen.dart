import 'package:covid/layout/cubit/cubit.dart';
import 'package:covid/layout/cubit/states.dart';
import 'package:covid/models/recommended_videos_model.dart';
import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> l1 = [
      'https://youtu.be/7Mv6NJXE1ag',
      'https://youtu.be/SQuYuraoabA',
    ];
    List<String> l2 = [
      'https://youtu.be/9tTg54rbEjc',
      'https://youtu.be/THuB7ZjmIdE',
      'https://youtu.be/u0RZbidvSSw',
    ];
    return BlocConsumer<AppCubit,AppStates>
      (listener: (context,state){},
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
                    defaultAppBar(text: 'فيديوهات توعوية'),
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
                    GestureDetector(
                      child: buildSafeItem(tiredVideos[0],),
                      onTap: (){
                        cubit.launchURL('https://youtu.be/sEWnGIQTIII');
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'الإحتياطات',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 240,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildSafeItem(
                              safeVideos[index],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount: safeVideos.length,
                          shrinkWrap: true,
                        ),
                      ),
                      onTap: (){
                        cubit.launchURL( l1.length.toString());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'العلاج الطبيعي',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildSafeItem(
                            fitness[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        itemCount: fitness.length,
                        shrinkWrap: true,
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
}

Widget buildSafeItem(VideosModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 150,
            width: 220,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red.shade700,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            height: 130,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('${model.image}'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 110,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}, ),
            ),
          ),

        ],
      ),
      Text('${model.text1}'),
      Text('${model.text2}'),
    ],
  );
}
