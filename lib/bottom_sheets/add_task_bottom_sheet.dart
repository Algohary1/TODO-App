import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/theme/my_theme_data.dart';
import 'package:todo_app/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Add new task',
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            style: TextStyle(color: Colors.black),
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          TextField(
            style: TextStyle(color: Colors.black),
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Select date',
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
          ),
          SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: () {
              chooseYourDate();
            },
            child: Center(
                child: Text(
                    selectedDate.toString().substring(0, 10),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )
                )),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyThemeData.primaryColor),
                  onPressed: () {
                    TaskModel model = TaskModel(title: titleController.text,
                        userID: FirebaseAuth.instance.currentUser?.uid??'',
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                    FirebaseFunctions.addTask(model).then((value){
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),)
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {

      });
    }
  }
}
