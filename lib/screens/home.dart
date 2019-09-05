import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/carousel.dart';
import 'package:hello_flutter/screens/default.dart';
import 'package:hello_flutter/screens/shared/navigationButton.dart';
import 'package:hello_flutter/screens/squared.dart';
import 'package:hello_flutter/screens/todo.dart';
import 'download_image.dart';
import 'fuel_consumption.dart';
import 'your_name.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: Alignment.center,
        color: Colors.deepPurpleAccent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  theRow1(),
                  theRow2(),
                  FishImageWidget(),
                  TheRaisedButton(),
                  Container(height: 30.0),
                ],
              ),
            ),

            // BUTTONS
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ChangePageGenericButton(
                          title: "Your Name App", pageToCall: YourName()),
                      Container(width: 25.0),
                      ChangePageGenericButton(
                          title: "Fuel Consumption App",
                          pageToCall: FuelConsumption()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ChangePageGenericButton(
                          title: "ToDo App", pageToCall: ToDoApp()),
                      Container(width: 25.0),
                      ChangePageGenericButton(
                          title: "Squared App", pageToCall: Squared()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ChangePageGenericButton(
                          title: "Default App", pageToCall: Default()),
                      Container(width: 25.0),
                      ChangePageGenericButton(
                          title: "Philharmonie App",
                          pageToCall: Carousel(),
                          color: Colors.red[700],
                          textColor: Colors.white),
                    ],
                  ),
                  ChangePageGenericButton(
                    title: "DI",
                    pageToCall: DownloadImage(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Row theRow1() {
    return Row(
      children: <Widget>[
        Expanded(
          child: sayLine1Text(),
        ),
        Expanded(child: sayHelloText(), flex: 2),
      ],
    );
  }

  Row theRow2() {
    return Row(
      children: <Widget>[
        Expanded(child: sayLine2Text()),
        Expanded(child: sayHDYDText(), flex: 2),
      ],
    );
  }

  Text sayHDYDText() {
    String hdyd = "How do you do, bro?";
    return Text(
      hdyd,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 28.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text sayLine1Text() {
    String hello = "Line 1:";
    return Text(
      hello,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 36.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text sayLine2Text() {
    String hello = "Line 2:";
    return Text(
      hello,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 36.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text sayHelloText() {
    String hello = "Hey Flutter Mofo!";
    return Text(
      hello,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 28.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class FishImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage fish = AssetImage('images/fish.png');
    Image image = Image(
      image: fish,
      width: 200.0,
      height: 150.0,
    );
    return Container(
      child: image,
    );
  }
}

class TheRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text("Click Bait!"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          clickAction(context);
        },
      ),
    );

    return button;
  }

  void clickAction(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Caught you!"),
      content: Text("You clicked on the button."),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
