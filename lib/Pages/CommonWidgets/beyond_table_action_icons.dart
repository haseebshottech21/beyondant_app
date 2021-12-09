import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionIcons extends StatelessWidget {
  final IconData icon;
  const ActionIcons({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[350],
      radius: 17,
      child: FaIcon(
        icon,
        size: 16,
        color: Colors.black,
      ),
    );
  }
}
