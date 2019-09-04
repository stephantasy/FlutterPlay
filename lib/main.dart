import 'package:flutter/material.dart';
import './screens/home.dart';

/* //To get data from the Phil27 API
import 'services/callRestApi.dart'; 
void main() => runApp(MyApp(post: fetchPost())); // <= To get data from the Phil27 API (TODO: add the header with the JWT for authentication)
*/

void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Title in App Bar"),
          ),
          body: Home()),
    );
  }
}
