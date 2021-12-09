import 'dart:ui';
import 'package:flutter/material.dart';

class LoginFormButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool isLoading;
  const LoginFormButton({
    required this.onClick,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container LoginFormButton(BuildContext context, VoidCallback onClick) {
    return Container(
      // height: formbuttonheight,
      // width: formbuttonwidth,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.9],
          colors: [
            Color(0xFFc11d30),
            Color(0xFF7f0f1b),
          ],
        ),
        // color: Colors.deepPurple.shade300,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.88,
            MediaQuery.of(context).size.height * 0.050,
          ),
        ),
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
        ),
      ),
    );
  }

  // }
}
