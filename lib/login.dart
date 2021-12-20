import 'package:bioshop/LoginAdmin.dart';
import 'package:bioshop/Reset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';



import 'About.dart';
import 'animation/FadeAnimation.dart';
import 'main.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email,_password;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

          backgroundColor: Colors.white,

          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(

                  image: AssetImage('assets/test2.jpg'),
                  fit: BoxFit.fill,


                )
            ),
            child: SingleChildScrollView(

              child: Container(

                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 120,
                            height: 265,
                            child: FadeAnimation(1, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/rose.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            left: 170,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.3, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/bee.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            right: 20,
                            top: 40,
                            width: 140,
                            height: 150,
                            child: FadeAnimation(1.5, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(

                                      image: AssetImage('assets/bleXD.png'),

                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            child: FadeAnimation(1.6, Container(
                              margin: EdgeInsets.only(top: 65),
                              child: Center(
                                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(1.8, Container(

                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 50.0,
                                        offset: Offset(0, 10)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height:80,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                    ),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {
                                          _email = value.trim();
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(color: Colors.white,fontSize: 20)

                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      obscureText: true,

                                      cursorColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {
                                          _password = value.trim();
                                        });
                                      },
                                      decoration: InputDecoration(


                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.white,fontSize: 20)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                            SizedBox(height: 20),
                            FadeAnimation(2,
                                new GestureDetector(
                                    onTap: () => Signin(_email, _password),


                                    child: new Container(
                                     height: 60,

                                     decoration: BoxDecoration(
                                         border: Border.all(width: 5),
                                         borderRadius: BorderRadius.circular(10),
                                         gradient: LinearGradient(
                                         colors: [
                                           Colors.teal,
                                           Colors.teal,
                                      ]
                                  )
                              ),
                              child: Center(
                                child: Text("Sign in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
                              ),
                            )),
                            ),
                            SizedBox(height: 20,),
                            FadeAnimation(2,
                              new GestureDetector(
                                  onTap: () => Signup(_email, _password),
                                  child: new Container(
                                    height: 60,

                                    decoration: BoxDecoration(
                                      border: Border.all(width: 5),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.teal,
                                              Colors.teal,
                                            ]
                                        )
                                    ),
                                    child: Center(
                                      child: Text("Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
                                    ),
                                  )),
                            ),
                            SizedBox(height: 5 ),
                            FadeAnimation(1.5, TextButton(child: Text("Forgot Password?", style: TextStyle(color: Colors.white,fontSize: 20),),onPressed:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetScreen()))),
                            ),
                        FadeAnimation(1.5, Container(margin: EdgeInsets.only(top: 10),
                            child: TextButton(child: Text("Im Admin", style: TextStyle(color: Colors.white,fontSize: 20),),onPressed:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAdminScreen())))),
                        )],
                        ),
                      ),
                    )
                  ],
                ),
              )
              ),
          ),


    );





  }
  Signin(String _email,String _password) async {
    try{
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      getAdmin().then((value) {
        bool test = value;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(test)));});
    } on FirebaseAuthException catch(error){
      if(error.message==null){
        Flushbar(
          title:  "Login Error",
          message:  'Please enter your email and password',
          duration:  Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context);

      }
      else {
        Flushbar(
          title: "Signup Error",
          message: error.message,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )
          ..show(context);
      }

    }
  }
  Signup(String _email,String _password) async {
    try{
     await auth.createUserWithEmailAndPassword(email: _email, password: _password);
     addUser();


       var myJSONObj = {
         'Nom': 'testname',
         'Image': 'testImage',
         'Description': 'testdescription',
         'Prix': 'testprice',
       };

       users.doc("TestID").set(myJSONObj);
     getAdmin().then((value) {
       bool test = value;

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(test)));});
    } on FirebaseAuthException catch(error){
      if(error.message==null){
        Flushbar(
          title:  "Signup Error",
          message:  'Please enter your email and password',
          duration:  Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context);

      }
      else {
        Flushbar(
          title: "Signup Error",
          message: error.message,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )
          ..show(context);
      }
    }
  }
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future<void> addUser() {
    var myJSONObj = {
      'isAdmin': false
    };
    users.doc(_email).set(myJSONObj);


    // Call the user's CollectionReference to add a new user
    return users.doc(_email).set(myJSONObj)

        .then((value) => print("User Added"))


        .catchError((error) => print("Failed to add user: $error"));

  }
  Future<bool> getAdmin() async {
    final auth = FirebaseAuth.instance;
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection(
        'users').doc(auth.currentUser.email).get();
    final bool isAdmin = variable['isAdmin'];
    return isAdmin;
  }
}



