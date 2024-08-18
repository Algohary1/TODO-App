import 'package:flutter/material.dart';

class ThemeBottomsheet extends StatelessWidget {
  const ThemeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Light', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              Icon(Icons.done)
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              // Icon(Icons.done)
            ],
          )
        ],
      ),
    );
  }
}
