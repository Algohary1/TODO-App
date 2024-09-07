import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/tabs/settings.dart';
import 'package:todo_app/tabs/tasks.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title:  Text(
            'Hello ${pro.userModel?.userName}',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet(),
                );
              },
            );
          },
          backgroundColor: Colors.blue,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
              iconSize: 30,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              ]),
        ),
        body: tabs[selectedIndex]);
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
