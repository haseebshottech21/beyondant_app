import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Center userProfileImage(VoidCallback onPressed) {
  return Center(
    child: Stack(
      children: [
        ClipOval(
          child: Container(
            width: 140,
            height: 140,
            color: Colors.black54,
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.userAlt,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            backgroundColor: Colors.transparent.withOpacity(0.5),
            child: IconButton(
              onPressed: onPressed,
              icon: const FaIcon(
                FontAwesomeIcons.camera,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
