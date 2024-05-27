import 'package:flutter/material.dart';
export './Login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './SignUp.dart';
// import './Theme.dart';
class Login extends StatefulWidget{

  State<StatefulWidget> createState() => _Login();
} 
class _Login extends State<Login>{
  
  
  @override
  Widget build(BuildContext context) {
    // String Username = '';
    // String password = '';
    final Username = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: Text("Login"),
        centerTitle: true,
        flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
              end: Alignment.bottomLeft,
          colors: <Color>[                Color.fromARGB(255, 211, 213, 215),
                Color.fromARGB(255, 227, 210, 208),]),
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
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English (US)'),
                Icon(FontAwesomeIcons.instagram,color: Colors.purple, size: 70.0),
                Text('')
              ]
            ),
            ),
          Expanded( 
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: Username,
                    decoration: const InputDecoration(constraints: BoxConstraints.expand(height: 65, width: double.infinity),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Username, email or mobile number',
                      labelText: 'Username, email or mobile number',
                    ),
                  ),
                ),
                
                Padding(
                  
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(constraints: BoxConstraints.expand(height: 65, width: double.infinity),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    

                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        print('${Username.text}, ${password.text}');

                        try {
                          final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: Username.text, 
                            password: password.text,
                          );
                          FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                              if (user != null) {
                                print(user.uid);
                              }
                            });
                        } on FirebaseAuthException catch (e) {
                          print('Error: ${e.message}');
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 2, 111, 199)),
                        minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 45)),
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
                  ),

                InkWell(
                  child: const Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.w500)),
                  onTap: ()=>{print('TAPPED')},
                ),
            ],
            ),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Padding(padding: const EdgeInsets.only(left: 20,right:20,bottom: 10),
                child: Column(
                  children: [
                  ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()));
                    // final NewUser = FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'email@abc.com', password: 'password');
                    // FirebaseAuth.instance
                    // .authStateChanges()
                    // .listen((User? user) {
                    //   if (user != null) {
                    //     print(user.uid);
                    //   }
                    // });
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
                    'Create New Account', 
                    style: TextStyle(color: Color.fromARGB(255, 2, 111, 199))
                    
                  )
                ),
                const Text(''),
                const Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(FontAwesomeIcons.meta),Padding(padding: EdgeInsets.only(left: 10)), Text('NOT META')]
                )
                ],)
              ),
                
          ],)
          )
        ],)
        ),
        )
    );
  }
}