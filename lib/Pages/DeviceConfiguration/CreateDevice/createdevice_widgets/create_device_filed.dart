import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CreateDeviceField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  CreateDeviceField({
    required this.hintText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.055,
      child: TextFormField(
        controller: controller,
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
          hintText: hintText,
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
    );
  }
}
