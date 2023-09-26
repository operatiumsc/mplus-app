import 'package:flutter/material.dart';

class ShipmentMenu extends StatelessWidget {
  const ShipmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.0,
        children: [
          FilterChip(
            selected: false,
            label: const Text('All'),
            selectedColor: Colors.lightGreen,
            onSelected: (isSelected) {},
          ),
          FilterChip(
            selected: false,
            label: const Text('Ready for picking'),
            selectedColor: Colors.lightGreen,
            onSelected: (isSelected) {},
          ),
          FilterChip(
            selected: true,
            label: const Text('Currently deliver'),
            selectedColor: Colors.lightGreen,
            onSelected: (isSelected) {},
          ),
          FilterChip(
            selected: false,
            label: const Text('Completed'),
            onSelected: (isSelected) {},
          ),
        ],
      ),
    );
  }
}
