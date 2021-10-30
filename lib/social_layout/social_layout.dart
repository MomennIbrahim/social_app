import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},

      builder: (context, state)
      {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  IconlyLight.notification,
                ),
                onPressed: () {
                  print(SocialCubit.get(context).userModel.name);
                },
              ),
              IconButton(
                icon: Icon(
                  IconlyLight.search,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.paperUpload,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.profile,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}