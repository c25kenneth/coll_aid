import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance; 
final User? user = auth.currentUser; 
final uid = user?.uid;  

Future<bool> canRegister(String userEmail, userPassword) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
    return true; 
  } catch(e) {
    return false; 
  }
    
}

Future signOut() async {
  try {
    await FirebaseAuth.instance.signOut(); 
    return true; 
  } catch (e) {
    return false; 
  }
}

Future<bool> canSignIn(String userEmail, userPassword) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail, password: userPassword); 
    return true; 
  } catch (e) {
    return false; 
  }
}

Future createCourse(String courseName, String courseDescription, String courseProvider, String link) async {
  try {
    CollectionReference courses = FirebaseFirestore.instance.collection('courses'); 
    await courses.add({
        'courseName' : courseName, 
        'courseDescription' : courseDescription,  
        'courseProvider' : courseProvider, 
        'courseLink' : link, 
      });
  } catch (e) {
    print(e.toString()); 
  }
}

Future createAssignment(String assignmentTitle, String assignmentDueDate, String assignmentDescription) async {
  try {
    CollectionReference assignments = FirebaseFirestore.instance.collection('assignments'); 
    await assignments.add({
        'assignmentTitle' : assignmentTitle, 
        'assignmentDueDate' : assignmentDueDate,  
        'assignmentDescription' : assignmentDescription, 
        'uid' : uid,
      });
  } catch (e) {
    print(e.toString()); 
  }
}

Future createCareer(String positionName, String companyName, String positionDescription, String link) async {
  try {
    CollectionReference careers = FirebaseFirestore.instance.collection('careers'); 
    await careers.add({
        'positionName' : positionName, 
        'companyName' : companyName,  
        'positionDescription' : positionDescription, 
        'positionLink' : link, 
      });
  } catch (e) {
    print(e.toString()); 
  }
} 

Future createScholarship(String scholarshipName, String scholarshipHost, String scholarshipDescription, String link) async {
  try {
    CollectionReference scholarships = FirebaseFirestore.instance.collection('scholarships'); 
    await scholarships.add({
        'scholarshipName' : scholarshipName, 
        'scholarshipHost' : scholarshipHost, 
        'scholarshipDescription': scholarshipDescription, 
        'link' : link, 
      });
  } catch (e) {
    print(e.toString()); 
  }
}