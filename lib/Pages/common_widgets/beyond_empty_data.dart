import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container emptyData(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.timesCircle,
          color: AppColors.primaryColor,
          size: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('NO DATA FOUND')
      ],
    ),
  );
}

Container emptyDataImage(BuildContext context, String image) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.60,
    child: Image.asset(image),
  );
}
