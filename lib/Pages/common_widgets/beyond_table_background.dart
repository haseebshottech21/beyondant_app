import 'package:flutter/material.dart';

SingleChildScrollView tableBackground(BuildContext context) {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
