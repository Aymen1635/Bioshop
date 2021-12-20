import 'package:bioshop/Contact.dart';
import 'package:bioshop/Detail.dart';
import 'package:bioshop/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final List<String> _listItem = [
    'assets/two.jpg',
    'assets/three.jpg',
    'assets/four.jpg',
    'assets/five.jpg',
    'assets/one.jpg',
    'assets/gda-terroir6.jpg'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,

        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)
              ),

            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.jpg'),
                        fit: BoxFit.cover
                    )
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40,vertical: 23),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child:  new GestureDetector(
                                onTap: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Detail()));},

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
                                    child: Text("About us", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                )),
                          ),
                          Container(
                            width: 140,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40,vertical: 23),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: new GestureDetector(
                                onTap: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ContactPage()));},

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
                                    child: Text("Contact us", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                )),
                          ),



                        ],
                      ),
                      Text("Le GDA « Nadhour »", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: new GestureDetector(
                            onTap: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>(LoginScreen())));},

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
                                child: Text("Shop now", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),),
                              ),
                            )),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: _listItem.map((item) => Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover
                            )
                        ),

                      ),
                    )).toList(),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}