

import 'package:flutter/material.dart';

class WidgetCheckBox extends StatefulWidget {
  const WidgetCheckBox({Key? key}) : super(key: key);

  @override
  State<WidgetCheckBox> createState() => _WidgetCheckBoxState();
}

class _WidgetCheckBoxState extends State<WidgetCheckBox> {

  bool isChecked = false;
  bool check = false;

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
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      isChecked =!isChecked;
                      setState(() { });
                    },
                  ), const Text("Male"),
                ],
              ),
              
              Row(
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (value) {
                      if(value == true){
                        value = false;
                      }else{
                        value = true;
                      }
                      debugPrint("Check $value");
                      check =!check;
                      setState(() { });
                    },
                  ), const Text("Female"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
