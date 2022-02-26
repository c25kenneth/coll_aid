import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatefulWidget {
  const Courses({ Key? key }) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final Stream<QuerySnapshot> _coursesStream = FirebaseFirestore.instance.collection('courses').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Courses'),),
      body: StreamBuilder<QuerySnapshot>(
        stream: _coursesStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasError) {
              return Text('Something went wrong'); 
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading'); 
            } else {
              return SizedBox(
                height: 600,
                child: Card(
                  color: Colors.pink[200],
                  child:
                      ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return Column(
                              children: [
                                SizedBox(
                                  height: 80.0,
                                  child: ListTile(
                                    title: Text(data['courseProvider']),
                                    subtitle: Text(data['courseName']),
                                    onTap: (){
                                      showBottomSheet(context: context, builder: (context) {
                                        return Wrap(
                                          children: [
                                            ListTile(title: Text(data['courseProvider'] + ': ' + data['courseDescription']), subtitle: Text(data['courseLink']), onLongPress: () async {
                                              if (await canLaunch(data['courseLink'])) {
                                                await launch(data['courseLink'], forceWebView: true); 
                                              } else {
                                                throw 'Could not launch url'; 
                                              }
                                            },),
                                            
                                          ],
                                        ); 
                                      });
                                    }
                                  ),
                                ),
                                Divider(), 
                              ],
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