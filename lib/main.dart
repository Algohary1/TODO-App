import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/my_theme_data.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),

      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
