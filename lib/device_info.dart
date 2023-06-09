
// Device Information
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceInfoWidget extends StatefulWidget {
  const DeviceInfoWidget({Key? key}) : super(key: key);

  @override
  State<DeviceInfoWidget> createState() => _DeviceInfoWidgetState();
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {

  String text = "Loading...";

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(text, style: const TextStyle(fontSize: 18),),
      ),
    );
  }

  /// loads device info
  void loadInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      setState(() {text = webBrowserInfo.toMap().toString();});
    }
    // else if (Platform.isIOS) {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   print('iOS - Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
    //   setState(() {text = iosInfo.toMap().toString();});
    // }
    // else if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //   print('Android - Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
    //   setState(() {text = androidInfo.toMap().toString();});
    // }
    // else if (Platform.isWindows) {
    //   WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    //   print(windowsInfo.toMap().toString());
    //   setState(() {text = windowsInfo.toMap().toString();});
    // }
    // else if (Platform.isMacOS) {
    //   MacOsDeviceInfo macOSInfo = await deviceInfo.macOsInfo;
    //   print(macOSInfo.toMap().toString());
    //   setState(() {text = macOSInfo.toMap().toString();});
    // }
    // else if (Platform.isLinux) {
    //   LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
    //   print(linuxInfo.toMap().toString());
    //   setState(() {text = linuxInfo.toMap().toString();});
    // }
  }

}