import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'mybeyondlink_widgets/dialog_box.dart';

class CreateMyPersonalBeyondLink extends StatefulWidget {
  final VoidCallback getTableData;
  const CreateMyPersonalBeyondLink({Key? key, required this.getTableData})
      : super(key: key);

  @override
  _CreateMyPersonalBeyondLinkState createState() =>
      _CreateMyPersonalBeyondLinkState();
}

class _CreateMyPersonalBeyondLinkState
    extends State<CreateMyPersonalBeyondLink> {
  var beyondLinkName = TextEditingController();
  var beyondLinkUsername = TextEditingController();
  bool isButtonActive = true;

  BeyondantAPI createApi = BeyondantAPI();
  // var username;

  @override
  void initState() {
    getUsername();
    beyondLinkName.text = '';
    super.initState();
  }

  void getUsername() async {
    beyondLinkUsername.text = await getSharedPrefenceValue(username);
  }

  Future<void> createMyPersonalBeyondLink() async {
    var formData = {
      'business_card_name': beyondLinkName.text,
      'business_card_user_username': await getSharedPrefenceValue(username),
    };

    if (beyondLinkName.text.isNotEmpty) {
      await createApi.createMyBeyondLink(
        '/business-cards/create/my-card',
        formData,
        context,
      );
      // await getMyPersonalBeyondLinkList();
      if (beyondLinkName.text.isNotEmpty || beyondLinkName.text.isEmpty) {
        beyondLinkName.text = '';
      }
      widget.getTableData();
      setState(() {});
    } else {
      Fluttertoast.showToast(
        msg: 'Input field cannot be empty',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return FadeInDown(
                  child: CreateMyBeondLinkDialog(
                    title: 'Create Beyond Link',
                    firstcontroller: beyondLinkName,
                    secondcontroller: beyondLinkUsername,
                    onChanged: (val) {
                      setState(() {});
                      // print(val);
                    },
                    onPressed: beyondLinkName.text.isEmpty
                        ? null
                        : createMyPersonalBeyondLink,
                  ),
                );
              },
            );
          },
        );
      },
      icon: Icon(
        Icons.add_box,
        color: AppColors.primaryColor,
        size: 30.0,
      ),
    );
  }
}
