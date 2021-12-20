
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'animation/FadeAnimation.dart';
import'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';







class MyEditPage extends StatefulWidget {
  MyEditPage(this.plantName, this.imgPath, this.price,this.id, this.s);
  String plantName;
  String imgPath;
  String price;
  String id;
  String s;





  @override
  _MyEditPageState createState() => _MyEditPageState(plantName,imgPath,price,id,s);


}

class _MyEditPageState extends State<MyEditPage> {

  TabController tabController;
  String dropdownvalue= "Plants";
  String name;
  String Description;
  String price;
  String img;

  _MyEditPageState(this.plantName, this.imgPath, this.prix,this.id,this.s);
  String plantName;
  String imgPath;
  String prix;
  String id;
  String s;










  @override
  Widget build(BuildContext context) {
    var items=['Plants','Honey','Oils','Grains'];

    const kPrimaryColor = Color(0xFF0C9869);
    const kTextColor = Color(0xFF3C4046);
    const kBackgroundColor = Color(0xFFF9F8FD);
    final auth = FirebaseAuth.instance;



    const double kDefaultPadding = 20.0;



    return Scaffold(


        body: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: 0,
                bottom: 0,
              ),
              height: 80,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text('Edit',
                            style: TextStyle(
                                fontFamily: 'DancingScript',
                                color: Colors.white,

                                fontSize: 45.0)),
                        SizedBox(width: 1.0),
                        Text('Page',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 35.0))

                      ],
                    ),
                  ),



                ],


              ),


            ),
            Padding(
              padding: const EdgeInsets.only(right: 420),
              child: FloatingActionButton(

                onPressed: () {
                  getAdmin().then((value) {
                    bool test = value;

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(test)));});


                },
                backgroundColor: Color(0xFF0C9869),
                mini: false,

                elevation: 1.0,
                child: Icon(Icons.arrow_back,
                    color: Colors.white, size: 25.0),
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
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]))
                          ),
                          child: TextFormField(

                            keyboardType: TextInputType.text,

                            style: TextStyle(color: Colors.black,
                                fontSize: 20),
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                name = value;

                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: plantName,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'Montserrat')

                            ),

                          ),

                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,

                            style: TextStyle(color: Colors.black,
                                fontSize: 20),
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                img = value;

                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: imgPath,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'Montserrat')

                            ),
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black,
                                fontSize: 20),
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                price = value;

                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: prix,
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 25,
                                    color: Colors.black)

                            ),
                          ),

                        ),
                        Container(
                          height: 250,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[100]))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,

                            style: TextStyle(color: Colors.black,
                                fontSize: 20),
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                Description = value;

                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Product Description",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: 25)

                            ),
                          ),

                        ),

                      ],
                    ),
                  )),



                  SizedBox(height: 50,),
                  FadeAnimation(2,
                    new GestureDetector(
                        onTap: () {
                          EditProduct();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Product Edited Successfully",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                          );
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
                            child: Text("Save", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),),
                          ),
                        )),
                  ),

                ],
              ),
            )
          ],
        ));
  }


  Future<bool> getAdmin() async {
    final auth = FirebaseAuth.instance;
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection(
        'users').doc(auth.currentUser.email).get();
    final bool isAdmin = variable['isAdmin'];
    return isAdmin;
  }
  Future<void> EditProduct() {
    CollectionReference products = FirebaseFirestore.instance.collection(s);
    var myJSONObj = {
      'Nom': name,
      'Description': 'desc',
      'Prix': prix,
      'Image': imgPath,
    };



    // Call the user's CollectionReference to add a new user
    return products.doc(id).set(myJSONObj)

        .then((value) => print("Product Edited"))


        .catchError((error) => print("Failed to add user: $error"));

  }
}