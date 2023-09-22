
import 'package:demo_flutter_testing/widgetUpdate/screenTwo.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  TextEditingController preName=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("~~~~initState");
  }

  @override
  void didUpdateWidget(ScreenOne oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("~~~~didUpdateWidget");
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("~~~~didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a name',
                  ),
                  controller: preName,
                ),

                ElevatedButton(
                    onPressed: () async {
                     bool res=await Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenTwo()));
                     if(res == true){
                       // initState();
                       didChangeDependencies();
                     }
                    },
                    child: const Text("Next Screen"))
              ],
            ),
          ),
        )
    );
  }
}
