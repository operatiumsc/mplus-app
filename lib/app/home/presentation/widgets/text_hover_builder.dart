import 'package:flutter/material.dart';

class TextHoverBuilder extends StatefulWidget {
  const TextHoverBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(bool isHovered) builder;

  @override
  State<TextHoverBuilder> createState() => _TextHoverBuilderState();
}

class _TextHoverBuilderState extends State<TextHoverBuilder> {
  bool _isHovered = false;

  updateHovered(bool val) {
    setState(() {
      _isHovered = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => updateHovered(true),
      onExit: (event) => updateHovered(false),
      child: widget.builder(_isHovered),
    );
  }
}
