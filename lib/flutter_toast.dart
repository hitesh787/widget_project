import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast extends StatefulWidget {
  const FlutterToast({Key? key}) : super(key: key);

  @override
  State<FlutterToast> createState() => _FlutterToastState();
}

class _FlutterToastState extends State<FlutterToast> {

  showToast(title,color){
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            showToast('like', Colors.green);
          }, child: const Text("Button 2")),
      SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            showToast('Sub', Colors.red);
          }, child: const Text("Button 2")),
        ],
      ),
    );
  }
}
