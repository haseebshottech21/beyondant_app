import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SaveContactVisitProfile extends StatefulWidget {
  const SaveContactVisitProfile({Key? key}) : super(key: key);

  @override
  _SaveContactVisitProfileState createState() =>
      _SaveContactVisitProfileState();
}

class _SaveContactVisitProfileState extends State<SaveContactVisitProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton.icon(
          label: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Text('Save Contact'),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.solidSave,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () {
            print('save contact');
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return StatefulBuilder(
            //       builder: (context, setState) {
            //         return FadeInDown(
            //           child: AllBeyondLinkDialogBox(
            //             title: 'Create Beyond Link',
            //             userdropdown: allBeyondUsers,
            //             dropdrownvalue: selectedUser,
            //             onChanged: (val) {
            //               setState(() {});
            //               // print(val);
            //             },
            //             getTableData: () async {
            //               widget.getTableLoad();
            //             },
            //           ),
            //         );
            //       },
            //     );
            //   },
            // );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
