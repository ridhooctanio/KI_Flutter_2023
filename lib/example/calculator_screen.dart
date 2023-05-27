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
  List<String> historyResult = [];

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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operation(operator: '+'),
                    child: const Text('+'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operation(operator: '-'),
                    child: const Text('-'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operation(operator: '/'),
                    child: const Text('/'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operation(operator: '*'),
                    child: const Text('*'),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: total != null,
              child: const SizedBox(height: 16),
            ),
            Visibility(
              visible: total != null,
              child: Text(
                'Hasil: $total',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(child: Text('List History:')),
                IconButton(
                  onPressed: () {
                    setState(() {
                      historyResult.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.clear_all_outlined,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: historyResult.length,
                itemBuilder: (context, index) {
                  final item = historyResult[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          historyResult.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  operation({required String operator}) {
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
        switch (operator) {
          case '+':
            total = firstNumber! + secondNumber!;
            historyResult.add(
                'Hasil dari Hasil ${controller1.text} + ${controller2.text} = $total');
            break;
          case '-':
            total = firstNumber! - secondNumber!;
            historyResult.add(
                'Hasil dari Hasil ${controller1.text} - ${controller2.text} = $total');
            break;
          case '*':
            total = firstNumber! * secondNumber!;
            historyResult.add(
                'Hasil dari Hasil ${controller1.text} * ${controller2.text} = $total');
            break;
          case '/':
            total = firstNumber! ~/ secondNumber!;
            historyResult.add(
                'Hasil dari Hasil ${controller1.text} / ${controller2.text} = $total');
            break;
          default:
            total = null;
        }
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
  }
}
