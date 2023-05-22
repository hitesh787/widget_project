import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {

  Future<void> _launchURL(String url) async{

    final Uri uri = Uri(scheme: 'https',host: url);
    if(!await launchUrl(uri,mode: LaunchMode.externalApplication)){
      throw "Can not launch url";
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: ElevatedButton(onPressed: (){
              _launchURL('www.google.com');
            }, child: Text('Open URL in Browser')),
          )
        ],
      ),
    );
  }
}
