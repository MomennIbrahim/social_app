import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/chat_details/chat_details_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';
import 'package:social_app/social_model/user_model.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildChatItem(SocialCubit.get(context).users[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: SocialCubit.get(context).users.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildChatItem(SocialUserModel model, context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            ChatDetails(
              model: model,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(model.image),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                model.name,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
