import 'package:flutter/material.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({ Key? key }) : super(key: key);

  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {

  String assignmentTitle = ''; 
  String assignmentDueDate = ''; 
  String assignmentDescription = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add an Assignment!'),),
      body:  SingleChildScrollView(
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
                      assignmentTitle = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Assignment Title",
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
                      assignmentDueDate = val; 
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Assignment Due Date",
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
                      assignmentDescription = val; 
                    });
                  },
                  maxLines: 5,
                  obscureText: false,
                  decoration: InputDecoration(
                    
                    hintText: "Assignment Description",
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
                  'Create Assignment',
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