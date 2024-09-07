import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName='edit';

   const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model= ModalRoute.of(context)!.settings.arguments as TaskModel;
    DateTime selectedDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen', style: TextStyle(
          color: Colors.black
              ,fontWeight: FontWeight.w500,
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text('Edit task',style: TextStyle(
                  fontWeight: FontWeight.w500,fontSize: 20
                ),),
                const Spacer(),
                TextFormField(
                  initialValue: model.title,
                  onChanged: (value) {
                    model.title=value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const Spacer(),
                TextFormField(
                  initialValue: model.description,
                  onChanged: (value) {
                    model.description=value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),

                  const Spacer(),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Selected Date', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),)),

                 InkWell(
                   onTap: () async {
                     DateTime? newDate= await chooseYourDate();
                     if(newDate !=null){
                       model.date=newDate.millisecondsSinceEpoch;
                       setState(() {});
                     }
                   },
                   child: Text( DateFormat.yMd().format(DateUtils.dateOnly(
                     DateTime.fromMillisecondsSinceEpoch(model.date??0)
                   )),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500

                                   ),),
                 ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 60),
                    backgroundColor: Colors.blue
                  ),
                  onPressed: () async {
                    await FirebaseFunctions.updateTask(model);
                    Navigator.pop(context);

                }
                , child: const Text('Save changes', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
                ),),),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365),)
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {

      });
    }
    return chosenDate;
  }
}

