//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// // import 'package:image_uploader/AlertDialog.dart';
// // import 'package:image_uploader/bottompicker_sheet.dart';
// import 'alert_dialoge.dart';
// import 'bottom_picker_screen.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   final ImagePicker _picker = ImagePicker();
//   File _image;
//   bool uploadStatus = false;
//
//   _imageFromCamera() async {
//     final PickedFile pickedImage =
//     await _picker.getImage(source: ImageSource.camera, imageQuality: 100);
//     if (pickedImage == null) {
//       showAlertDialog(
//           context: context,
//           title: "Error Uploading!",
//           content: "No Image was selected.");
//       return;
//     }
//     final File fileImage = File(pickedImage.path);
//
//     if (imageConstraint(fileImage))
//       setState(() {
//         _image = fileImage;
//       });
//   }
//
//   _imageFromGallery() async {
//     final PickedFile pickedImage =
//     await _picker.getImage(source: ImageSource.gallery, imageQuality: 100);
//     if (pickedImage == null) {
//       showAlertDialog(
//           context: context,
//           title: "Error Uploading!",
//           content: "No Image was selected.");
//       return;
//     }
//     final File fileImage = File(pickedImage.path);
//     if (imageConstraint(fileImage))
//       setState(() {
//         _image = fileImage;
//       });
//   }
//
//   bool imageConstraint(File image) {
//     if (!['bmp', 'jpg', 'jpeg']
//         .contains(image.path.split('.').last.toString())) {
//       showAlertDialog(
//           context: context,
//           title: "Error Uploading!",
//           content: "Image format should be jpg/jpeg/bmp.");
//       return false;
//     }
//     if (image.lengthSync() > 10000000) {
//       showAlertDialog(
//           context: context,
//           title: "Error Uploading!",
//           content: "Image Size should be less than 100KB.");
//       return false;
//     }
//     return true;
//   }
//
//   // uploadImage() async {
//   //   if (_image == null) {
//   //     showAlertDialog(
//   //         context: context,
//   //         title: "Error Uploading!",
//   //         content: "No Image was selected.");
//   //     return;
//   //   }
//   //
//   //   setState(() {
//   //     uploadStatus = true;
//   //   });
//   //   var response = await http
//   //       .post(Uri.parse('https://pcc.edu.pk/ws/file_upload.php'), body: {
//   //     "image": _image.readAsBytes().toString(),
//   //     "name": _image.path.split('/').last.toString()
//   //   });
//   //   print('response');
//   //   if (response.statusCode != 200) {
//   //     showAlertDialog(
//   //         context: context,
//   //         title: "Error Uploading!",
//   //         content: "Server Side Error.");
//   //   } else {
//   //     var result = jsonDecode(response.body);
//   //     print(result);
//   //     showAlertDialog(
//   //         context: context, title: "Image Sent!", content: result['message']);
//   //   }
//   //   setState(() {
//   //     uploadStatus = false;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           // Display Progress Indicator if uploadStatus is true
//           child: uploadStatus
//               ? Container(
//             height: 100,
//             width: 100,
//             child: CircularProgressIndicator(
//               strokeWidth: 7,
//             ),
//           )
//               : Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     bottomPickerSheet(
//                         context, _imageFromCamera, _imageFromGallery);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Container(
//                       width: 300,
//                       height: 300,
//                       decoration: BoxDecoration(
//                         color:HexColor('#AAE3FF'),
//                         image: DecorationImage(
//                           image: _image != null
//                               ? FileImage(_image)
//                               : AssetImage('assets/icons/Click-Here-PNG-HD.png'),fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // child: CircleAvatar(
//                   //   radius: MediaQuery.of(context).size.width / 4,
//                   //   backgroundColor: Colors.grey,
//                   //   backgroundImage: _image != null
//                   //       ? FileImage(_image)
//                   //       : AssetImage('assets/icons/photo.png'),
//                   // ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // ElevatedButton(
//                 //   onPressed: (){},
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(8.0),
//                 //     child: Row(
//                 //       mainAxisSize: MainAxisSize.min,
//                 //       children: [
//                 //         Icon(Icons.file_upload),
//                 //         Text(
//                 //           'Upload Image',
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:images_picker/images_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String path;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text('pick'),
              onPressed: () async {
                List<Media> res = await ImagesPicker.pick(
                  count: 3,
                  pickType: PickType.all,
                  // language: Language.System,
                  // maxTime: 30,
                  // maxSize: 500,
                  cropOpt: CropOption(
                    // aspectRatio: CropAspectRatio.wh16x9,
                    cropType: CropType.circle,
                  ),
                );
                print(res);
                if (res != null) {
                  print(res.map((e) => e.path).toList());
                  setState(() {
                    path = res[0].thumbPath;
                  });
                  // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                  // print(status);
                }
              },
            ),
            ElevatedButton(
              child: Text('openCamera'),
              onPressed: () async {
                List<Media> res = await ImagesPicker.openCamera(
                  // pickType: PickType.video,
                  pickType: PickType.image,
                  quality: 0.8,
                  maxSize: 800,
                  // cropOpt: CropOption(
                  //   aspectRatio: CropAspectRatio.wh16x9,
                  // ),
                  maxTime: 15,
                );
                print(res);
                if (res != null) {
                  print(res[0].path);
                  setState(() {
                    path = res[0].thumbPath;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                File file =
                await downloadFile('https://cdn.chavesgu.com/logo.png');
                bool res = await ImagesPicker.saveImageToAlbum(file,
                    albumName: "chaves");
                print(res);
              },
              child: Text('saveNetworkImageToAlbum'),
            ),
            ElevatedButton(
              onPressed: () async {
                File file = await downloadFile(
                    'https://cdn.chavesgu.com/SampleVideo.mp4');
                bool res = await ImagesPicker.saveVideoToAlbum(file,
                    albumName: "chaves");
                print(res);
              },
              child: Text('saveNetworkVideoToAlbum'),
            ),
            path != null
                ? Container(
              height: 200,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
              ),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future<File> downloadFile(String url) async {
    Dio simple = Dio();
    String savePath = Directory.systemTemp.path + '/' + url.split('/').last;
    await simple.download(url, savePath,
        options: Options(responseType: ResponseType.bytes));
    print(savePath);
    File file = new File(savePath);
    return file;
  }
}
