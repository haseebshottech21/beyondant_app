import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SubmitButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: const StadiumBorder(),
      ),
      icon: const FaIcon(
        FontAwesomeIcons.solidFolderOpen,
        size: 16,
      ),
      label: const Text(
        'SUBMIT',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
