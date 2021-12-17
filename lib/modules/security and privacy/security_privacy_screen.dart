import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';

class SecurityAndPrivacyScreen extends StatelessWidget {
  const SecurityAndPrivacyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              defaultAppBar(text: 'الأمان والخصوصية'),
              SizedBox(height: 15.0,),
              Expanded(child: Text('_ اذا كنت ترغب في تلقي تحديثات مستمرة للمعلوماتمن خلال التطبيق يجب عليك تزويدنا بعنوانك الالكتروني ومعلوماتك الشخصية حتي نتمكن من تقديم التحديثات عبر البريد الالكتروني '),),
              Expanded(child: Text('_ باستخدام التطبيق او تقديم معلوماتك الشخصية فانك توافق علي جمع معلوماتك الشخصية واستخدامها '),),
              Expanded(child: Text('_ سنتعامل مع معلوماتك الشخصية بطريقة مسؤولة تضمن خصوصيتها ودقتها وأمانها '),),
              Expanded(child: Text('_ اننا نجمع معلوماتك الشخصية من أجل تزويدك بخدمات التحديث عبر بريدك الالكتروني '),),
              Expanded(child: Text('_ لن يتم الافحاص عن معلوماتك الشخصية لاي طرف تالت  '),),
              Expanded(child: Text('_ يمكنك تحديث معلوماتك الشخصية عن طريق الاتصال بنا سنتعامل مع طلبك خلال فترة زمنية معقولة  '),),
            ],
          ),
        ),
      ),
    );
  }
}
