import 'package:coll_aid/fireflutter.dart';
import 'package:coll_aid/main.dart';
import 'package:flutter/material.dart';

import 'navigationDrawerWidget.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(title: Text('Home'), actions: [
        MaterialButton(onPressed: (){
            signOut(); 
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage())); 
          }, child: Text('Sign Out!')), 
        ],),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 35.0),
              Text('Hello and welcome to College Aid!👋', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              Text('We are here to make your college life easy!', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 40.0,),
              Text('Here at College Aid, you can find scholarships 💸, '), 
              Text('internships and careers 🎓, '),
              Text('courses 🏫, '),
              Text('And manage your assignments to make sure they are done! 👊'),
              SizedBox(height: 20.0,),
              Text('Educators can add these opportunities within the app! '),
              SizedBox(height: 40.0), 
              Text("It's super easy to get started!", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 40.0,),
              Text('Click the three lines on the appbar to start your college journey!'),
              SizedBox(height: 15.0,),
              Image.network('https://cdn.pixabay.com/photo/2013/04/19/01/15/university-105709_960_720.jpg', height: 300.0, width: 300.0,),
            ],
          ),
        ),
    );
  }
}