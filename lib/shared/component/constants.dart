import 'package:covid/modules/login/login_screen.dart';
import 'package:covid/shared/network/local/cache_helper.dart';

import 'component.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}
void printFullText(String text)
{
  final pattern= RegExp('.{1,800}'); // 800 the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
 String token='' ;