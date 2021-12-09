import 'dart:convert';
import 'dart:typed_data';
import 'package:beyondant_new_app/Model/userManagementModel/user_managemnet_model.dart';
import 'package:beyondant_new_app/Model/userManagementModel/user_view_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/table_delete_dialogbox.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/table_view_dialogbox.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class UserManagementTable extends StatefulWidget {
  final List<UserManagementModel> userManagementTable;
  const UserManagementTable({
    Key? key,
    required this.userManagementTable,
  }) : super(key: key);

  @override
  State<UserManagementTable> createState() => _UserManagementTableState();
}

class _UserManagementTableState extends State<UserManagementTable> {
  UserViewModel? userView;

  Future getUserView(String username) async {
    final response = await http.get(
      Uri.parse(baseURL + '/user/get-user/$username'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      userView = UserViewModel.fromMap(body['user']);
      // print(userView!.userUsername);
      // isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      // print(body);
      checkTokenExipre(context, await getUserView(username));
      print('Token Expire');
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool _switchValue = true;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            border: const Border(
              top: BorderSide(
                color: Colors.grey,
                // width: 1,
              ),
              left: BorderSide(
                color: Colors.grey,
                // width: 1,
              ),
              right: BorderSide(
                color: Colors.grey,
                // width: 1,
              ),
              bottom: BorderSide(
                color: Colors.grey,
                // width: 1,
              ),
            ),
          ),
          child: DataTable(
            // source: UserDataTable(trafficData: _productsCopy),
            // sortColumnIndex: _currentSortColumn,
            // sortAscending: _isAscending,
            dataRowHeight: 100,
            // rowsPerPage: 10,
            // dividerThickness: 1,
            headingRowColor: MaterialStateProperty.all(const Color(0xFF242424)),
            headingTextStyle: const TextStyle(
              color: Colors.white,
            ),
            columns: <DataColumn>[
              DataColumn(
                  label: const Text('User Id'), onSort: (columnIndex, _) {}),
              DataColumn(
                  label: const Text('First Name'), onSort: (columnIndex, _) {}),
              DataColumn(
                label: const Text('Last Name'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Username'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Profile Type'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Picture'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('QR Code'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Status'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Action'),
                onSort: (columnIndex, _) {},
              ),
            ],
            rows: widget.userManagementTable.map((usermanage) {
              return usermanagementrow(
                widget.userManagementTable.indexOf(usermanage),
                // usermanage['user_id'] =
                //     (widget.userManagementTable.indexOf(usermanage) + 1)
                //         .toString(),
                usermanage.userId,
                usermanage.userFirstName,
                usermanage.userLastName,
                usermanage.userUsername,
                usermanage.userProfileType,
                usermanage.userProfilePic,
                usermanage.userQRCode,
                CupertinoSwitch(
                  activeColor: AppColors.primaryColor,
                  value: usermanage.userIsActive,
                  onChanged: (value) {
                    // setState(() {
                    usermanage.userIsActive = value;
                    // print(users['user_is_active']);
                    // });
                  },
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return UserMangeDeleteAlertDialog(
                          title: 'ARE YOU SURE YOU WANT TO DELETE THIS USER ?',
                          onPressed: () {
                            // deleteMyPersonalBeyondLink(
                            //   mybeyondLink.businessCardId,
                            // );
                            print(usermanage.userId);
                          },
                        );
                      },
                    );
                  },
                  icon: const ActionIcons(
                    icon: FontAwesomeIcons.solidTrashAlt,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // print(userView);
                    await getUserView(usermanage.userUsername);
                    if (userView != null) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          var stringList =
                              userView!.userCreateAt.split(RegExp(r"[T\.]"));
                          var formatedDate = stringList[0];
                          // print(formatedDate);
                          return UserManageViewAlertDialog(
                            title: 'Device Type Detail',
                            userEmail: userView!.userEmail,
                            userDateCreated: formatedDate,
                            userFirstName: userView!.userFirstName,
                            userLastName: userView!.userLastName,
                            userName: userView!.userUsername,
                            userStatus: userView!.userIsActive == true
                                ? 'ENABLE'
                                : 'DISABLE',
                            userProfilePice: userView!.userProfilePic == 'null'
                                ? emptyImage
                                : baseUrlImage + userView!.userProfilePic,
                          );
                        },
                      );
                    }
                  },
                  icon: const ActionIcons(
                    icon: FontAwesomeIcons.solidEye,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  DataRow usermanagementrow(
      int index,
      String id,
      String firstname,
      String lastname,
      String username,
      String profiletype,
      String profilepicture,
      String qrcode,
      CupertinoSwitch status,
      IconButton deleteIcon,
      IconButton viewIcon) {
    return DataRow.byIndex(
      index: index,
      color: MaterialStateColor.resolveWith(
        (states) {
          if (index % 2 == 0) {
            return Colors.grey.shade50;
          } else {
            return Colors.grey.shade300;
          }
        },
      ),
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(firstname)),
        DataCell(Text(lastname)),
        DataCell(Text(username)),
        DataCell(Text(profiletype)),
        DataCell(
          Center(
            child: Container(
              height: 60,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    profilepicture,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        // https://api.beyondant.com:3000/admin/images/1353930725.jfif
        DataCell(
          qrCode(qrcode),
        ),
        DataCell(
          status,
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.userLock,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.solidEnvelopeOpen,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  viewIcon,
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.userEdit,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  deleteIcon,
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.unlock,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.retweet,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ActionIcons(
                      icon: FontAwesomeIcons.userAlt,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container qrCode(String qrimage) {
    // Image example. Put your data string
    String base64Image = qrimage;

    // Convert to UriData
    final UriData data = UriData.parse(base64Image);

    // You can check if data is normal base64 - should return true
    // print(data.isBase64);

    // Will returns your image as Uint8List
    Uint8List myImage = data.contentAsBytes();

    return Container(
      height: 50,
      width: 50,
      child: Image.memory(
        myImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
