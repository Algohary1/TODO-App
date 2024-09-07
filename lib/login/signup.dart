import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/login/login.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'signUp';

   SignUp({super.key});

  var emailController=TextEditingController();
  var userNameController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 17, color: Colors.grey[800]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: userNameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.blue.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: confirmPasswordController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.blue.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseFunctions.createAccountAuth(emailController.text, passwordController.text,
                      userName: userNameController.text,
                      onSuccess: (){
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: const Text('Congratulations!'),
                          content: const Text('You signed up successfully'),
                          actions: [
                            ElevatedButton(onPressed: () {
                              Navigator.pushNamed(context, Login.routeName);

                            }, child: const Text('OK'))
                          ],
                        ),);
                      },
                        onError: (error){
                        showDialog(context: context, builder: (context) =>
                          AlertDialog(
                            title: const Text('Error'),
                            content: const Text('error'),
                            actions: [
                              ElevatedButton(onPressed: () {
                                Navigator.pushNamed(context, SignUp.routeName);
                              }, child: const Text('OK!'),),
                              ElevatedButton(onPressed: () {
                                Navigator.pushNamed(context, Login.routeName);
                              }, child: const Text('CANCEL'),)
                            ],
                          )
                          );
                        }
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
    );
  }
}
