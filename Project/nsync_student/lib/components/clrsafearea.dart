import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColoredSafeArea({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0D0D1B),
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: child,
        ),
      ),
    );
  }
}
