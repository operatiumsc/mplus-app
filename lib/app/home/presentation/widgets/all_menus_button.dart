import 'package:flutter/material.dart';

class AllModulesButton extends StatelessWidget {
  const AllModulesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.apps),
      itemBuilder: (context) => [
        const PopupMenuItem(
            child: ListTile(
          title: Text('Sales'),
        )),
        const PopupMenuItem(
            child: ListTile(
          title: Text('Customers'),
        )),
        const PopupMenuItem(
            child: ListTile(
          title: Text('Inventory'),
        )),
        const PopupMenuItem(
            child: ListTile(
          title: Text('Shipments'),
        ))
      ],
    );
  }
}
