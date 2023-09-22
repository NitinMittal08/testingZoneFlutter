
import 'package:flutter/material.dart';

class WidgetDropDownButton extends StatefulWidget {
  const WidgetDropDownButton({Key? key}) : super(key: key);

  @override
  State<WidgetDropDownButton> createState() => _WidgetDropDownButtonState();
}

class DemoModel{
  String? name;
  DemoModel(this.name);
}



class DemoData{
  List<DemoModel> list =[];
  Future<List<DemoModel>> data() async{

    for(int i=0;i<10;i++){
      list.add(DemoModel("Name $i"));
    }
    return list;
  }
}

class _WidgetDropDownButtonState extends State<WidgetDropDownButton> {

  String initialValue="1";
  List<String> list=["1","2","3","4","5","6",];


  String initialValue2="";
  var demoData=DemoData();
  List<String> list2=[];

  @override
  void initState() {
    super.initState();
    initialValue2="";
    for(int i=0;i<10;i++){
      list2.add("Name $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(" DropDown Button"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child:  Column(
              children: [
                DropdownButton(
                  // initial Value
                  value: initialValue,
                  items: list.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  onChanged: (value) {
                    initialValue = value.toString();
                    setState(() { });
                    },
                ),


                DropdownButton(
                  // initial Value
                  hint: const Text("--select--"),
                  value: (initialValue2.isEmpty)?null:initialValue2,
                  items: list2.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items.toString()),
                    );
                  }).toList(),

                  onChanged: (value) {
                    initialValue2 = value.toString();
                    setState(() { });
                    },
                ),
              ],
            ),
          ),
        )
    );
  }
}
