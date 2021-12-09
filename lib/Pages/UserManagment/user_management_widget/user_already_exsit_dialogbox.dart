import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';

class UserAlreadyExistDialog extends StatefulWidget {
  final String username;
  // final String useremail;
  const UserAlreadyExistDialog({
    required this.username,
    // required this.useremail,
    Key? key,
  }) : super(key: key);

  @override
  _UserAlreadyExistDialogState createState() => _UserAlreadyExistDialogState();
}

class _UserAlreadyExistDialogState extends State<UserAlreadyExistDialog> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: AlertDialog(
        title: Column(
          children: [
            Text(
              'OOPS!',
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Please Correct following fields',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            // Text(
            //   widget.useremail,
            //   style: const TextStyle(
            //     fontSize: 16,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
