import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaAccountURLField extends StatelessWidget {
  // final TextEditingController controller;
  final Function onTextChange;
  final String urlText;
  final VoidCallback removeField;
  final int index;
  final int urlIndex;
  const SocialMediaAccountURLField({
    // required this.controller,
    required this.onTextChange,
    required this.urlText,
    required this.removeField,
    required this.urlIndex,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController();
    // controller.text = urlText;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: MediaQuery.of(context).size.height * 0.055,
        child: TextFormField(
          initialValue: urlText,
          // controller: controller,
          onChanged: (val) => onTextChange(urlIndex, index, val),

          // (val) {
          //   facebookUrls[index] = val.trim();
          // },
          // textAlignVertical: TextAlignVertical.center,
          // textAlign: TextAlign.left,
          // validator: widget.validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            filled: true,
            fillColor: Colors.grey[100],
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            hintText: 'Enter Facebook Valid Url',
            hintStyle: const TextStyle(color: Colors.black54),
            // hintStyle: GoogleFonts.montserrat(color: Colors.black),
            // isDense: true,
            // helperText: 'Keep it short, this is just a demo.',
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.only(left: 15),
            //   child: widget.prefixIcon,
            // ),
            prefixText: '  ',
            suffixIcon: GestureDetector(
              onTap: () {
                removeField();
              },
              child: const Icon(
                FontAwesomeIcons.times,
                size: 13,
                color: Colors.black87,
              ),
            ),
            // suffixText: 'USD',
            // suffixStyle: const TextStyle(color: Colors.green)),
          ),
        ),
      ),
    );
  }
}
