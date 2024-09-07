import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/login/login.dart';
import 'package:todo_app/login/signup.dart';
import 'package:todo_app/theme/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';

import 'tabs/edit_task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Login.routeName: (context) => Login(),
        SignUp.routeName: (context) => SignUp(),
        EditTaskScreen.routeName: (context) => EditTaskScreen(),
      },
      initialRoute:
          pro.firebaseUser != null ? HomeScreen.routeName : Login.routeName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
