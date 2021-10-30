// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_app/shared/cubit/states.dart';
// import 'package:social_app/shared/network/local/cash_helper.dart';
// import 'package:sqflite/sqflite.dart';
//
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitialState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//   List<String> title = [
//     'New Tasks',
//     'Done Tasks',
//     'Archived Tasks',
//   ];
//
//   Database database;
//
//   List<Map> newTasks = [];
//
//   List<Map> doneTasks = [];
//
//   List<Map> archivedTasks = [];
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomState());
//   }
//
//   void createDatabase() {
//     openDatabase('todo.db', version: 1, onCreate: (database, version) {
//       print('Database Created');
//       database
//           .execute(
//               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//           .then((value) {
//         print('Table Created');
//       }).catchError((error) {
//         print('Error when Database creating ${error.toString()}');
//       });
//     }, onOpen: (database) {
//       getData(database);
//       print('Database Opened');
//     }).then((value) {
//       database = value;
//       emit(AppCreatDataBaseState());
//     });
//   }
//
//   Future insertToDatabase({
//     @required title,
//     @required time,
//     @required date,
//   }) async {
//     return await database.transaction((txn) {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")')
//           .then((value) {
//         print('$value Data inserted');
//         emit(AppInsertDataBaseState());
//
//         getData(database);
//       }).catchError((error) {
//         print('Error when inserting data ${error.toString()}');
//       });
//       return null;
//     });
//   }
//
//   void getData(database) {
//     newTasks = [];
//
//     doneTasks = [];
//
//     archivedTasks = [];
//
//     emit(AppGetDataBaseLoodingState());
//     database.rawQuery('SELECT * FROM tasks').then((value) {
//       value.forEach((element) {
//         if (element['status'] == 'new') {
//           newTasks.add(element);
//         } else if (element['status'] == 'done') {
//           doneTasks.add(element);
//         } else {
//           archivedTasks.add(element);
//         }
//       });
//       emit(AppGetDataBaseState());
//     });
//   }
//
//   void updateData({
//     @required String status,
//     @required int id,
//   }) {
//     database.rawUpdate(
//       'UPDATE tasks SET status = ? WHERE id = ?',
//       ['$status', '$id'],
//     ).then((value) {
//       getData(database);
//       emit(AppUpdateState());
//     });
//   }
//
//   void deleteData({
//     @required int id,
//   }) {
//     database.rawDelete(
//         'DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//       getData(database);
//       emit(AppDeleteState());
//     });
//   }
//
//   bool isbottoSheetShown = false;
//   IconData fabIcon = Icons.edit;
//
//   void isBottomSheet({
//     @required isShow,
//     @required IconData icon,
//   }) {
//     isbottoSheetShown = isShow;
//     fabIcon = icon;
//     emit(AppisbottoSheetShownState());
//   }
//
//   bool isDark = true;
//
//   void changeAppMode({bool fromShared})
//   {
//     if(fromShared != null)
//       {
//         isDark=fromShared;
//       }
//     else{
//       isDark = !isDark ;
//     }
//     CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value){
//       emit(AppChangeModeState());
//     });
//   }
//
//   IconData icon = Icons.brightness_2;
//
//   changeActionIcon()
//   {
//     if(isDark)
//       icon = Icons.brightness_2;
//     else
//      icon = Icons.brightness_2_outlined;
//   }
//
// }
