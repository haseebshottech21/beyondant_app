import 'package:flutter/material.dart';

class BeyondButton extends StatelessWidget {
  final String text;
  final Color color;
  final Size size;
  final void Function()? onPressed;
  const BeyondButton({
    required this.text,
    required this.color,
    required this.size,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
