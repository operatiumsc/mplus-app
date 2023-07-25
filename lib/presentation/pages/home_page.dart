import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello World')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.book),
                label: Text('Purchase Orders')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.book_outlined),
                label: Text('Quotations')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.receipt),
                label: Text('Invoices')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.backup),
                label: Text('Backorders')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.people),
                label: Text('Customers'))
          ],
        ),
      ),
    );
  }
}
