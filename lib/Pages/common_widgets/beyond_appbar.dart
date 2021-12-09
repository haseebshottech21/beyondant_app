import 'package:beyondant_new_app/Pages/Dashboard/dash_widgets/dash_popupmenubtn.dart';
import 'package:flutter/material.dart';

AppBar myAppBar(String appbarTitle) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.black,
    title: Text(
      appbarTitle,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    actions: const [
      PopupMenuButtonBeyond(),
    ],
  );
}
