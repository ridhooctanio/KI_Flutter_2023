import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  int? total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your first number',
                hintText: 'fill here',
                prefixIcon: Icon(Icons.onetwothree),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your second number',
                hintText: 'fill here',
                prefixIcon: Icon(Icons.onetwothree),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  int? firstNumber;
                  int? secondNumber;

                  if (controller1.text.isNotEmpty) {
                    firstNumber = int.parse(controller1.text);
                  }

                  if (controller2.text.isNotEmpty) {
                    secondNumber = int.parse(controller2.text);
                  }

                  if (firstNumber != null && secondNumber != null) {
                    setState(() {
                      total = firstNumber! + secondNumber!;
                    });
                  } else {
                    setState(() {
                      total = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill first and second number'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: const Text('Jumlahkan'),
              ),
            ),
            const SizedBox(height: 32),
            Visibility(
              visible: total != null,
              child: Text(
                'Hasil ${controller1.text} + ${controller2.text} = $total',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
