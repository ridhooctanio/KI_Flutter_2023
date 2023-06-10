import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> with WidgetsBindingObserver {
  final controller = TextEditingController();
  String greeting = 'Hello World';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      debugPrint('Enter background');
    } else if (state == AppLifecycleState.resumed) {
      debugPrint('Enter Screen');
      setState(() {
        greeting = 'Hello, Welcome back!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greeting),
            ElevatedButton(
              onPressed: () {
                showForm(context: context);
              },
              child: const Text('Ubah'),
            ),
          ],
        ),
      ),
    );
  }

  void showForm({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('KI Flutter 2023'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Ketik disini'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  greeting = controller.text;
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
