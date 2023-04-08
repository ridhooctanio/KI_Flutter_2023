import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Column',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: Container(
        color: Colors.amber,
        height: 100,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Teks 1',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.lime,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 8),
                  child: Text('Teks 2'),
                ),
                Text('Teks 3')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
