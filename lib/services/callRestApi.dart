import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_flutter/models/Event.dart';
import 'package:http/http.dart' as http;

// ***** TO CALL IT *****
// void main() => runApp(MyApp(post: fetchPost()));
// ***** TO CALL IT *****

Future<List<Event>> fetchPost() async {
  final response =
      await http.get('https://phil27-backend-api.intech-lab.com/events/');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    //return Post.fromJson(json.decode(response.body));

    var parsed = json.decode(response.body); 
    //final signUp = Event.fromJson(parsed[0]);

    var countryObjectList = (parsed as List)
      .map((data) => Event.fromJson(data))
      .toList();

    return countryObjectList;

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// class Post {
//   final String date;
//   final int id;
//   final String title;
//   final String body;

//   Post({this.date, this.id, this.title, this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['ID'],
//       date: json['Date'],
//       title: json['Title1'],
//       body: json['Description'],
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final Future<List<Event>> post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Event>>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
