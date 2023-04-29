import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Field'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Enter your email',
                hintText: 'example@email.com',
                suffixIcon: Icon(Icons.abc),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Enter your password',
                hintText: '******',
                suffixIcon: Icon(Icons.abc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
