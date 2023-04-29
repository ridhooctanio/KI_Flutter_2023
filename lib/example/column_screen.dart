import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                'Teks 1',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.lime,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text('Teks 2'),
                ),
                const Text('Teks 3')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
