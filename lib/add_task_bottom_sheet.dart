import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

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
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 18,
          ),
          Center(
              child: Text(
            '28/8/2024',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 18,
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
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
}
