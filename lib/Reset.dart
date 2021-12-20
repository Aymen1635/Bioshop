import 'package:bioshop/SignUp.dart';
import 'package:bioshop/Verification.dart';
import 'package:bioshop/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'Animation/FadeAnimation.dart';
import 'main.dart';
class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
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
                    height: 240,

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
                          right:20,
                          top: 45,
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
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
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
                                      hintStyle: TextStyle(color: Colors.white)

                                  ),
                                ),
                              ),

                            ],
                          ),
                        )),
                        SizedBox(height: 50,),
                        FadeAnimation(2,
                          new GestureDetector(
                              onTap: () {auth.sendPasswordResetEmail(email: _email);
                              Fluttertoast.showToast(
                                  msg: "An email has been sent to "+_email,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 4,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0

                              );
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));


                              },




                              child: new Container(
                                height: 50,

                                decoration: BoxDecoration(
                                    border: Border.all(width: 0),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.teal,
                                          Colors.teal,
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: Text("Send Request", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                        ),


                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),


    );





  }


}



