import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:html/dom.dart' as dom;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CONTENT
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  header(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 15, left: 15),
                    child: onSale(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 100.0, right: 15, left: 15),
                    child: description(),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            child: shareButtons(),
          ),
        ],
      ),
      // BACK BUTTON
      //floatingActionButton: backButton(),
    );
  }

  Widget header() {
    double screenX = MediaQuery.of(context).size.width;
    double dateSize = 90.0;
    double containerSize = screenX * 0.8;

    return Stack(
      children: <Widget>[
        image(),
        Positioned(
          left: screenX / 2 - containerSize / 2,
          child: Container(
            width: containerSize,
            child: Column(
              children: <Widget>[
                date(dateSize),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: title1(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: title2(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: like(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget image() {
    String imgPath =
        "https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Valery_Gergiev-36-photo_Alberto_Venzago-375x240.jpg";
    return Image.network(imgPath, fit: BoxFit.cover, width: 1000.0);
    
    
    // Image image = await ImageDownloader.downloadImage(imgPath);
    // return image;
  }

  Widget date(double size) {
    String text1 = "September";
    String text2 = "17";

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Container(
        width: size,
        height: size,
        color: Colors.redAccent[700],
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

  Widget title1() {
    String text = "Janine Jansen / Gustavo Gimeno / OPL";
    return Text(
      text,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget title2() {
    String text = "Grand auditorium - 20:00";
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget like() {
    return Icon(
      MdiIcons.heartOutline,
      color: Colors.white,
    );
  }

  Widget onSale() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Container(
        height: 50.0,
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            "On sale in 12 days",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget description() {
    String text = "" +
        "<h4><b>Orchestre Philharmonique de Luxembourg</b></h4><br>" +
        "<div><b>Gustavo Gimeno</b> direction<br>" +
        "<b>Janine Jansen</b> violon</div>" +
        "<p>Avec Ionic, vous allez pouvoir profiter de vos connaissances du développement Angular pour développer des applications mobiles multi-plateformes. Ce framework vous permettra d'utiliser une seule base de code Angular pour créer des applications dynamiques qui profitent des native features des appareils, comme l'appareil photo ou la géolocalisation, tout en évitant les coûts et difficultés liés au développement séparé iOS/Android.</p>" +
        "<p>À la fin de ce cours, vous serez capable de :</p>" +
        "<ul><li>Créer une application multiplateforme basique</li>" +
        "<li>Utiliser les components Ionic pour faciliter le développement</li>" +
        "<li>Interagir avec les utilisateurs grâce aux formulaires</li>" +
        "<li>Intégrer un backend</li>" +
        "<li>Utiliser Ionic Native pour l'accès aux native features des appareils</li></ul>" +
        "<p>Tester et déployer une application complète</p>";

    return Html(
      data: text,
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      customTextAlign: (dom.Node node) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
              return TextAlign.justify;
          }
        }
        return null;
      },
      customTextStyle: (dom.Node node, TextStyle baseStyle) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
            case "span":
            case "div":
              return baseStyle.merge(TextStyle(height: 1, fontSize: 18));
            case "li":
              return baseStyle.merge(TextStyle(height: 1, fontSize: 16));
          }
        }
        return baseStyle;
      },
      // style: TextStyle(
      //   fontSize: 18.0,
      //   color: Colors.black,
      //   decoration: TextDecoration.none,
      //   fontFamily: 'Oxygen',
      //   fontWeight: FontWeight.w300,
      // ),
    );
  }

  Widget backButton() {
    return FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      backgroundColor: Colors.white,
      child: Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }

  Widget shareButtons() {
    final double iconSpace = 20;

    return Row(
      children: <Widget>[
        Container(
          // color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: iconSpace),
                child: genericShareButton(Icons.share, shareAction),
              ),
              Padding(
                padding: EdgeInsets.only(left: iconSpace),
                child: genericShareButton(Icons.event, calendarAction),
              ),
              Padding(
                padding: EdgeInsets.only(left: iconSpace),
                child: genericShareButton(Icons.room, mapAction),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.green,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: iconSpace),
                child: backButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void shareAction() {
    print("Share with Friends");
  }

  void calendarAction() {
    print("Add Event in Calendar");
  }

  void mapAction() {
    print("Get the Itinerary");
  }

  Widget genericShareButton(IconData icon, callback) {
    return CircularGradientButton(
      gradient: Gradients.buildGradient(
        Alignment.topLeft,
        Alignment(0.8, 0.0),
        <Color>[
          Colors.redAccent[100],
          Color(0xFFBB0000),
        ],
      ),
      child: Icon(
        icon,
        //size: 32.0,
        color: Colors.white,
      ),
      callback: () => callback(),
    );
  }
}
