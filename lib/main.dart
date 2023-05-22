// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:widget_project/device_info.dart';
import 'package:widget_project/first.dart';
import 'package:widget_project/second.dart';
import 'package:qrscan/qrscan.dart' as scanner;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "Hello World...!";
  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();
      setState(() {
        result = cameraScanResult; // setting string result with cameraScanResult
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Scanner Example In Flutter"),
      ),
      body: Center(
        child: Text(result), // Here the scanned result will be shown
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {
            _scanQR(); // calling a function when user click on button
          },
          label: const Text("Scan")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



//QR Scanner And Generator
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.qr_code,size: 40,),),
              Tab(icon: Icon(Icons.qr_code_scanner,size: 40,)),
            ],
          ),
          title: const Text('QR / Barcode Scanner',),
        ),
        body: const TabBarView(
          children: [
            First(),
            Second(),
          ],
        ),
      ),
    );
  }
}




//--------OK--------

// table calendar
// intel
// app icons change
// color picker
// country code picker
// url launcher
// currency picker
// toast
// flutter toast
// percentage indicator
// cached network images
// carousel slider
// qr flutter
// chart picker
// device local


// qr scanner