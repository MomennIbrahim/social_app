import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:social_app/modules/social_post/add_post_sceen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/social_layout/cubit/cubit.dart';
import 'package:social_app/social_layout/cubit/states.dart';
import 'package:social_app/social_model/post_model.dart';

class FeedsScreen extends StatelessWidget {

  var postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: SocialCubit.get(context).posts.length > 0,
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).userModel.image}'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              child: Text(
                                'What\'s on your mind, Mo\'men?',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              onPressed: () {
                                navigateTo(context, PostScreen());
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://image.freepik.com/free-photo/young-brunette-white-casual-sweater-isolated-purple-wall_343596-5605.jpg'),
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Communicate with friends',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItems(
                      SocialCubit.get(context).posts[index], context,index),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItems(PostModel postModel, context,index) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      '${SocialCubit.get(context).userModel.image}'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${postModel.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.check_circle,
                        size: 15,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  Text(
                    '${postModel.dateTime}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(height: 1.3),
                  )
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    // SocialCubit.get(context).removePost(index);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 22.5,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${postModel.text}',
              style: TextStyle(fontSize: 12),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 8),
          //   width: double.infinity,
          //   child: Wrap(
          //     children: [
          //       Container(
          //         height: 17,
          //         child: MaterialButton(
          //           onPressed: () {},
          //           child: Text(
          //             '#Software',
          //             style: TextStyle(color: Colors.blue, fontSize: 12),
          //           ),
          //           minWidth: 1.0,
          //           height: 18,
          //           padding: EdgeInsets.zero,
          //         ),
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Container(
          //         height: 17,
          //         child: MaterialButton(
          //           onPressed: () {},
          //           child: Text(
          //             '#flutter',
          //             style: TextStyle(color: Colors.blue, fontSize: 12),
          //           ),
          //           minWidth: 1.0,
          //           height: 18,
          //           padding: EdgeInsets.zero,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          if(postModel.postImage != '')
            Container(
            margin: EdgeInsets.all(8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image(
              image: NetworkImage(
                '${postModel.postImage}',
              ),
              height: 130,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(
                  IconlyLight.heart,
                  size: 12.5,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '${SocialCubit.get(context).likes[index]}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Spacer(),
                Icon(
                  IconlyLight.chat,
                  size: 12.5,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // navigateTo(context, WriteCommentScreen());
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(
                              '${SocialCubit.get(context).userModel.image}'),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          'Write a comment...',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postId[index]);
                  },
                  child: Row(
                    children: [
                      Icon(
                        IconlyLight.heart,
                        size: 12.5,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
