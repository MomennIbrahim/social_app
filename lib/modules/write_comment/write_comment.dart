// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_app/shared/components/components.dart';
// import 'package:social_app/social_layout/cubit/cubit.dart';
// import 'package:social_app/social_layout/cubit/states.dart';
//
// class WriteCommentScreen extends StatelessWidget {
//
//   var commentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Comments'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 30,),
//                 Expanded(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       separatorBuilder: (context,index)=> SizedBox(height: 20,),
//                       itemBuilder: (context,index)=> buildCommentItem(context,index),
//                     itemCount: 2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget buildCommentItem(context,index)
//   {
//     return Column(
//       children: [
//         Card(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           elevation: 4.0,
//           child: Row(
//             children:
//             [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundImage: NetworkImage(
//                     '${SocialCubit.get(context).userModel.image}'),
//               ),
//               SizedBox(width: 10,),
//               Expanded(child: Text('Social')),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
