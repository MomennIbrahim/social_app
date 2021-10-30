import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_login/social_login_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/style/themes.dart';
import 'package:social_app/social_layout/cubit/states.dart';
import 'package:social_app/social_layout/social_layout.dart';
import 'shared/bloc_observe.dart';
import 'shared/constens/constens.dart';
import 'shared/network/local/cash_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'social_layout/cubit/cubit.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print(message.data.toString());
  showToast(text: 'on backGround Message', state: ToastStates.SUCCESS);
}

void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  var token = await FirebaseMessaging.instance.getToken();

  print(token);

  //  وانا فاتح الابلكيشن

  FirebaseMessaging.onMessage.listen((event)
  {
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);
  });

  // والابلكيشن ف الباك جراوند
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    showToast(text: 'on message opened', state: ToastStates.SUCCESS);
  });


  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();


  Widget widget;

  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');

  // if(onBoarding != null)
  // {
  //   if(token != null) widget = ShopLayout();
  //   else widget = ShopLoginScreen();
  // } else
  //   {
  //     widget = OnBoardingScreen();
  //   }

  if(uId != null)
  {
    widget = SocialLayout();
  } else
  {
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build
  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SocialCubit()..getUserData()..getPosts(),
        ),
      ],
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}

// ./gradlew signingReport