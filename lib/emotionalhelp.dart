import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmotionalHelp extends StatefulWidget {
  const EmotionalHelp({ Key? key }) : super(key: key);

  @override
  _EmotionalHelpState createState() => _EmotionalHelpState();
}

class _EmotionalHelpState extends State<EmotionalHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Deal with Emotional Problems!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Image.network('https://cdn.pixabay.com/photo/2016/07/01/22/34/people-1492052_960_720.jpg'), height: 250, width: 250.0,),       
            IconButton(onPressed: () async {
              final Uri launchUri = Uri(
                scheme: 'tel', 
                path: '+18006624357'
              );
              if (await canLaunch(launchUri.toString())) {
                await launch(launchUri.toString()); 
              } else {
                print('Experiencing technical difficulties. Please try again later'); 
              }
            }, icon: Icon(Icons.call), 
              tooltip: 'Press to call for help! Default number is depression hotline. ',
            ),
            Text('Press to call for help!'),
            SizedBox(height: 35.0,),
            IconButton(onPressed: () async {
              final Uri launchUri = Uri(
                scheme: 'sms', 
                path: '+18006624357'
              );
              if (await canLaunch(launchUri.toString())) {
                await launch(launchUri.toString()); 
              } else {
                print('Experiencing technical difficulties. Please try again later'); 
              }
            }, icon: Icon(Icons.sms), 
              tooltip: 'Press to send an SMS for help! Default number is depression hotline. ',
            ),
            Text('Press to send an SMS for help! '),
            SizedBox(height: 60.0,), 
            Text('Helpful Links!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
            SizedBox(height: 0.0,),
            MaterialButton(
              onPressed: ()async{
                String url = 'https://timely.md/blog/stress-and-anxiety-in-college-students/'; 
                if (await canLaunch(url)) {
                  await launch(url); 
                } else {
                  print('Experiencing difficulties. Please try again later'); 
                }
              },
              child: Text('5 coping strategies for college students!'),
              color: Colors.blueGrey,
            ), 
            MaterialButton(
              onPressed: () async {
                String url = 'https://timely.md/blog/stress-management-tips-for-college-students/';
                if (await canLaunch(url)) {
                  await launch(url); 
                } else {
                  print('Experiencing difficulties. Please try again later');
                }
              },
              color: Colors.blueGrey,
              child: Text('12 tips to manage stress for college students! '),
            ), 
            MaterialButton(
              onPressed: ()async{
                String url = 'https://www.prospects.ac.uk/applying-for-university/university-life/5-ways-to-manage-student-stress';
                if (await canLaunch(url)) {
                  await launch(url); 
                } else {
                  print('Experiencing difficulties. Please try again later');
                }
              },
              color: Colors.blueGrey,
              child: Text('Managing student stress!'),
            ), 
          ],
        ),
      ),
    );
  }
}