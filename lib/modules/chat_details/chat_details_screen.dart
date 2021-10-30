import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';
import 'package:social_app/social_model/chat_model.dart';
import 'package:social_app/social_model/user_model.dart';

class ChatDetails extends StatelessWidget {

  SocialUserModel model;

  ChatDetails({this.model});

  var chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          SocialCubit.get(context).getMessage(receiverId: model.uId);
          return BlocConsumer<SocialCubit, SocialStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  titleSpacing: 5.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(model.image),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(model.name)
                    ],
                  ),
                ),
                body: BuildCondition(
                  condition:true ,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index) {
                                var message = SocialCubit.get(context).messages[index];
                                if(SocialCubit.get(context).userModel.uId == message.senderId)
                                  return buildMyChat(message);
                                return buildReceiverChat(message);
                              } ,
                              separatorBuilder: (context,index)=>SizedBox(height: 15,),
                              itemCount: SocialCubit.get(context).messages.length,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey[300],
                                width: 1.0,
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: chatController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Type',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                child: MaterialButton(
                                    minWidth: 1.0,
                                    color: defaultColor.withOpacity(1),
                                    onPressed: () {
                                      SocialCubit.get(context).sendMessage(
                                        receiverId: model.uId,
                                        text: chatController.text,
                                        dateTime: DateTime.now().toString(),
                                      );
                                      chatController.text = '';
                                    },
                                    child: Icon(
                                      IconlyLight.send,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator()),
                ),
              );
            },
          );
        }
    );
  }

  Widget buildMyChat(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(5),
                topStart: Radius.circular(5),
                bottomEnd: Radius.circular(5),
              )),
          child: Text(model.text)),
    );
  }

  Widget buildReceiverChat(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: defaultColor.withOpacity(.7),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(5),
                topStart: Radius.circular(5),
                bottomStart: Radius.circular(5),
              )),
          child: Text(model.text)),
    );
  }
}
