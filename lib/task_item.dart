import 'package:flutter/material.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;
   TaskItem({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 2,
            color: MyThemeData.primaryColor,
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  model.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
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
    );
  }
}
