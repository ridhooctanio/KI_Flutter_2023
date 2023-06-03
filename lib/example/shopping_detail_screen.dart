import 'package:flutter/material.dart';
import 'package:ki_flutter_2023/example/shopping_form.dart';
import 'package:ki_flutter_2023/model/item.dart';

class ShoppingDetailScreen extends StatefulWidget {
  const ShoppingDetailScreen(
      {super.key, required this.data, required this.onDataReceived});

  final Item data;
  final Function(Item) onDataReceived;

  @override
  State<ShoppingDetailScreen> createState() => _ShoppingDetailScreenState();
}

class _ShoppingDetailScreenState extends State<ShoppingDetailScreen> {
  Item? data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Detail'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image(
              image: NetworkImage(data?.imageURL ?? ''),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(data?.description ?? ''),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 45,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    builder: (context) {
                      return ShoppingForm(
                        data: data,
                        onDataReceived: (data) {
                          setState(() {
                            this.data = data;
                            widget.onDataReceived(data);
                          });
                        },
                      );
                    },
                  );
                },
                child: const Text('Ubah Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
