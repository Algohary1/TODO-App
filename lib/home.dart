import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TODO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Colors.blue,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Colors.transparent),
        ),
        child: Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(



          elevation: 0,
          backgroundColor: Colors.transparent,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
        ]),
      ),
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 6,
            monthColor: Colors.black,
            dayColor: Colors.teal[300],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          )
        ],
      ),
    );
  }
}
