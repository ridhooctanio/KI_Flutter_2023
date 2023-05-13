import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NullAwareScreen extends StatelessWidget {
  NullAwareScreen({super.key});

  String? name;

  @override
  Widget build(BuildContext context) {
    name = 'Ridho';
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Null'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (name != null) {
              debugPrint(name!.length.toString());
            }
          },
          child: Text(name ?? 'Nama Cadangan'),
        ),
      ),
    );
  }
}
