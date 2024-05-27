// import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export './SignUp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './SignUpEmail.dart';
class Signup extends StatefulWidget{

  State<StatefulWidget> createState() =>  _Signup();
}

class _Signup extends State<Signup>{
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
              end: Alignment.bottomLeft,
          colors: <Color>[
            Color.fromARGB(255, 211, 213, 215),
            Color.fromARGB(255, 227, 210, 208),
            ]
            ),
          ),
        ),       
      ),

      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 211, 213, 215),
                Color.fromARGB(255, 227, 210, 208),
              ],
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Expanded(
              // height: double.infinity,
              // width: double.infinity,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('What\'s your mobile number?'),
                  const Text("Enter the mobile number where you can be contacted. No one will see this on your profile"),
                  TextField(
                    
                    controller: phone,
                    decoration: const InputDecoration(constraints: BoxConstraints.expand(height: 65, width: double.infinity),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Mobile Number',
                      labelText: 'Mobile Number',
                    ),
                  ),
                  const Text('You may recieve SMS notifications from us for security purposes.'),
                  ElevatedButton(
                      onPressed: () async {
                        // final newUser = await FirebaseAuth.instance.verifyPhoneNumber(
                        //   phoneNumber: '+1 312 686 4511',
                        //   verificationCompleted: (PhoneAuthCredential credential) {},
                        //   verificationFailed: (FirebaseAuthException e) {},
                        //   codeSent: (String verificationId, int? resendToken) {},
                        //   codeAutoRetrievalTimeout: (String verificationId) {},
                        // );
                        // FirebaseAuth.instance
                        //     .authStateChanges()
                        //     .listen((User? user) {
                        //       if (user != null) {
                        //         print(user.uid);
                        //       }
                        //     });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 2, 111, 199)),
                        minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity,50)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login', 
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupEmail()));
                  }, 
                  
                  style: ButtonStyle(
                        surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.blue),
                        elevation: const WidgetStatePropertyAll<double>(3),
                        backgroundColor: const WidgetStatePropertyAll<Color>(Color.fromARGB(255, 227, 210, 208)),
                        minimumSize: const WidgetStatePropertyAll<Size>(Size(double.infinity, 45)), 
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                        ), 
                      ), 
                      
                  child: const Text(
                    'Sign up with email', 
                    style: TextStyle(color: Color.fromARGB(255, 2, 111, 199))
                    
                  )
                ),
                ],
              ),
            ),
          )
        )
      )




    );
  }
}