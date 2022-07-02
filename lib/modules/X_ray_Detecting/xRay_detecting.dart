//
// import 'dart:io';
//
// import 'package:covid/shared/colors/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class Tensorflow extends StatefulWidget {
//   @override
//   _TensorflowState createState() => _TensorflowState();
// }
//
// class _TensorflowState extends State<Tensorflow> {
//   List _outputs;
//   File _image;
//   bool _loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//
//     loadModel().then((value) {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }
//
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//       numThreads: 1,
//     );
//   }
//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//         path: image.path,
//         imageMean: 0.0,
//         imageStd: 255.0,
//         numResults: 2,
//         threshold: 0.2,
//         asynch: true
//     );
//     setState(() {
//       _loading = false;
//       _outputs = output;
//     });
//   }
//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }
//   pickImage() async {
//     var image  = await ImagePicker().getImage(source: ImageSource.gallery);
//     if (image == null) return null;
//     setState(() {
//       _loading = true;
//       _image = File(image.path) ;
//     });
//     classifyImage(_image);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Tensorflow Lite",
//           style: TextStyle(color: Colors.white, fontSize: 25),
//         ),
//         backgroundColor: bluelightColor,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _loading ? Container(
//                   height: 300,
//                   width: 300,
//                 ):
//                 Container(
//                   margin: EdgeInsets.all(20),
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       _image == null ? Container() : Image.file(_image),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       _image == null ? Container() : _outputs != null ?
//                       Text(_outputs[0]["label"],style: TextStyle(color: Colors.black,fontSize: 20),
//                       ) : Container(child: Text(""))
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 FloatingActionButton(
//                   tooltip: 'Pick Image',
//                   onPressed: pickImage,
//                   child: Icon(Icons.add_a_photo,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                   backgroundColor: bluelightColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: null_aware_before_operator

import 'dart:io';

import 'package:covid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class XRayDetectingScreen extends StatefulWidget {
  @override
  _XRayDetectingScreenState createState() => _XRayDetectingScreenState();
}

class _XRayDetectingScreenState extends State<XRayDetectingScreen> {
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
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              defaultAppBar(
                text: 'Covid-19 detector ',
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
              SizedBox(height: 30,),
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
      ),
    );
  }
}
