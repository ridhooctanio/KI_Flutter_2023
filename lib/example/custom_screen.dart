import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ki_flutter_2023/example/components/sliver_delegate.dart';

class CustomScrollScreen extends StatelessWidget {
  const CustomScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Scroll View'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 50,
              maxHeight: 50,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('Detail Wisata'),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Image(
              image: AssetImage('assets/images/bali.jpg'),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(
            child: Text(
              'Wisata Bali',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Visit Web'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
