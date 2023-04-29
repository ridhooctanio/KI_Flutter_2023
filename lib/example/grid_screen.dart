import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Container(
            color: Colors.red,
            child: Center(child: Text('Item 1')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('Item 2')),
          ),
          Container(
            color: Colors.yellow,
            child: Center(child: Text('Item 3')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Item 4')),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              // shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: AssetImage('assets/images/bali.jpg'),
              ),
            ),
            child: Center(
              child: Text(
                'Bali',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
