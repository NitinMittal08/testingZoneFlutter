

import 'package:flutter/material.dart';


class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  TextEditingController name=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a name',
                  ),
                  controller: name,
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,true);
                    },
                    child: const Text("Save Text"))
              ],
            ),
          ),
        )
    );
  }
}
