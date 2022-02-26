import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({ Key? key }) : super(key: key);

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String courseName = '';
  String courseDescription = ''; 
  String courseProvider = ''; 
  String link = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Course!')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Image.asset('assets/images/stillfreshlogo.png', width: 300, height: 300),      
              SizedBox(height: 15.0,),
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      courseProvider = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "name of course provider. University, instructor, etc. ",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
      
              SizedBox(height: 10.0),
      
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      courseName = val; 
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Name of course",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 10.0),
      
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      courseDescription = val; 
                    });
                  },
                  maxLines: 5,
                  obscureText: false,
                  decoration: InputDecoration(
                    
                    hintText: "Course Description",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 10), 
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      link = val; 
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    
                    hintText: "Link to course. Udemy, Coursera, etc. ",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
      
              SizedBox(height: 10.0,),
              //flutter run --no-sound-null-safety
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Add Course!',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  
                  Navigator.pop(context); 
                },
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}