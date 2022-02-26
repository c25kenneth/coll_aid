import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coll_aid/addAssignments.dart';
import 'package:coll_aid/fireflutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Assignments extends StatefulWidget {
  const Assignments({ Key? key }) : super(key: key);

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Assignments"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddAssignment())); 
      },),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading'); 
          } else {
            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('assignments').where('uid', isEqualTo: uid).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading please wait'); 
                } else {
                  return SizedBox(
                    height: 600,
                    child: Card(
                      color: Colors.pink[200],
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return Column(
                            children: [
                              ListTile(
                                title: Text(data['assignmentTitle']),
                                subtitle: Text('Due on: ' + data['assignmentDueDate']),
                                onTap: (){
                                  showBottomSheet(context: context, builder: (context) {
                                    return Wrap(
                                      children: [
                                        ListTile(title: Text(data['assignmentTitle'] + ': ' + data['assignmentDescription'])),
                                      ],
                                    ); 
                                  });
                                }
                              ),
                              Divider(), 
                            ],
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ); 
                }
              },
            );
          }
        },
        ),
        // persistentFooterButtons: [
        //   Center(
        //     child: FloatingActionButton(onPressed: (){
        //       Nav
        //     }, child: Icon(Icons.phone), tooltip: 'Need help? Call your teacher!',),
        //   )
        // ],
      ); 
  }
}