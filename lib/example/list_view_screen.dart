import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text('29 April 2023'),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    height: 40,
                    child: Text('Header'),
                  );
                } else {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Item $index'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
