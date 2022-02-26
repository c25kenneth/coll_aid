import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}