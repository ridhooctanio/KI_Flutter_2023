import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkState();
  }

  Future<void> checkState() async {
    const storage = FlutterSecureStorage();
    String id = await storage.read(key: 'id') ?? '';
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (id.isNotEmpty) {
          Navigator.pushReplacementNamed(context, '/shopping');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/img-ki.png'),
          height: 50,
        ),
      ),
    );
  }
}
