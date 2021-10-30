// Post
// GET
//Update
//Delete

// BaseUrl: https://newsapi.org/
// method(url): v2/top-headlines?
// queries : country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

//ApiSearch :

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:social_app/modules/social_login/social_login_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cash_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        SocialLoginScreen(),
      );
    }
  });
}

String token = '';
String uId = '';