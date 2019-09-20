import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/animation_page.dart';
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
              padding: EdgeInsets.only(top: 0.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  theRow1(),
                  theRow2(),
                  FishImageWidget(),
                  ButtonZone(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ChangePageGenericButton(
                        title: "DI",
                        pageToCall: DownloadImage(),
                      ),
                      Container(width: 25.0),
                      ChangePageGenericButton(
                        title: "Animations",
                        pageToCall: AnimationPage(),
                      ),
                    ],
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
        fontSize: 24.0,
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
        fontSize: 28.0,
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
        fontSize: 28.0,
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
        fontSize: 24.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class ButtonZone extends StatelessWidget {
  const ButtonZone({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Simple button displaying message
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TheRaisedButton(),
          ],
        ),
        // Snackbars
        Padding(
          child: Container(
            child: Text(
              "===== SNACKBARS =====",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.yellowAccent,
                fontFamily: 'Oxygen',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GenericSnackbarButton(
                context: context,
                text: "Default",
                callback: showDefaultSnackbar),
            const SizedBox(width: 15.0),
            GenericSnackbarButton(
                context: context,
                text: "Default like",
                callback: showSimpleFlushbar),
            const SizedBox(width: 15.0),
            GenericSnackbarButton(
                context: context,
                text: "Info",
                callback: showInfoFlushbar),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GenericSnackbarButton(
                context: context,
                text: "Helper",
                callback: showInfoFlushbarHelper),
            const SizedBox(width: 15.0),
            GenericSnackbarButton(
                context: context,
                text: "Floating",
                callback: showFloatingFlushbar),
          ],
        ),
      ],
    );
  }

  // Default Snackbar
  showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("This is the default Snackbar"),
        action: SnackBarAction(
          label: 'Click Me',
          onPressed: () {},
        ),
      ),
    );
  }

  // Flushbar 1
  void showSimpleFlushbar(BuildContext context) {
    Flushbar(
      // There is also a messageText property for when you want to
      // use a Text widget and not just a simple String
      message: 'Hello from a Flushbar',
      // Even the button can be styled to your heart's content
      mainButton: FlatButton(
        child: Text(
          'Click Me',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () {},
      ),
      duration: Duration(seconds: 3),
      // Show it with a cascading operator
    )..show(context);
  }

  // Flushbar 2
  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'This action is prohibited',
      message: 'Lorem ipsum dolor sit amet',
      // ICON
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300, // Blue bar at the left side
      duration: Duration(seconds: 3),
    )..show(context);
  }

  // Flushbar 3: Same as Info but with less customization!
  // See documentation for more predefined bars
  void showInfoFlushbarHelper(BuildContext context) {
    FlushbarHelper.createInformation(
      title: 'This action is prohibited',
      message: 'Same as Info but with less customization!',
    ).show(context);
  }

  //
  void showFloatingFlushbar(BuildContext context) {
    Flushbar(
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.7, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'This is a floating Flushbar',
      message: 'Dismiss it by swiping left or right',
    )..show(context);
  }
}

class GenericSnackbarButton extends StatelessWidget {
  const GenericSnackbarButton({
    Key key,
    @required this.context,
    @required this.text,
    @required this.callback,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final callback;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 110.0,
      height: 30.0,
      child: RaisedButton(
        child: Text(text),
        onPressed: () {
          //clickAction(context);
          callback(context);
        },
        color: Colors.lightBlueAccent,
        elevation: 5.0,
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
      height: 120.0,
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
      //margin: EdgeInsets.only(top: 50.0),
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
