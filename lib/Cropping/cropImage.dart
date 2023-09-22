
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CropImage extends StatefulWidget {
  const CropImage({Key? key}) : super(key: key);

  @override
  State<CropImage> createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {

  File? image;

  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CheckBox"),


        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [


              (image) == null
                  ?Container(
                margin: const EdgeInsets.only(right: 15,left: 15),
                height: 350,
                width: double.infinity,
                child: const Icon(Icons.photo_camera_back_rounded,size: 300),
              )
                  :Container(
                margin: const EdgeInsets.only(right: 15,left: 15),
                height: 350,
                width: double.infinity,
                child: Image.file(image!),
              ),

              const SizedBox(height: 150),
              ElevatedButton(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  child: const Text("Take Photo")
              )




            ],
          ),
        ),
      ),
    );
  }



  Future pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        _cropImage();
      });
    }
  }


  // add below the code in manifest file
  /*
     <activity
           android:name="com.yalantis.ucrop.UCropActivity"
           android:screenOrientation="portrait"
           android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>

  * */



  //!@Cropping area
  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 10,

        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropping',
            toolbarColor: Colors.purpleAccent,
            hideBottomControls: true,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Cropper'),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.page,
            boundary: const CroppieBoundary(
              width: 200,
              height: 200,
            ),
            viewPort: const CroppieViewPort(width: 480, height: 200, type: 'circle'),
          ),
        ],
      );

      if (croppedFile != null) {
        _croppedFile = croppedFile;
        setState(() {
            image = File(_croppedFile!.path);
        });
      }

    }
  }
}
