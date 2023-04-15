import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.grey,
            child: Image(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/bali.jpg'),
            ),
          ),
          Image(
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Text('Loading ...');
              }
            },
            image: NetworkImage(
                'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg'),
          )
        ],
      ),
    );
  }
}
