

import 'dart:io';

import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {

  String? image;
  ShowImage({Key? key, required this.image}) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {

  
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Image")),
          body: Container(
            margin: const EdgeInsets.all(25),
            width: double.infinity,
            height: double.infinity,
            child: Image.file(File(widget.image.toString())),
          ),
        ) 
    );
  }
}
