import 'package:bioshop/MainPanel.dart';
import 'package:bioshop/Panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bioshop/plantdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PanelList extends StatefulWidget {
  @override
  _PanelListState createState() => _PanelListState();
}

class _PanelListState extends State<PanelList> {
  ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];
  final auth = FirebaseAuth.instance;


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
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(auth.currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  DocumentSnapshot Items = snapshot.data.docs[i];
                  //DocumentSnapshot Plants2 = snapshot.data.docs[i+1];


                  return Container(
                    height: 354,

                    child: ListView(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 354,
                          child: ListView(
                              padding: EdgeInsets.only(left: 0.0, right: 0),
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                getCard(
                                    Items['Image'], Items['Prix'],
                                    Items['Description'], Items['Nom'],
                                    context, Items.id,Items['Quantity']),
                                SizedBox(width: 15.0),


                              ]),
                        ),


                      ],
                    ),

                  );
                },

              );
            }
            else {
              return Container();
            }
          }


      ),
    );
  }

  getCard(String imgPath, String price, String Description, String plantName,
      context, String id,int quantity) {
    int fullprice = int.parse(price)*quantity;
    Color a = Color(0xFF8AC7A4);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PlantDetail(plantName, price, imgPath, Description, a)
              ));
            },
            child: Container(
              height: 354.0,
              width: 455.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF8AC7A4)),
                height: 354.0,
                width: 225.0,
                child: Column(
                  children: <Widget>[

                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[

                            SizedBox(height: 10.0),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\$' + fullprice.toString(),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            )

                          ],
                        ),
                        Spacer(),
                        Column(
                          children: <Widget>[


                            SizedBox(height: 10.0),

                            Text(
                              'Quantity',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10.0),

                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )

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

                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                plantName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )

                          ],

                        ),
                        Spacer(),
                        Container(
                          height: 75,
                          margin: const EdgeInsets.only(right: 10),
                          child: FloatingActionButton(

                            onPressed: () {
                              DeleteDoc(id);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                            backgroundColor: Colors.red,
                            mini: false,

                            elevation: 1.0,
                            child: Icon(Icons.clear,
                                color: Colors.white, size: 45.0),
                          ),
                        ),




                      ],


                    ),



                  ],
                ),
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

 void DeleteDoc(String id) {
    final collection = FirebaseFirestore.instance.collection(auth.currentUser.email);
    collection
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }
}