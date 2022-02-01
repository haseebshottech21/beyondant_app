import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class UpdateDeviceType extends StatefulWidget {
  final String title;
  final TextEditingController updateController;
  final VoidCallback onPressed;
  const UpdateDeviceType({
    required this.title,
    required this.updateController,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _UpdateDeviceTypeState createState() => _UpdateDeviceTypeState();
}

class _UpdateDeviceTypeState extends State<UpdateDeviceType> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black87,
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
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Device Name',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.050,
            child: TextFormField(
              controller: widget.updateController,
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
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      actions: <Widget>[
        // TextButton(
        //   child: const Text(
        //     'CANCEL',
        //     style: TextStyle(
        //       color: Colors.white,
        //     ),
        //   ),
        //   onPressed: () {
        //     if (widget.firstcontroller.text.isNotEmpty ||
        //         widget.firstcontroller.text.isEmpty) {
        //       widget.firstcontroller.text = '';
        //       // print(widget.firstcontroller.text);
        //       Navigator.pop(context);
        //     }
        //   },
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
              'UPDATE',
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
