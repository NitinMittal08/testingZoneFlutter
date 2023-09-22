
import 'package:flutter/material.dart';

class WidgetRadioButton extends StatefulWidget {
  const WidgetRadioButton({Key? key}) : super(key: key);

  @override
  State<WidgetRadioButton> createState() => _WidgetRadioButtonState();
}

enum Fruit { apple, banana }

class _WidgetRadioButtonState extends State<WidgetRadioButton> {
  Fruit? _fruit = Fruit.apple;


  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Radio Button"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child:  Column(
              children: [
                ListTile(
                  title: const Text("Apple"),
                  leading:  Radio(
                    value: Fruit.apple,
                    groupValue: _fruit,
                    onChanged: (Fruit? value) {
                      _fruit= value;
                      debugPrint("Radio Button $_fruit");
                      setState(() {});
                    },
                  ),
                ),

                ListTile(
                  title: const Text("Banana"),
                  leading:  Radio(
                    value: Fruit.banana,
                    groupValue: _fruit,
                    onChanged: (Fruit? value) {
                      _fruit= value;
                      debugPrint("Radio Button $_fruit");
                      setState(() {});
                    },
                  ),
                ),



                const Text("Selected Fruit is ::--"),
                 Text("$_fruit"),
              ],
            ),
          ),
        )
    );
  }
}
