import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {



  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Firebase Auth")
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                //color: Colors.black,
                border: Border.all(color: Colors.cyan, width: 2.0),
                //borderRadius: BorderRadius.circular(35),
              ),
              width: MediaQuery.of(context).size.width * .8,
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  fontSize:20,
                ),
                decoration: InputDecoration(
                  hintText: "Enter the email", suffixStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            Container(
              decoration: BoxDecoration(
                //color: Colors.black,
                border: Border.all(color: Colors.cyan, width: 2.0),
                //borderRadius: BorderRadius.circular(35),
              ),
              width: MediaQuery.of(context).size.width * .8,
              child: TextField(
                controller: passwordController,
                style: TextStyle(
                  fontSize:20,
                ),
                decoration: InputDecoration(
                  hintText: "Password", suffixStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
              ),
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
              },
              child: Text("Log In",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent
              ),
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
              },
              child: Text("Sign Up",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}