import 'package:flutter/material.dart';

class Squared extends StatefulWidget {
  @override
  _SquaredState createState() => new _SquaredState();
}

class _SquaredState extends State<Squared> with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin = To allow the animation (calls 1 anim / frame)

  Animation<double> animation;
  AnimationController animController;

  int numTaps = 0;
  int numLongPress = 0;
  int numDoubleTaps = 0;
  double posX = 0.0;
  double posY = 0.0;
  final double setttingBarHeight = 20.0; // Height of the title bar
  final double topBarHeight = 15.0; // Height of the title bar
  final double bottomBarHeight = 30.0; // Height of the bottom bar
  double screenY = 0.0;
  double screenX = 0.0;
  double boxSize = 10.0;
  final double fullBoxSze = 150.0;

  @override
  void initState() {
    super.initState();

    //For the Animation
    animController = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInOut,
    );
    animation.addListener(() {
      setState(() {
        boxSize = fullBoxSze * animation.value; // animation.value = From 0 to 1
      });
      center(context);
    });
    // Start animation
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Screen Size
    screenX = MediaQuery.of(context).size.width;
    screenY =
        MediaQuery.of(context).size.height - (bottomBarHeight + topBarHeight);

    // To center the square
    if (posX == 0.0) {
      center(context);
    }

    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: Text("Squared App"),
        backgroundColor: Colors.blueAccent,
      ),

      // CONTENT
      body: GestureDetector(
        // To detect Taps and Presses
        // Taps
        onTap: () {
          setState(() {
            numTaps++;
          });
        },
        // Double Taps
        onDoubleTap: () {
          setState(() {
            numDoubleTaps++;
          });
        },
        // Presses
        onLongPress: () {
          setState(() {
            numLongPress++;
          });
        },

        // To move the square
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            posY += value.delta.dy;
            debugPrint("posY : " + posY.toString());
            if (posY < 0.0) {
              posY = 0.0;
            }
            // I absolutly don't know why I have to add so much stuff to calculate the right position a the bottom of the screen... (because of the black back on Android phone - the one with the round, triangle and square??)
            else if ((posY +
                    boxSize +
                    bottomBarHeight +
                    topBarHeight +
                    setttingBarHeight) >
                (screenY - (bottomBarHeight + topBarHeight))) {
              posY = screenY -
                  boxSize -
                  (bottomBarHeight + topBarHeight) * 2 -
                  setttingBarHeight;
            }
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            posX += value.delta.dx;
            debugPrint("posX : " + posX.toString());
            if (posX < 0.1) {
              posX = 0.1;
            } else if (posX + boxSize > screenX) {
              posX = screenX - boxSize; //screenY - boxSize - bottomBarHeight;
            }
          });
        },

        child: Stack(
          children: <Widget>[
            Positioned(
              left: posX,
              top: posY,
              child: Container(
                alignment: AlignmentDirectional.center,
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  'Move me!',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM BAR
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Taps : $numTaps - Double Taps: $numDoubleTaps - Long Presses: $numLongPress",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // To clean the resources
    super.dispose();

    animController.dispose();
  }

  void center(BuildContext context) {
    // To get the size of the screen
    posX = (screenX / 2) - boxSize / 2;
    posY = (screenY / 2) - boxSize / 2 - (bottomBarHeight + topBarHeight);
    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
