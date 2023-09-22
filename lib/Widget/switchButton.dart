
import 'package:flutter/material.dart';

class WidgetSwitchButton extends StatefulWidget {
  const WidgetSwitchButton({Key? key}) : super(key: key);

  @override
  State<WidgetSwitchButton> createState() => _WidgetSwitchButtonState();
}

class _WidgetSwitchButtonState extends State<WidgetSwitchButton> {

  bool isSelected =false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Switch Button"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Switch(
                    value: isSelected,
                    onChanged: (value) {
                      debugPrint("Switch button $value");
                      isSelected=!isSelected;
                      setState(() { });
                    },
                ),

                const SizedBox(height: 150),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Current Position ::-- "),
                    Text("$isSelected"),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
}
