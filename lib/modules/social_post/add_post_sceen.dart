import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';

class PostScreen extends StatelessWidget {

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: defaultAppBar(context: context, title: 'Create Post', actions: [
            TextButton(
                onPressed: () {
                  var now = DateTime.now();
                  if(SocialCubit.get(context).postImage==null)
                    {
                      SocialCubit.get(context).createPost(
                          dateTime: now.toString(),
                          text: textController.text
                      );
                    }
                  else
                    {
                      SocialCubit.get(context).uploadPost(
                          dateTime: now.toString(),
                          text: textController.text
                      );
                    }
                },
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 16),
                ))
          ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                Center(child: CircularProgressIndicator()),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          SocialCubit.get(context).userModel.image),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mo\'men Ibrahim',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Public',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "What's in your mind...",
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 5,),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                image: DecorationImage(
                                  image: FileImage(SocialCubit.get(context).postImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  Icons.close,
                                  size: 16.0,
                                ),
                              ),
                              onPressed: () {
                                SocialCubit.get(context).removePostImage();
                              },
                            ),
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                    ],
                  ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconlyLight.image),
                            defaultTextButton(function: () {
                              SocialCubit.get(context).getPostImage();
                            }, text: 'Add photo'),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultTextButton(function: () {}, text: '#tags'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
