import 'package:flutter/material.dart';

class ChangePageGenericButton extends StatelessWidget {
  final String title;
  final Widget pageToCall;
  final Color color;
  final Color textColor;

  ChangePageGenericButton({@required this.title, @required this.pageToCall, @optionalTypeArgs this.color = Colors.lightGreen, @optionalTypeArgs this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: ButtonTheme(
        minWidth: 175.0,
        height: 40.0,
        child: RaisedButton(
          child: Text(title, style:TextStyle(color: this.textColor) ,),
          color: this.color,
          elevation: 5.0,
          onPressed: () {
            nextPage(context);
          },
        ),
      ),
    );

    return button;
  }

  void nextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => this.pageToCall),
    );
  }
}

class GoBackHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text("Go Back Home"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          previousPage(context);
        },
      ),
    );

    return button;
  }

  void previousPage(BuildContext context) {
    Navigator.pop(context);
  }
}