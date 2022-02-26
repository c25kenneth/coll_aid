import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Scholarships extends StatefulWidget {
  const Scholarships({ Key? key }) : super(key: key);

  @override
  State<Scholarships> createState() => _ScholarshipsState();
}

class _ScholarshipsState extends State<Scholarships> {
  final Stream<QuerySnapshot> _scholarshipsStream = FirebaseFirestore.instance.collection('scholarships').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Scholarships'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _scholarshipsStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasError) {
              return Text('Something went wrong'); 
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading'); 
            } else {
              return SizedBox(
                height: 90,
                child: Card(
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['scholarshipHost']),
                        subtitle: Text(data['scholarshipName']),
                        onTap: (){
                          showBottomSheet(context: context, builder: (context) {
                            return Wrap(
                              children: [
                                ListTile(title: Text(data['scholarshipHost'] + ': ' + data['scholarshipDescription']), subtitle: Text(data['link']),),
                              ],
                            ); 
                          });
                        }
                      );
                    }).toList(),
                  ),
                ),
              ); 
            }
        },  
      ),
    );
  }
}