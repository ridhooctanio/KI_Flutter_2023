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

    final data1 = Item(
        name: 'Sawi',
        description:
            'Sawi adalah sekelompok tumbuhan dari genus Brassica yang dimanfaatkan daun atau bunganya sebagai bahan pangan, baik segar maupun diolah. Sawi mencakup beberapa spesies Brassica yang kadang-kadang mirip satu sama lain. Di Indonesia penyebutan sawi biasanya mengacu pada sawi hijau.',
        imageURL:
            'https://dispertan.semarangkota.go.id/induk/uploads/2022/06/sawi.jpg');
    final data2 = Item(
        name: 'Seledri',
        description:
            'Seledri adalah sayuran daun dan tumbuhan obat yang biasa digunakan sebagai bumbu masakan. Beberapa negara termasuk Jepang, Cina dan Korea mempergunakan bagian tangkai daun sebagai bahan makanan.',
        imageURL:
            'https://www.eatingwell.com/thmb/Rj3KWSVbngEGz2nORhX4U2jrAFM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/is-celery-good-for-you-heres-what-an-rd-says-1187b6f3415b4c03b37900ccc4378c13.jpg');
    shopItems.addAll([data1, data2]);
  }

  @override
  Widget build(BuildContext context) {
    List<Item> shopFilterItems = [];
    if (controller.text.isNotEmpty) {
      shopFilterItems = shopItems
          .where((element) => element.name
              .toLowerCase()
              .contains(controller.text.toLowerCase()))
          .toList();
    } else {
      shopFilterItems = shopItems;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.fastfood),
                labelText: 'Search your item',
                suffixIcon: IconButton(
                  onPressed: () => setState(() {}),
                  icon: const Icon(Icons.find_in_page),
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
              itemCount: shopFilterItems.length,
              itemBuilder: (context, index) {
                final item = shopFilterItems[index];
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
                      onPressed: () => delete(idx: newIdx(item)),
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
                                shopItems[newIdx(item)] = data;
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

  int newIdx(Item data) => shopItems.indexOf(data);

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
