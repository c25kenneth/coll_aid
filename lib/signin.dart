import 'package:coll_aid/Home.dart';
import 'package:coll_aid/fireflutter.dart';
import 'package:coll_aid/main.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = ''; 
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: const Text("Sign In for College Aid!"),
        actions: [
          MaterialButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }, child: Text('Sign Up!'),),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Image.network('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), height: 350, width: 350.0,),           
            SizedBox(height: 25.0,),
            Container(
              width: 350,
              child: TextField(
                onChanged: (val){
                  setState(() {
                    email = val; 
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                ),
            ),

            SizedBox(height: 15.0),

            Container(
              width: 350,
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    password = val; 
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                ),
            ),

            SizedBox(height: 35.0,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Sign In!',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                canSignIn(email, password); 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())); 
              },
            ),
          ],
        ),
      ),
    );
  }
}