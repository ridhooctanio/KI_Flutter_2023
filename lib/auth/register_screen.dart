import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _reObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Image(
              height: 100,
              image: AssetImage('assets/images/img-ki.png'),
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'Enter your name',
                hintText: 'Fill here',
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Enter your email',
                hintText: 'Fill here',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Enter your password',
                hintText: 'Fill here',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: _reObscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Re Enter your password',
                hintText: 'Fill here',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _reObscureText = !_reObscureText;
                    });
                  },
                  icon: Icon(
                    _reObscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
