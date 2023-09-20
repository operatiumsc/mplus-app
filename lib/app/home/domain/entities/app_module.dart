import 'package:flutter/material.dart';

class AppModule {
  String name;
  List<SubModule> subModules;
  Widget child;
  bool isSelected;

  AppModule({
    required this.name,
    required this.child,
    required this.subModules,
    this.isSelected = false,
  });
}

class SubModule {
  String name;
  bool isSelected;

  SubModule({
    required this.name,
    this.isSelected = false,
  });
}
