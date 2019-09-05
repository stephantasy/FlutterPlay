import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/shared/navigationButton.dart';

class Default extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: Text("Default App"),
        backgroundColor: Colors.blueAccent,
      ),

      // CONTENT
      body: Column(
        children: <Widget>[
          Text("Hello there!"),
          GoBackHome(),
          testImage(),
        ],
      ),
    );
  }
  
    Widget testImage() {
    return Image.network(
      'https://picsum.photos/250?image=9',
    );
  }
}
