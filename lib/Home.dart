import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
export './Home.dart';
import './Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage>{
  bool _logged = false;
  Future<void> start() async {
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      setState(() {
        _logged = false;
      });
      print('User is currently signed out!');
    } else {
      setState(() {
        _logged = true;
      });
      print('User is signed in!');
    }
  });
    
  }
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    start();
    });
          
  }
  

  @override
  Widget build(BuildContext context) {
    if(!_logged){
      return Login();
    }
    return Container(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text('Instagram'),
          
        ),
        body:Center(
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Log Out'),
          ),
        )
      )
    );
  }
}