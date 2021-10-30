import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_login/social_login_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cash_helper.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              child:  OutlinedButton(
                onPressed: ()
                {
                  CacheHelper.removeData(key: 'uId').then((value)
                  {
                    if(value)
                    {
                      SocialCubit.get(context).currentIndex=0;
                      navigateAndFinish(context, SocialLoginScreen());

                    }
                  });
                },
                child:Text('SignOut'),
              ),
            ),
          ),
        );
      },
    );
  }
}