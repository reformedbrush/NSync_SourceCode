import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int page;
  const SideBarButton(
      {super.key, required this.icon, required this.label, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {},
    );
  }
}
