import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAllBeyondLinks extends StatefulWidget {
  const EditAllBeyondLinks({Key? key}) : super(key: key);

  @override
  _EditAllBeyondLinksState createState() => _EditAllBeyondLinksState();
}

class _EditAllBeyondLinksState extends State<EditAllBeyondLinks> {
  final double coverHeight = 180;
  final double profileHeight = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: myAppBar('Edit All Beyond Links'),
      body: Column(
        children: [
          buildTop(),
          Text('marcrubin697'),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 1.5;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          // alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: coverHeight,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.7),
                  child: const FaIcon(
                    FontAwesomeIcons.camera,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: profileHeight,
              width: 80,
              color: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}
