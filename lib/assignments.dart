import 'package:coll_aid/addAssignments.dart';
import 'package:flutter/material.dart';

class Assignments extends StatelessWidget {
  const Assignments({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Assignments"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddAssignment())); 
      },),
    ); 
  }
}