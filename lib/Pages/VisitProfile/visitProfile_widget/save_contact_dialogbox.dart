import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_formfields.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SaveContactDialogBox extends StatefulWidget {
  final TextEditingController meetingController;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController emailController;
  final TextEditingController contactController;
  final Function()? onPressed;
  const SaveContactDialogBox({
    required this.meetingController,
    required this.firstnameController,
    required this.lastnameController,
    required this.emailController,
    required this.contactController,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _SaveContactDialogBoxState createState() => _SaveContactDialogBoxState();
}

class _SaveContactDialogBoxState extends State<SaveContactDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      title: const Text(
        'To Stay In Touch - May I Have Your Contact Info As Well?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      content: Container(
        // height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            beyondFormFiled(
              context,
              'Meeting Location',
              widget.meetingController,
            ),
            beyondFormFiled(
              context,
              'First Name',
              widget.firstnameController,
            ),
            beyondFormFiled(
              context,
              'Last Name',
              widget.lastnameController,
            ),
            beyondFormFiled(
              context,
              'Email',
              widget.emailController,
            ),
            beyondFormFiled(
              context,
              'Contact Number',
              widget.contactController,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (widget.meetingController.text.isNotEmpty ||
                widget.meetingController.text.isEmpty ||
                widget.firstnameController.text.isNotEmpty ||
                widget.firstnameController.text.isEmpty ||
                widget.lastnameController.text.isNotEmpty ||
                widget.lastnameController.text.isEmpty ||
                widget.emailController.text.isNotEmpty ||
                widget.emailController.text.isEmpty ||
                widget.contactController.text.isNotEmpty ||
                widget.contactController.text.isEmpty) {
              widget.meetingController.text = '';
              widget.firstnameController.text = '';
              widget.lastnameController.text = '';
              widget.emailController.text = '';
              widget.contactController.text = '';

              Navigator.pop(context);
            }
          },
        ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     shape: const StadiumBorder(),
        //     shadowColor: Colors.transparent,
        //     primary: Colors.black,
        //     minimumSize: Size(
        //       MediaQuery.of(context).size.width * 0.25,
        //       MediaQuery.of(context).size.height * 0.050,
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: const Padding(
        //     padding: EdgeInsets.only(
        //       top: 5,
        //       bottom: 5,
        //     ),
        //     child: Text(
        //       'By Pass',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.w500,
        //         // fontSize: 10.0,
        //         letterSpacing: 0.5,
        //       ),
        //     ),
        //   ),
        // ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            shadowColor: Colors.transparent,
            primary: Colors.black,
            minimumSize: Size(
              MediaQuery.of(context).size.width * 0.25,
              MediaQuery.of(context).size.height * 0.050,
            ),
          ),
          onPressed: widget.onPressed,
          child: const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                // fontSize: 10.0,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
