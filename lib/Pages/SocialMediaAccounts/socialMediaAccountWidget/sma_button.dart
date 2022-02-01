import 'package:flutter/material.dart';

class ManageAccountBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const ManageAccountBtn({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.045,
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
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        child: const Text(
          'Manage Account',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        // icon: const Icon(Icons.add, size: 17),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          shape: const StadiumBorder(),
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          // minimumSize: Size(
          //   MediaQuery.of(context).size.width * 0.30,
          //   MediaQuery.of(context).size.height * 0.030,
          // ),
          // minimumSize: const Size(100, 32),
        ),
        // onPressed: () {
        //   Navigator.of(context).pushNamed(ManageMySocialMediaAccount.routeName);
        // },
        onPressed: onPressed,
      ),
    );
  }
}
