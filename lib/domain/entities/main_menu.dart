import 'package:flutter/material.dart';

class MainMenu {
  final int? order;
  final String? menu;
  final bool? isSelected;
  final void Function()? onTapped;
  final Widget? child;
  final bool isVisible;

  MainMenu({
    this.order,
    this.menu,
    this.isSelected,
    this.onTapped,
    this.child,
    this.isVisible = true,
  });
}
