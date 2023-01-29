
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/colors/colors.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../models/onBoarding_model.dart';
import '../../widget/component.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: bluelightColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          onPressed: submit,
          child: Text(
            'تخطي',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text(
            'covid-19'.toUpperCase(),
            style: TextStyle(
                fontSize: 40.0,
                color: bluelightColor,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${model.body}',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          defaultButton(
              width: 150,
              background: bluelightColor,
              function: () {
                {
                  {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  }
                }
              },
              text: model.textButton),
          SizedBox(
            height: 20.0,
          ),
          SmoothPageIndicator(
            controller: boardController,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: bluelightColor,
              dotHeight: 10,
              expansionFactor: 4,
              dotWidth: 10,
              spacing: 5.0,
            ),
            count: boarding.length,
          ),
          SizedBox(height: 100,),
        ],
      );
}
