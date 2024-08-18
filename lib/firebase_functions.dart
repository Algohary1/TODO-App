import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Task')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel model)async {
    var collection = getTasksCollection();
    var docRef=collection.doc();
    model.id=docRef.id;
    docRef.set(model);
  }




  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime){

    var collection=getTasksCollection();
   return collection.where('date',isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).snapshots();
  }
}
