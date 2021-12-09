import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CreateDeviceTypeDialog extends StatefulWidget {
  final String title;
  final TextEditingController firstcontroller;
  final TextEditingController secondcontroller;
  VoidCallback onPressed;
  CreateDeviceTypeDialog({
    required this.title,
    required this.firstcontroller,
    required this.secondcontroller,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CreateDeviceTypeDialogState createState() => _CreateDeviceTypeDialogState();
}

class _CreateDeviceTypeDialogState extends State<CreateDeviceTypeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 5),
            //   child: Text(
            //     'Beyond Link Name',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              child: TextFormField(
                controller: widget.firstcontroller,
                // textAlignVertical: TextAlignVertical.center,
                // textAlign: TextAlign.left,
                // validator: widget.validator,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF000000)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Device Type Name',
                  hintStyle: const TextStyle(color: Colors.black54),
                  // hintStyle: GoogleFonts.montserrat(color: Colors.black),
                  // isDense: true,
                  // helperText: 'Keep it short, this is just a demo.',
                  // prefixIcon: Padding(
                  //   padding: const EdgeInsets.only(left: 15),
                  //   child: widget.prefixIcon,
                  // ),
                  prefixText: '  ',
                  // suffixIcon: suffixIcon,
                  // suffixText: 'USD',
                  // suffixStyle: const TextStyle(color: Colors.green)),
                ),
              ),
            ),
            // TextField(
            //   controller: widget.firstcontroller,
            //   decoration: const InputDecoration(
            //     hintText: "Beyond Link Name",
            //   ),
            // ),
            const Spacer(),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 5),
            //   child: Text(
            //     'User Name',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              child: TextFormField(
                enabled: false,
                controller: widget.secondcontroller,
                // textAlignVertical: TextAlignVertical.center,
                // textAlign: TextAlign.left,
                // validator: widget.validator,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF000000)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Device Type Slug',
                  hintStyle: const TextStyle(color: Colors.black54),
                  // hintStyle: GoogleFonts.montserrat(color: Colors.black),
                  // isDense: true,
                  // helperText: 'Keep it short, this is just a demo.',
                  // prefixIcon: Padding(
                  //   padding: const EdgeInsets.only(left: 15),
                  //   child: widget.prefixIcon,
                  // ),
                  prefixText: '  ',
                  // suffixIcon: suffixIcon,
                  // suffixText: 'USD',
                  // suffixStyle: const TextStyle(color: Colors.green)),
                ),
              ),
            ),
            // TextField(
            //   enabled: false,
            //   controller: widget.secondcontroller,
            //   decoration: const InputDecoration(
            //     hintText: 'Beyond Link User Name',
            //   ),
            // ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'CANCEL',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (widget.firstcontroller.text.isNotEmpty ||
                widget.firstcontroller.text.isEmpty) {
              widget.firstcontroller.text = '';
              // print(widget.firstcontroller.text);
              Navigator.pop(context);
            }
          },
        ),
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
              'CREATE',
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
