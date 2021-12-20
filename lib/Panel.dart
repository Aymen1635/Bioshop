import 'package:bioshop/MainPanel.dart';
import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'login.dart';
import 'main.dart';



class MyPanelList extends StatefulWidget {
  @override
  _MyPanelState createState() => _MyPanelState();
}

class _MyPanelState extends State<MyPanelList>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color(0xFF0C9869);
    const kTextColor = Color(0xFF3C4046);
    const kBackgroundColor = Color(0xFFF9F8FD);


    const double kDefaultPadding = 20.0;
    return Scaffold(


        body: ListView(
          children: <Widget>[



            Container(

              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top:0,
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
                    child:  Row(
                      children: <Widget>[
                        Text('Shopping',
                            style: TextStyle(
                                fontFamily: 'DancingScript',
                                color: Colors.white,

                                fontSize: 45.0)),
                        SizedBox(width: 1.0),
                        Text('Cart',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 35.0))

                      ],
                    ),

                  ),


                  Spacer(),



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
            ), Container(


            ),




            Padding(
              padding: EdgeInsets.only(left: 15.0,top:15.0),

              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[

                  PanelList()
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
}