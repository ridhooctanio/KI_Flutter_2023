import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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

  Item? data;
  String _imagePath = '';

  @override
  void initState() {
    data = widget.data;
    nameController.text = data?.name ?? '';
    descController.text = data?.description ?? '';
    _imagePath = data?.image ?? '';
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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Visibility(
                    visible: _imagePath.isNotEmpty,
                    child: Image.file(
                      File(_imagePath),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ambil Gambar Dari ...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text('Kamera'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text('Galeri'),
                    )
                  ],
                )
              ],
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

    if (_imagePath.isEmpty) {
      showAlert(context: context, message: 'Gambar tidak boleh kosong');
      return;
    }

    if (data == null) {
      data = Item(
        name: nameController.text,
        description: descController.text,
        image: _imagePath,
      );
    } else {
      data?.setData(
        name: nameController.text,
        description: descController.text,
        image: _imagePath,
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

  Future _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }
}
