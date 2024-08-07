import 'package:flutter/material.dart';

class LanguageBottomsheet extends StatelessWidget {
  const LanguageBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Arabic', style: TextStyle(
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
              Text('English',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              Icon(Icons.done)
            ],
          )
        ],
      ),
    );
  }
}
