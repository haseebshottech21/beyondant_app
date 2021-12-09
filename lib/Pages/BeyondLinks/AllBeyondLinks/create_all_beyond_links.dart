import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'allbeyondlink_widegts.dart/all_beyond_dialog_box.dart';
import 'package:http/http.dart' as http;

class CreateAllBeyondLinks extends StatefulWidget {
  final VoidCallback getTableLoad;
  const CreateAllBeyondLinks({
    Key? key,
    required this.getTableLoad,
  }) : super(key: key);

  @override
  _CreateAllBeyondLinksState createState() => _CreateAllBeyondLinksState();
}

class _CreateAllBeyondLinksState extends State<CreateAllBeyondLinks> {
  var beyondLinkName = TextEditingController();
  List<dynamic> allBeyondUsers = [];
  String selectedUser = '';
  BeyondantAPI createApi = BeyondantAPI();

  @override
  void initState() {
    getAllBeyondLinkUserDropDown();
    super.initState();
  }

  Future getAllBeyondLinkUserDropDown() async {
    final response = await http.get(
      Uri.parse(
        baseURL +
            '/user/for-selection?userUsername=${await getSharedPrefenceValue(username)}&page=1&items=18446744073709551615',
      ),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        allBeyondUsers = body['users']['rows'];
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getAllBeyondLinkUserDropDown);
    }

    // print(body['users']['rows']);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return FadeInDown(
                  child: AllBeyondLinkDialogBox(
                    title: 'Create Beyond Link',
                    userdropdown: allBeyondUsers,
                    dropdrownvalue: selectedUser,
                    onChanged: (val) {
                      setState(() {});
                      // print(val);
                    },
                    getTableData: () async {
                      widget.getTableLoad();
                    },
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
