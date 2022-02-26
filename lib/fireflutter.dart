import 'package:firebase_auth/firebase_auth.dart';


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