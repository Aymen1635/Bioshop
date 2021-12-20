import 'package:bioshop/MainPanel.dart';
import 'package:bioshop/Panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import'package:cloud_firestore/cloud_firestore.dart';
class PlantDetail extends StatefulWidget {
  PlantDetail(this.nom,this.prix, this.img, this.desc,this.color);
  String nom ;
  String prix;
  String img;
  String desc;
  Color color;

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {

  final auth = FirebaseAuth.instance;


  int _n = 1;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n > 1)
        _n--;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: widget.color),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white
                ),
                ),

              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0, left: MediaQuery.of(context).size.width - 60.0
                ),
                child: FloatingActionButton(

                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>(MyPanelList())));
                  },
                  backgroundColor: Colors.white,
                  mini: false,
                  elevation: 0.0,
                  child: Icon(Icons.shopping_cart,
                      color: Colors.black, size: 35.0),
                ),
              ),
              Positioned(
                top: 10.0,
                left: MediaQuery.of(context).size.width - 30.0,
                child: Container(
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(color: Color(0xFF399D63),
                      fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'INDOOR',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      widget.nom,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Price',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      '\$'+widget.prix,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'SIZES',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      'Small',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.black),
                      child: Center(
                        child: FloatingActionButton(
                          onPressed: () {
                         addUser();
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("Product added to cart",
                               style: TextStyle(
                               fontFamily: 'Montserrat',
                               fontSize: 25.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.white),
                         ),
                           ),
                         );

                          },
                          backgroundColor: widget.color,
                          mini: true,
                          elevation: 0.0,
                          child: Icon(Icons.shopping_cart,
                              color: Colors.black, size: 30.0),
                        ),



                      ),

                    ),

                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: new Text(
                        'Quantity',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,


                          children: <Widget>[

                            new FloatingActionButton(
                              splashColor: Colors.purple,
                              onPressed: (){
                                add();
                              },
                              child: new Icon(
                                Icons.add, color: Colors.black,),
                              backgroundColor: Colors.white,),

                            Container(
                              margin: EdgeInsets.all(8),
                              child: new Text('$_n',
                                  style: new TextStyle(fontSize: 25.0)),
                            ),

                            new FloatingActionButton(

                              splashColor: Colors.purple,
                              onPressed: minus,
                              child: new Icon(
                                  Icons.remove, color: Colors.black),
                              backgroundColor: Colors.white,),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 410.0,
                left: (MediaQuery.of(context).size.width / 2) - 80.0,
                child: Image.network(
                  widget.img,
                  width: 320,
                  height: 400,


                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 275.0,
                      left: 20.0,
                      right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'All to know...',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'If you are completely new to houseplants then Ficus is a brilliant first plant to adopt, it is very easy to look after and won\'t occupy too much space.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Plant height: 35-45cm;',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        'Nursery pot width: 12cm',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Future<void> addUser() {
    CollectionReference users = FirebaseFirestore.instance.collection(auth.currentUser.email);



    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'Nom': widget.nom, // John Doe
      'Image': widget.img, // Stokes and Sons
      'Prix': widget.prix, // 42
      'Description': 'description',
      'Quantity': _n,

    })

        .then((value) => print("User Added"))


        .catchError((error) => print("Failed to add user: $error"));

  }
}
