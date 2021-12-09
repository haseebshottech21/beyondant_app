import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMangeDeleteAlertDialog extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  const UserMangeDeleteAlertDialog({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _UserMangeDeleteAlertDialogState createState() =>
      _UserMangeDeleteAlertDialogState();
}

class _UserMangeDeleteAlertDialogState
    extends State<UserMangeDeleteAlertDialog> {
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
        title: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.solidTrashAlt,
              color: Colors.white,
              size: 40.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'This User',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        content: Text(
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
