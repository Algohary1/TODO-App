import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bottom_sheets/language_bottomsheet.dart';
import 'package:todo_app/bottom_sheets/theme_bottomsheet.dart';
import 'package:todo_app/login/login.dart';
import 'package:todo_app/theme/my_theme_data.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyThemeData.blackColor)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ThemeBottomsheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyThemeData.blackColor)),
              child: Text('Light',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          Text('Language',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyThemeData.blackColor)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageBottomsheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyThemeData.blackColor)),
              child: Text('Arabic',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ),
          ),
          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Login.routeName);
                },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue
              ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),

            ),
          )
        ],
      ),
    );
  }
}
