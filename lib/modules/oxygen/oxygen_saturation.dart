// ignore_for_file: null_aware_before_operator
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:covid/shared/component/component.dart';

class OxygenSaturationScreen extends StatefulWidget {
  @override
  _OxygenSaturationScreenState createState() => _OxygenSaturationScreenState();
}

class _OxygenSaturationScreenState extends State<OxygenSaturationScreen> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant_oxygen.tflite",
      labels: "assets/labels_oxygen.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  // pickImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   if (image == null) return null;
  //   setState(() {
  //     _loading = true;
  //     _image = image;
  //   });
  //   classifyImage(_image);
  // }
  pickImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickImage2() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            defaultAppBar(
              text: ' Oxygen Saturation ',
            ),
            _loading
                ? Container(
                    height: 300,
                    width: 300,
                  )
                : Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _image == null ? Container() : Image.file(_image),
                        SizedBox(
                          height: 20,
                        ),
                        _image == null
                            ? Container()
                            : _outputs != null
                                ? Text(
                                    _outputs?.length > 0
                                        ? _outputs[0]["label"]
                                        : '',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),

                                    //     Text(_outputs[0]["label"],style: TextStyle(color: Colors.black,fontSize: 20),
                                  )
                                : Container(child: Text(""))
                      ],
                    ),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ElevatedButton.icon(
              // color: Colors.lightBlueAccent,
              onPressed: pickImage2,
              icon: Icon(Icons.camera_alt),
              label: Text(
                "الكاميرا",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
            ),
            ElevatedButton.icon(
              // color: Colors.lightBlueAccent,
              onPressed: pickImage,
              icon: Icon(Icons.photo),
              label: Text(
                "معرض الصور",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
