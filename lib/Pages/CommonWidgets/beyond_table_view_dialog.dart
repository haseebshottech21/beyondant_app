import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BeyondAlertViewDialog extends StatefulWidget {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String contNumber;
  final String meetingLoc;
  const BeyondAlertViewDialog({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contNumber,
    required this.meetingLoc,
    Key? key,
  }) : super(key: key);

  @override
  _BeyondAlertViewDialogState createState() => _BeyondAlertViewDialogState();
}

class _BeyondAlertViewDialogState extends State<BeyondAlertViewDialog> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      // animate: true,
      // duration: Duration(milliseconds: 500),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewDetailContent('First Name', widget.firstName),
              const Divider(
                color: Colors.black26,
              ),
              viewDetailContent('Last Name', widget.lastName),
              const Divider(
                color: Colors.black26,
              ),
              viewDetailContent('Email', widget.email),
              const Divider(
                color: Colors.black26,
              ),
              viewDetailContent('Contact Number', widget.contNumber),
              const Divider(
                color: Colors.black26,
              ),
              viewDetailContent('Meeting Location', widget.meetingLoc),
            ],
          ),
        ),
      ),
    );
  }
}

Column viewDetailContent(
  String title,
  String detail,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        detail,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    ],
  );
}
