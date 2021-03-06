import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserManageViewAlertDialog extends StatefulWidget {
  final String title;
  final String userDateCreated;
  final String userName;
  final String userEmail;
  final String userFirstName;
  final String userLastName;
  final String userRedirectionURL;
  final String userStatus;
  final String userProfilePice;
  const UserManageViewAlertDialog({
    required this.title,
    required this.userDateCreated,
    required this.userName,
    required this.userEmail,
    required this.userFirstName,
    required this.userLastName,
    required this.userRedirectionURL,
    required this.userStatus,
    required this.userProfilePice,
    Key? key,
  }) : super(key: key);

  @override
  _UserManageViewAlertDialogState createState() =>
      _UserManageViewAlertDialogState();
}

class _UserManageViewAlertDialogState extends State<UserManageViewAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        // backgroundColor: AppColors.primaryColor,
        title: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.clipboardList,
              color: AppColors.primaryColor,
              size: 45.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'View Detail',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'This User',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 65,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    boxShadow: kElevationToShadow[8],
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.userProfilePice,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              viewUserContent(
                  title: 'Date Created', detail: widget.userDateCreated),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(title: 'User Name', detail: widget.userName),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(title: 'User Email', detail: widget.userEmail),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(
                  title: 'User First Name', detail: widget.userFirstName),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(
                  title: 'User Last Name', detail: widget.userLastName),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(
                  title: 'Redirection URL',
                  detail: widget.userRedirectionURL,
                  color: true),
              const Divider(
                color: Colors.black26,
              ),
              viewUserContent(title: 'Status', detail: widget.userStatus),
            ],
          ),
        ),
      ),
    );
  }
}

Column viewUserContent({
  required String title,
  required String detail,
  bool color = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          // color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        detail,
        style: TextStyle(
          color: color == true ? AppColors.primaryColor : Colors.grey.shade700,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    ],
  );
}
