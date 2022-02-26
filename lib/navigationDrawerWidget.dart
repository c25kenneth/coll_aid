import 'package:coll_aid/addCourse.dart';
import 'package:coll_aid/addScholarship.dart';
import 'package:coll_aid/assignments.dart';
import 'package:coll_aid/careers.dart';
import 'package:coll_aid/courses.dart';
import 'package:coll_aid/emotionalhelp.dart';
import 'package:coll_aid/loanCalculator.dart';
import 'package:coll_aid/scholarships.dart';
import 'package:flutter/material.dart';

import 'addCareer.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.pink[300],
        child: ListView(
          children: [
            const SizedBox(height: 48,), 
            Text('      For Students: ', style: TextStyle(fontWeight: FontWeight.bold),),
            buildMenuItem(text: 'Courses', icon: Icons.school, onClicked: () => selectedItem(context, 0),), 
            buildMenuItem(text: 'Assignments', icon: Icons.assignment, onClicked: () => selectedItem(context, 1),),
            buildMenuItem(text: 'Internships and Jobs', icon: Icons.work, onClicked: () => selectedItem(context, 2),),
            buildMenuItem(text: 'Scholarship Opportunities', icon: Icons.money, onClicked: () => selectedItem(context, 3),),
            buildMenuItem(text: 'Emotional Help', icon: Icons.heart_broken, onClicked: () => selectedItem(context, 8)), 
            buildMenuItem(text: 'Student Loan Interest Calculator', icon: Icons.attach_money, onClicked: () => selectedItem(context, 7)),
            const SizedBox(height: 150,),
            Text('      For Educators: ', style: TextStyle(fontWeight: FontWeight.bold),), 
            buildMenuItem(text: 'Add Course', icon: Icons.add_outlined, onClicked: () => selectedItem(context, 4),),
            buildMenuItem(text: 'Add Internships or Jobs', icon: Icons.add_outlined, onClicked: () => selectedItem(context, 5),),
            buildMenuItem(text: 'Add Scholarship Opportunities', icon: Icons.add_outlined, onClicked: () => selectedItem(context, 6),),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white; 
  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text, style: TextStyle(color: color),),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
      break; 
    case 1: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments())); 
      break; 
    case 2: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Careers()));
      break; 
    case 3: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Scholarships()));
      break; 
    case 4: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddCourse())); 
      break; 
    case 5: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddCareer()));
      break; 
    case 6: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddScholarship())); 
      break; 
    case 7: 
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoanCalculator()));
      break;  
    case 8: 
      Navigator.push(context, MaterialPageRoute(builder: ((context) => EmotionalHelp())));
  }
}