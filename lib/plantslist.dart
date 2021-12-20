import 'package:bioshop/Add.dart';
import 'package:flutter/material.dart';
import 'package:bioshop/plantdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Edit.dart';

class PlantList extends StatefulWidget {
  PlantList(this.test);
  final bool test;

  @override
  _PlantListState createState() => _PlantListState(test);
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];
  DocumentSnapshot Plants;
  DocumentSnapshot Plants2;
  String description;
  String nom;
  String desc;
  String prix;
  String img;
  String nom2;
  String desc2;
  String prix2;
  String img2;
  final bool test;

  _PlantListState(this.test);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Plants").snapshots(),
        builder: (context,snapshot) {

if(snapshot.hasData){
    return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: Division(snapshot.data.docs.length) ,
    itemBuilder: (context, i) {




    Plants = snapshot.data.docs[i];
    Plants2 = snapshot.data.docs[i+1];
    if(i==0){
    Plants = snapshot.data.docs[0];
    Plants2 = snapshot.data.docs[1];

    }


    else if(i==1){
    Plants = snapshot.data.docs[2];
    Plants2 = snapshot.data.docs[3];

    }
    else if(i==2) {
    Plants = snapshot.data.docs[4];
    Plants2 = snapshot.data.docs[5];


    }
    else if(i==3) {
      var t = 6;
      if(t+1<snapshot.data.docs.length) {
        Plants = snapshot.data.docs[t];
        Plants2 = snapshot.data.docs[t + 1];
      }
      else{
        Plants = snapshot.data.docs[t];
        Plants2 = Plants;

      }


    }
    else if(i==4){

      var t = 8;
      if(t+1<snapshot.data.docs.length) {
        Plants = snapshot.data.docs[t];
        Plants2 = snapshot.data.docs[t + 1];
      }
      else{
        Plants = snapshot.data.docs[t];
        Plants2 = Plants;

      }

    }
    else if(i==5) {
      var t = 10;
      if(t+1<snapshot.data.docs.length) {
        Plants = snapshot.data.docs[t];
        Plants2 = snapshot.data.docs[t + 1];
      }
      else{
        Plants = snapshot.data.docs[t];
        Plants2 = Plants;

      }


    }
    else if(i==6) {
      var t = 12;
      if(t+1<snapshot.data.docs.length) {
        Plants = snapshot.data.docs[t];
        Plants2 = snapshot.data.docs[t + 1];
      }
      else{
        var t = 14;
        if(t+1<snapshot.data.docs.length) {
          Plants = snapshot.data.docs[t];
          Plants2 = snapshot.data.docs[t + 1];
        }
        else{
          Plants = snapshot.data.docs[t];
          Plants2 = Plants;

        }

      }


    }
    else if(i==7) {
    Plants = snapshot.data.docs[13];
    Plants2 = snapshot.data.docs[14];


    }
    else if(i==8) {
    Plants = snapshot.data.docs[15];
    Plants2 = snapshot.data.docs[16];


    }
    else if(i==9) {
    Plants = snapshot.data.docs[17];
    Plants2 = snapshot.data.docs[18];


    }
    else if(i==10) {
    Plants = snapshot.data.docs[19];
    Plants2 = snapshot.data.docs[20];


    }


    return Container(
    height: 300,

    child: ListView(
    padding: EdgeInsets.only(left: 10, right: 0),
    controller: _scrollController,
    scrollDirection: Axis.vertical,
    children: <Widget>[
    Container(
    height: 300,
    child: ListView(
    padding: EdgeInsets.only(left: 0.0, right: 0),
    controller: _scrollController,
    scrollDirection: Axis.horizontal,
    children: <Widget>[

        getPlantCard(
            Plants['Image'], Plants['Prix'], 'OUTDOOR', Plants['Nom'],
            context, Plants.id),
        SizedBox(width: 15.0),
        getPlantCard2(
            Plants2['Image'], Plants2['Prix'], 'OUTDOOR', Plants2['Nom'],
            context, Plants2.id),
        SizedBox(width: 10.0),

    ]),
    ),


    ],
    ),

    );


    },

    );
    }
else{
  return Container();
}

        }


    );
  }

  getPlantCard(
      String imgPath, String price, String plantType, String plantName,context,String id) {
    Color a = Color(0xFF8AC7A4);
    if(Plants!=null) {
      return Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PlantDetail(
                          nom2 = plantName, prix2 = price, img2 = imgPath,
                          desc2, a)
              ));
            },
            child: Container(
              height: 275.0,
              width: 220.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF8AC7A4)),
                height: 300.0,
                width: 225.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[

                            SizedBox(height: 5.0),

                            Text(
                              '\$' + price,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),

                        Container(margin: EdgeInsets.only(left: 60),
                          child: Column(

                            children: <Widget>[

                              SizedBox(height: 5.0),
                              Visibility(
                                visible: test,
                                child: FloatingActionButton(

                                  onPressed: () {
                                    DeleteDoc(id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Product Deleted from cart",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.red,
                                  mini: true,

                                  elevation: 1.0,
                                  child: Icon(Icons.clear,
                                      color: Colors.white, size: 25.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[

                            SizedBox(height: 5.0),
                            Visibility(
                              visible: test,
                              child: FloatingActionButton(

                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>((MyEditPage(plantName,imgPath,price,id,"Plants")))));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Deleted from cart",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                },
                                backgroundColor: Colors.blueGrey,
                                mini: true,

                                elevation: 1.0,
                                child: Icon(Icons.edit,
                                    color: Colors.white, size: 25.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.0)
                      ],
                    ),
                    Image.network(
                      imgPath,
                      width: 300,
                      height: 180,


                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              plantType,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8AC7A4)),
                            ),
                            Text(
                              plantName,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 90.0, top: 300.0),
            child: Container(
              height: 30.0,
              width: 30.0,

            ),
          )
        ],
      );
    }
    else{
      return Container(
        height: 300,
      );
    }
  }
  getPlantCard2(
      String imgPath, String price, String plantType, String plantName,context,String id) {
    if(Plants2!=Plants) {
      Color a = Color(0xFF8AC7A4);
      return Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PlantDetail(
                          nom2 = plantName, prix2 = price, img2 = imgPath,
                          desc2, a)
              ));
            },
            child: Container(
              height: 275.0,
              width: 220.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF8AC7A4)),
                height: 300.0,
                width: 225.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[

                            SizedBox(height: 5),

                            Text(
                              '\$' + price,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),

                        Container(margin: EdgeInsets.only(left: 60),
                          child: Column(

                            children: <Widget>[

                              SizedBox(height: 5.0),
                              Visibility(
                                visible: test,
                                child: FloatingActionButton(

                                  onPressed: () {
                                    DeleteDoc(id);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Product Deleted from cart",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.red,
                                  mini: true,

                                  elevation: 1.0,
                                  child: Icon(Icons.clear,
                                      color: Colors.white, size: 25.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[

                            SizedBox(height: 3.0),
                            Visibility(
                              visible: test,
                              child: FloatingActionButton(

                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>((MyEditPage(plantName,imgPath,price,id,"Plants")))));

                                },
                                backgroundColor: Colors.blueGrey,
                                mini: true,

                                elevation: 1.0,
                                child: Icon(Icons.edit,
                                    color: Colors.white, size: 25.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.0)
                      ],
                    ),
                    Image.network(
                      imgPath,
                      width: 300,
                      height: 180,


                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              plantType,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8AC7A4)),
                            ),
                            Text(
                              plantName,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 90.0, top: 300.0),
            child: Container(
              height: 30.0,
              width: 30.0,

            ),
          )
        ],
      );
    }
    else{
      return Container(
        height:300
      );
    }
  }
  void DeleteDoc(String id) {
    final collection = FirebaseFirestore.instance.collection('Plants');
    collection
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }
  int Division(int n){
    if(n % 2 == 0){
      return n~/2;

    }
    else{
      return (n~/2)+1;
    }

  }
}
