import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bottom_sheets/language_bottomsheet.dart';
import 'package:todo_app/bottom_sheets/theme_bottomsheet.dart';
import 'package:todo_app/my_theme_data.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme', style:GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyThemeData.blackColor
          )),
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
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: MyThemeData.blackColor)
              ),
              child:
              Text('Light',style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.blue
              )),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text('Language', style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyThemeData.blackColor
          )),
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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyThemeData.blackColor)
              ),
              child:
              Text('Arabic',style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              )),
            ),
          )
        ],
      ),
    );
  }
}
