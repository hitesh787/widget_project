import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatefulWidget {
  const QrCodeWidget({Key? key}) : super(key: key);

  @override
  State<QrCodeWidget> createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Generater"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            const SizedBox(height: 50,),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qrData.isEmpty
                      ? const Text(
                        'Enter data to generater QR code',
                        style: TextStyle(fontSize: 20, color: Colors.indigo),)
                      : QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Data',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
            )
          ],
        ),
      ),
    );
  }
}
