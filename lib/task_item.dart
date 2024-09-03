import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;

  TaskItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: .5,
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(model.id);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 2,
                  color: model.isDone
                      ? Colors.green : Colors.blue
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                          color: model.isDone
                              ? Colors.green : Colors.black
                          ),
                    ),
                    Text(
                      model.description,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              model.isDone
                  ? Text(
                      'DONE!',
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    )
                  : IconButton(
                      onPressed: () {
                        model.isDone = true;
                        FirebaseFunctions.updateTask(model);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyThemeData.primaryColor,
                          minimumSize: Size(70, 22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      icon: Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
