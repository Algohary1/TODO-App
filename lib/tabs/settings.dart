import 'package:flutter/material.dart';
import 'package:todo_app/bottom_sheets/language_bottomsheet.dart';
import 'package:todo_app/bottom_sheets/theme_bottomsheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) {
               return ThemeBottomsheet();

              },);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.black)
              ),
              child:
              Text('Light',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text('Language', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) {
               return LanguageBottomsheet();
              },);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black)
              ),
              child:
              Text('Arabic',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )
        ],
      ),
    );
  }
}
