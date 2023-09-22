

import 'package:demo_flutter_testing/Widget/radioButton.dart';
import 'package:demo_flutter_testing/widgetUpdate/screenOne.dart';
import 'package:flutter/material.dart';

import 'Camera/newTest2.dart';
import 'Cropping/cropImage.dart';
import 'Widget/checkBox.dart';
import 'Widget/dropDownButton.dart';
import 'Widget/switchButton.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("DashBoard"),
          ),
         body: Padding(
           padding: const EdgeInsets.all(10),
           child: Column(
             children: [
               Row(
                 children: [
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const WidgetCheckBox()));
                       },
                       style:TextButton.styleFrom(
                           backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("Check Box",style: TextStyle(color: Colors.white))),

                   const SizedBox(width: 5),
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const WidgetSwitchButton()));
                       },
                       style:TextButton.styleFrom(
                           backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("Switch Button",style: TextStyle(color: Colors.white))),

                   const SizedBox(width: 5),
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const WidgetRadioButton()));
                       },
                       style:TextButton.styleFrom(
                           backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("Radio Button",style: TextStyle(color: Colors.white))),
                 ],
               ),

               Row(
                 children: [
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const WidgetDropDownButton()));
                       },
                       style:TextButton.styleFrom(
                         backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("DropDown Button",style: TextStyle(color: Colors.white))),

                   const SizedBox(width: 5),
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const GridGallery1()));
                       },
                       style:TextButton.styleFrom(
                           backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("Gallery All Image",style: TextStyle(color: Colors.white))),

                   const SizedBox(width: 5),
                   TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const CropImage()));
                       },
                       style:TextButton.styleFrom(
                           backgroundColor: Colors.lightBlueAccent
                       ),
                       child: const Text("Cropping Image",style: TextStyle(color: Colors.white))),
                 ],
               ),
             ],
           ),
         ),
        )
    );
  }
}
