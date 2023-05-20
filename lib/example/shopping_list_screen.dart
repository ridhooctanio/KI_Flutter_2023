import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final controller = TextEditingController();
  List<String> shopItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your items',
                hintText: 'Fill here',
                prefixIcon: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () => add(controller.text),
              child: const Text(
                'Tambahkan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Expanded(child: Text('List Items')),
                IconButton(
                  onPressed: () => delete(),
                  icon: const Icon(Icons.clear_all_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shopItems.length,
              itemBuilder: (context, index) {
                final item = shopItems[index];
                return ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    onPressed: () => delete(idx: index),
                    icon: const Icon(Icons.delete_outline),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void add(String item) {
    if (item.isEmpty) {
      showAlert(message: 'Please fill item first');
    } else {
      setState(() {
        shopItems.add(item);
      });
    }
  }

  void delete({int? idx}) {
    if (idx != null) {
      setState(() {
        shopItems.removeAt(idx);
      });
    } else {
      setState(() {
        shopItems.clear();
      });
    }
  }

  void showAlert({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
