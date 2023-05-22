import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  const CachedNetworkImageWidget({Key? key}) : super(key: key);

  @override
  State<CachedNetworkImageWidget> createState() => _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (c,i){
              return Container(
                margin: const EdgeInsets.all(15),
                height: 250,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageBuilder: (context,imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider,
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  
                  errorWidget: (context,url,error) => const Icon(Icons.error_outline_sharp),
                  placeholder: (context,url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: 'https://images.unsplash.com/photo-1684318551812-63d888cce300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',),

              );
            }),
          )
            
        ],
      ),
    );
  }
}
