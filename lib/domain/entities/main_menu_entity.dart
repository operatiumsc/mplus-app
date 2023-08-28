import 'package:flutter/material.dart';

class MainMenuEntity {
  final int? order;
  final String? menu;
  final bool? isSelected;
  final void Function()? onTapped;
  final Widget? child;
  final bool isVisible;

  MainMenuEntity({
    this.order,
    this.menu,
    this.isSelected,
    this.onTapped,
    this.child,
    this.isVisible = true,
  });
}
