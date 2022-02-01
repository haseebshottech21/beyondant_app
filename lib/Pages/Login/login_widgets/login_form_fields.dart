import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class UserFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon? prefixIcon;
  String? Function(String?)? validator;
  UserFormField(this.controller, this.hintText, this.prefixIcon, this.validator,
      {Key? key})
      : super(key: key);

  @override
  State<UserFormField> createState() => _UserFormFieldState();
}

class _UserFormFieldState extends State<UserFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      // textAlign: TextAlign.left,
      validator: widget.validator,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.all(10.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF000000),
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        // hintStyle: GoogleFonts.montserrat(color: Colors.black),
        // isDense: true,
        // helperText: 'Keep it short, this is just a demo.',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: widget.prefixIcon,
        ),
        prefixText: '  ',
        // suffixIcon: suffixIcon,
        // suffixText: 'USD',
        // suffixStyle: const TextStyle(color: Colors.green)),
      ),
    );
  }
}

// ignore: must_be_immutable
class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Icon? prefixIcon;
  String? Function(String?)? validator;
  PasswordFormField(
      this.controller, this.hintText, this.prefixIcon, this.validator,
      {Key? key})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  // Initially password is obscure
  bool _obscureText = true;
  String? password;

  // Toggles the password show status
  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      // maxLength: 8,
      onSaved: (val) => password = val,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: widget.prefixIcon,
        ),
        prefixText: '  ',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              _obscureText
                  ? FontAwesomeIcons.solidEyeSlash
                  : FontAwesomeIcons.solidEye,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
