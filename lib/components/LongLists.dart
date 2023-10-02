import 'package:flutter/material.dart';

class LongLists extends StatelessWidget {
  const LongLists({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return ItemWidget(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: ListTile(
        title: Text(items.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
