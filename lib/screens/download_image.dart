import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadImage extends StatefulWidget {
  _DownloadImageState createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  TextEditingController _controller = TextEditingController(
      text:
          "https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Bonga-1-photo_NKrumah_Lawson-Daku-300x500pxCOL_XXXDPI_RGB.jpg");
  var imgUrl =
      "https://www.philharmonie.lu/media/content/mutimediafiles/saison_19-20/PHIL27_Photos/Bonga-1-photo_NKrumah_Lawson-Daku-300x500pxCOL_XXXDPI_RGB.jpg";

  var progress = "";
  bool downloading = false;

  Future<void> _download() async {
    Dio dio = Dio();

    var dirToSave = await getApplicationDocumentsDirectory();

    await dio.download(_controller.text, "${dirToSave.path}/myImage.jpg",
        onReceiveProgress: (rec, total) {
      setState(() {
        downloading = true;
        progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
      });
    });

    try {} catch (e) {
      throw e;
    }
    setState(() {
      downloading = false;
      progress = "Complete";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Download Image Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            downloading ? CircularProgressIndicator() : displayImage(),
            SizedBox(height: 10),
            downloading ? Text(progress) : SizedBox(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter image URL',
                ),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              child: Text('Download'),
              onPressed: _download,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget displayImage(){
    //TODO: display the downloaded image on screen!
    return Text("Done!");
  }
}
