import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/screens/shared/navigationButton.dart';

class YourName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourNameState();
}

class _YourNameState extends State<YourName> {
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Name App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            theTextField(),
            Text('Hello ' + name + '!'),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: myDropDown(),
            ),
            GoBackHome(),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> myDropDown() {
    return DropdownButton<String>(
      items: _currencies.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _currency,
      onChanged: (String value) {
        _onDropDownChanged(value);
      },
    );
  }

  void _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  TextField theTextField() {
    return TextField(
      decoration: InputDecoration(hintText: 'Enter your name'),
      // The text is updated for each input
      // onChanged: (String str) {
      //   setState(() {
      //     name = str;
      //   });
      // },
      // The text is updated after the Enter button is pressed
      onSubmitted: (String str) {
        setState(() {
          name = str;
        });
      },
    );
  }
}
