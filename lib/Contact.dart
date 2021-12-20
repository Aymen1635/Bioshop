import 'package:bioshop/About.dart';
import 'package:flutter/material.dart';



class ContactPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF282A36),

      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AboutPage()));},

            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Contact',style: TextStyle(
            fontSize: 30,
          ),),
        ),
        body: SafeArea(
          child: Column(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    child: Text("Téléphone", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    fontSize: 30),),
                  ),
                ),
              ),




          Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                size: 45,
                color: Colors.pink,
              ),
              title: Text('(+216) 36 011 680',style: TextStyle(
                fontSize: 25,
              ),),
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    child: Text("Email", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 45,
                    color: Colors.pink,
                  ),
                  title: Text('nationsuniestunisie@gmail.com',style: TextStyle(
                    fontSize: 25,
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    child: Text("Adresse", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 45,
                    color: Colors.pink,
                  ),
                  title: Text('Rue du Lac Windermere, Imm. Le Prestige Business Center Tour A - Les Berges du Lac, Tunis',style: TextStyle(
                    fontSize: 25,
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    child: Text("Télécopie", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.print,
                    size: 45,
                    color: Colors.pink,
                  ),
                  title: Text('(+216) 71 900 668',style: TextStyle(
                    fontSize: 25,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}