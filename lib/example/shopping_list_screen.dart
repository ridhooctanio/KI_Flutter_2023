import 'package:flutter/material.dart';
import 'package:ki_flutter_2023/example/shopping_detail_screen.dart';
import 'package:ki_flutter_2023/example/shopping_form.dart';
import 'package:ki_flutter_2023/model/item.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final controller = TextEditingController();
  List<Item> shopItems = [];

  @override
  void initState() {
    super.initState();
  }

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
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image(
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        image: NetworkImage(item.imageURL),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => delete(idx: index),
                      icon: const Icon(Icons.delete_outline),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingDetailScreen(
                            data: item,
                            onDataReceived: (data) {
                              setState(() {
                                shopItems[index] = data;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            builder: (context) {
              return ShoppingForm(onDataReceived: (data) {
                setState(() {
                  shopItems.add(data);
                });
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
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
