import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/task_item.dart';

class TasksTab extends StatefulWidget {
   TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
DateTime dateTime=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            dateTime=date;
            setState(() {

            });
          },
          leftMargin: 6,
          monthColor: Colors.black,
          dayColor: Colors.teal[300],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              } if (snapshot.hasError){
                return Column(
                  children: [
                    Text('Something went wrong'),
                    ElevatedButton(onPressed: () {}, child: Text('Try again'))
                  ],
                );
              }
              var tasks=snapshot.data?.docs.map((doc) => doc.data()).toList();
              if(tasks?.isEmpty?? true){
                return Text('No Tasks');
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(model: tasks[index]);
                },
                itemCount: tasks!.length,
              );
            },
          ),
        )
      ],
    );
  }
}
