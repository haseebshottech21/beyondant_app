import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BeyondAlertDeleteDialog extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  const BeyondAlertDeleteDialog({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _BeyondAlertDeleteDialogState createState() =>
      _BeyondAlertDeleteDialogState();
}

class _BeyondAlertDeleteDialogState extends State<BeyondAlertDeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'NO',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              shadowColor: Colors.transparent,
              primary: Colors.black,
              minimumSize: Size(
                MediaQuery.of(context).size.width * 0.16,
                MediaQuery.of(context).size.height * 0.045,
              ),
            ),
            onPressed: widget.onPressed,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Text(
                'YES',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 1,
          )
        ],
      ),
    );
  }
}
