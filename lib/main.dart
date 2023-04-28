import 'package:flutter/material.dart';
import 'package:ki_flutter_2023/auth/login_screen.dart';
import 'package:ki_flutter_2023/auth/register_screen.dart';
import 'package:ki_flutter_2023/example/button_screen.dart';
import 'package:ki_flutter_2023/example/column_screen.dart';
import 'package:ki_flutter_2023/example/field_screen.dart';
import 'package:ki_flutter_2023/example/image_screen.dart';
import 'package:ki_flutter_2023/example/row_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      routes: {
        '/': (context) => const MyHomePage(title: 'Teks Title'),
        '/column': (context) => const ColumnScreen(),
        '/row': (context) => const RowScreen(),
        '/image': (context) => const ImageScreen(),
        '/field': (context) => const FieldScreen(),
        '/button': (context) => const ButtonScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Week 2'),
        leading: const Text('Kiri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
