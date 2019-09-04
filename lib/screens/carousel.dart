import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/shared/navigationButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'detailPage.dart';

final List<String> imgList = [
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/NOISERV_2016_cred-VeraMarmelo_5_300x500px.jpg',
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Valery_Gergiev__Alexander_Shapunov_300x500.jpg',
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Janine_Jansen-36-photo_Marco_Borggreve-300x500px_COL_300DPI_RGB.jpg',
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Selma_Uamusse-3-300x500px_COL_XXXDPI_RGB.jpg',
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Carlos_Bica__AZUL_feat._Frank_Mobus__Jim_Black-1-photo_Etienne_Sievers-300x500px_COL_300DPI_RGB.jpg',
  'https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Bonga-1-photo_NKrumah_Lawson-Daku-300x500pxCOL_XXXDPI_RGB.jpg'
];

final List carouselItems = map<Widget>(
  imgList,
  (index, i) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          // color: Colors.blue,
          margin:
              EdgeInsets.only(top: 45.0, right: 10.0, bottom: 0.0, left: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Stack(children: <Widget>[
              Image.network(i, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      bottomCardBar(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        date(90.0),
      ],
    );
  },
).toList();

Widget bottomCardBar() {
  return Stack(
    children: <Widget>[
      Container(
        height: 150.0, // TODO: Dynamic size?!
        color: Color(0x44000000),
      ),
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Janine Jansen / Gustavo Gimeno',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Grand Auditorium - 20:00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )
    ],
  );
}

Widget date(double size) {
  String text1 = "September";
  String text2 = "17";

  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    child: Container(
      width: size,
      height: size,
      color: Colors.red[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text1,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            text2,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
  );
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselState();
}

bool _visible = false;
AnimationController controller;
Animation<double> animation;

class _CarouselState extends State<Carousel> {
  int _current = 0;
  int _previous = 0;

  @override
  Widget build(BuildContext context) {
    // Stuff to fade background image while moving the carousel
    _visible = !_visible;
    int val1, val2 = 0;
    String imgStr1, imgStr2;

    if (_previous <= _current) {
      if (!_visible) {
        val1 = _current;
        val2 = _current - 1;
      } else {
        val1 = _current - 1;
        val2 = _current;
      }
      if (_current == 0) {
        imgStr1 = imgList[_current];
        imgStr2 = imgList[_current];
      } else {
        imgStr1 = imgList[val1];
        imgStr2 = imgList[val2];
      }
    } else {
      if (!_visible) {
        val1 = _current;
        val2 = _current + 1;
      } else {
        val1 = _current + 1;
        val2 = _current;
      }
      if (_current == imgList.length - 1) {
        imgStr1 = imgList[_current];
        imgStr2 = imgList[_current];
      } else {
        imgStr1 = imgList[val1];
        imgStr2 = imgList[val2];
      }
    }
    _previous = _current;

    Image img1 = Image.network(
      imgStr1,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(255, 255, 255, 0.5),
      colorBlendMode: BlendMode.modulate,
    );

    Image img2 = Image.network(
      imgStr2,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(255, 255, 255, 0.5),
      colorBlendMode: BlendMode.modulate,
    );

    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: Text("Squared App"),
        backgroundColor: Colors.blueAccent,
      ),

      // CONTENT
      body: Stack(
        children: <Widget>[
          // Image de fond
          AnimatedOpacity(
            child: img1,
            opacity: _visible ? 0.0 : 1.0,
            duration: Duration(milliseconds: 500),
          ),
          AnimatedOpacity(
            child: img2,
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
          ),

          // Body
          Column(
            children: <Widget>[
              titleText(),
              //Container(height: 5.0, color: Colors.blueGrey,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage()),
                    );
                  });
                },
                child: theCarousel(),
              ),
              GoBackHome(),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        "Upcoming",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 28.0,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(5.0, 5.0),
            ),
          ],
          decoration: TextDecoration.none,
          fontFamily: 'Oxygen',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget theCarousel() {
    return CarouselSlider(
      autoPlay: false,
      enableInfiniteScroll: false,
      viewportFraction: 0.8,
      items: carouselItems,
      enlargeCenterPage: true,
      aspectRatio: 0.8,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}
