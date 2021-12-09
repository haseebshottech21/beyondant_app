import 'package:flutter/material.dart';

class BeyondantLogo extends StatelessWidget {
  const BeyondantLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logonew.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
