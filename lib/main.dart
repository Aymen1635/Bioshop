import 'package:bioshop/About.dart';
import 'package:bioshop/Add.dart';
import 'package:bioshop/grainlist.dart';
import 'package:bioshop/honeylist.dart';
import 'package:bioshop/oillist.dart';
import 'package:flutter/material.dart';
import 'package:bioshop/plantslist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'Panel.dart';
import 'login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF0C9869), //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),


    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool test;

  MyHomePage(this.test);



  @override
  _MyHomePageState createState() => _MyHomePageState(test);


}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  TabController tabController;
  final bool test ;

  _MyHomePageState(this.test);


  @override
  void initState() {
    // TODO: implement initState

    tabController = TabController(vsync: this, length: 4);
    super.initState();

  }




  @override
  Widget build(BuildContext context) {

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
                          Text('Bio',
                              style: TextStyle(
                                  fontFamily: 'DancingScript',
                                  color: Colors.white,

                                  fontSize: 45.0)),
                          SizedBox(width: 1.0),
                          Text('Shop',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 35.0))

                        ],
                      ),
                    ),

                    Spacer(),


                    Visibility(

                      visible: !test,
                      child: FloatingActionButton(

                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => (MyPanelList())));
                        },
                        backgroundColor: Color(0xFF8AC7A4),
                        mini: false,
                        elevation: 1.0,
                        child: Icon(Icons.shopping_cart,
                            color: Colors.white, size: 25.0),
                      ),
                    ),
                    Visibility(

                      visible: test,
                      child: FloatingActionButton(

                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => (MyAddPage())));
                        },
                        backgroundColor: Color(0xFF8AC7A4),
                        mini: false,
                        elevation: 1.0,
                        child: Icon(Icons.add,
                            color: Colors.white, size: 25.0),
                      ),
                    ),


                  ],


                ),


              ),
              Container(

              ),


              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(

                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // surffix isn't working properly  with SVG
                          // thats why we use row
                          // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15.0),

                child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Plants',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Honey',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Grains',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Oils',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 200.0,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    PlantList(test),
                    HoneyList(test),
                    GrainList(test),
                    OilList(test)
                  ],
                ),
              )
            ],
          ));
    }
  }

