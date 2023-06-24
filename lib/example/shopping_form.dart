import 'package:flutter/material.dart';
import 'package:ki_flutter_2023/example/components/extension.dart';
import 'package:ki_flutter_2023/model/item.dart';

class ShoppingForm extends StatefulWidget {
  const ShoppingForm({super.key, this.data, required this.onDataReceived});

  final Item? data;
  final Function(Item) onDataReceived;

  @override
  State<ShoppingForm> createState() => _ShoppingFormState();
}

class _ShoppingFormState extends State<ShoppingForm> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();

  Item? data;

  @override
  void initState() {
    data = widget.data;
    nameController.text = data?.name ?? '';
    descController.text = data?.description ?? '';
    imageController.text = data?.imageURL ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
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

    if (!imageController.text.isURLValid()) {
      showAlert(context: context, message: 'URL Gambar tidak valid');
      return;
    }

    if (data == null) {
      data = Item(
        name: nameController.text,
        description: descController.text,
        imageURL: imageController.text,
      );
    } else {
      data?.setData(
        name: nameController.text,
        description: descController.text,
        imageURL: imageController.text,
      );
    }

    widget.onDataReceived(data!);
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
