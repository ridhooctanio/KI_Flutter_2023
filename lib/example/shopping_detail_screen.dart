import 'package:flutter/material.dart';
import 'package:ki_flutter_2023/model/item.dart';

class ShoppingDetailScreen extends StatefulWidget {
  const ShoppingDetailScreen({super.key});

  @override
  State<ShoppingDetailScreen> createState() => _ShoppingDetailScreenState();
}

class _ShoppingDetailScreenState extends State<ShoppingDetailScreen> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();

  Item? data;

  @override
  void initState() {
    data = Item(
      name: 'Seledri',
      description:
          'Seledri adalah sayuran daun dan tumbuhan obat yang biasa digunakan sebagai bumbu masakan. Beberapa negara termasuk Jepang, Cina dan Korea mempergunakan bagian tangkai daun sebagai bahan makanan.',
      imageURL:
          'https://www.eatingwell.com/thmb/Rj3KWSVbngEGz2nORhX4U2jrAFM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/is-celery-good-for-you-heres-what-an-rd-says-1187b6f3415b4c03b37900ccc4378c13.jpg',
    );
    nameController.text = data?.name ?? '';
    descController.text = data?.description ?? '';
    imageController.text = data?.imageURL ?? '';
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
                      return Container(
                        constraints: const BoxConstraints(
                          maxHeight: 500,
                          minWidth: double.infinity,
                        ),
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 8,
                          right: 8,
                          bottom: 16,
                        ),
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: [
                            SliverToBoxAdapter(
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nama',
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 8),
                            ),
                            SliverToBoxAdapter(
                              child: TextField(
                                controller: descController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Deskripsi',
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                                child: SizedBox(height: 8)),
                            SliverToBoxAdapter(
                              child: TextField(
                                controller: imageController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'URL Gambar',
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 16),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => editItem(context),
                                  child: const Text('Konfirmasi'),
                                ),
                              ),
                            )
                          ],
                        ),
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

  editItem(BuildContext context) {
    if (nameController.text.isEmpty) {
      showAlert(context: context, message: 'Nama tidak boleh kosong');
      return;
    }

    if (descController.text.isEmpty) {
      showAlert(context: context, message: 'Deskripsi tidak boleh kosong');
      return;
    }

    if (imageController.text.isEmpty) {
      showAlert(context: context, message: 'Gambar tidak boleh kosong');
      return;
    }

    setState(() {
      data?.setData(
        name: nameController.text,
        description: descController.text,
        imageURL: imageController.text,
      );
    });
    Navigator.of(context).pop();
  }

  void showAlert({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('KI Flutter 2023'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'),
            ),
          ],
        );
      },
    );
  }
}
