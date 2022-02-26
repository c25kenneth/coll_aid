import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Careers extends StatefulWidget {
  Careers({ Key? key }) : super(key: key);

  @override
  State<Careers> createState() => _CareersState();
}

class _CareersState extends State<Careers> {
  final Stream<QuerySnapshot> _careersStream = FirebaseFirestore.instance.collection('careers').snapshots(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Jobs and Internships'),),
      body: StreamBuilder<QuerySnapshot>(
        stream: _careersStream,
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
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['companyName']),
                        subtitle: Text(data['positionName']),
                        onTap: (){
                          showBottomSheet(context: context, builder: (context) {
                            return Wrap(
                              children: [
                                ListTile(title: Text(data['companyName'] + ': ' + data['positionDescription']), subtitle: Text(data['positionLink']), onLongPress: () async {
                                  if (await canLaunch(data['positionLink'])) {
                                    await launch(data['positionLink'], forceWebView: true); 
                                  } else {
                                    throw 'Could not launch url'; 
                                  }
                                },),
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