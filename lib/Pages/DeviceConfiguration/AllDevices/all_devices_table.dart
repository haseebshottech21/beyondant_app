import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Model/deviceConfigurationModel/all_device_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllDevicesTable extends StatefulWidget {
  final VoidCallback getTableData;
  final List<AllDeviceModel> allDevicesTable;
  const AllDevicesTable({
    required this.allDevicesTable,
    required this.getTableData,
    Key? key,
  }) : super(key: key);

  @override
  _AllDevicesTableState createState() => _AllDevicesTableState();
}

class _AllDevicesTableState extends State<AllDevicesTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteAllDevices(String deviceId) async {
    bool result = await delete.deleteForAll(
      '/devices/delete/other-devices/$deviceId',
    );
    if (result) {
      Navigator.pop(context);
      widget.getTableData();
      setState(() {});
    } else {
      showToast('Failed Deleted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: PaginatedDataTable(
        source: UserDataTable(
          allDevices: widget.allDevicesTable,
          onDeleteAllDevices: deleteAllDevices,
          context: context,
        ),
        // sortColumnIndex: _currentSortColumn,
        // sortAscending: _isAscending,
        dataRowHeight: 80,
        rowsPerPage: 10,
        // dividerThickness: 1,
        // headingRowColor: MaterialStateProperty.all(Color(0xFF212529)),
        // headingTextStyle: const TextStyle(
        //   color: Colors.white,
        // ),
        columns: <DataColumn>[
          DataColumn(
            label: const Text('#'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Device Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('User Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Device Type'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Beyond Link Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Order Number'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('First Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Last Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Device URL'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Profile Picture'),
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
        // rows: allBeyondLinks
        //     .map((allbeyondLink) => allbeyondlinksrow(
        //         // allbeyondlinkid(),
        //         allbeyondLink['business_card_id'].toString(),
        //         allbeyondLink['user']['user_first_name'].toString(),
        //         allbeyondLink['business_card_name'].toString(),
        //         allbeyondLink['user']['user_last_name'].toString(),
        //         allbeyondLink['user']['user_username'].toString(),
        //         CupertinoSwitch(
        //           activeColor: AppColors.primaryColor,
        //           value: allbeyondLink['business_card_is_active'],
        //           onChanged: (value) {
        //             setState(() {
        //               allbeyondLink['business_card_is_active'] = value;
        //               // print(item['device_type_is_active']);
        //             });
        //           },
        //         ),
        //         // allbeyondLink['business_card_name'].toString(),
        //         allbeyondLink['user']['user_profile_picture'] == null
        //             ? 'https://www.pngkey.com/png/full/22-223848_businessman-vector-person-logo-png.png'
        //             : baseUrl +
        //                 allbeyondLink['user']['user_profile_picture']
        //                     .toString()))
        //     .toList(),
      ),
    );
  }
}

class UserDataTable extends DataTableSource {
  List<AllDeviceModel> allDevices;
  Function onDeleteAllDevices;
  BuildContext context;

  UserDataTable({
    required this.allDevices,
    required this.onDeleteAllDevices,
    required this.context,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= allDevices.length) {
      return null!;
    }
    final allDevicesModel = allDevices[index];
    // print(_traffic['social_media_platform_id']);

    return alldevicesrow(
      index,
      (allDevices.indexOf(allDevicesModel) + 1).toString(),
      // allDevicesModel.deviceId,
      allDevicesModel.deviceName,
      allDevicesModel.userUsername,
      allDevicesModel.deviceTypeName,
      allDevicesModel.businessCardName,
      allDevicesModel.deviceOrderId,
      allDevicesModel.userFirstName,
      allDevicesModel.userLastName,
      deviceURL + allDevicesModel.deviceURL,
      allDevicesModel.userProfilePic == 'null'
          ? emptyImage
          : baseUrlImage + allDevicesModel.userProfilePic,
      CupertinoSwitch(
        activeColor: AppColors.primaryColor,
        value: allDevicesModel.deviceIsActive,
        onChanged: (value) {
          // setState(() {
          allDevicesModel.deviceIsActive = value;
          //   // print(item['device_type_is_active']);
          // });
        },
      ),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BeyondAlertDeleteDialog(
                title: 'Would you like to delete this beyond link ?',
                onPressed: () {
                  onDeleteAllDevices(
                    allDevicesModel.deviceId,
                  );
                  // print(allDevicesModel.deviceId);
                },
              );
            },
          );
        },
        icon: const ActionIcons(icon: FontAwesomeIcons.solidTrashAlt),
      ),
    );
  }

  DataRow alldevicesrow(
    int index,
    String id,
    String devicename,
    String username,
    String devicetype,
    String beyondlinkname,
    String ordernum,
    String firstname,
    String lastname,
    String deviceurl,
    String profilepicture,
    CupertinoSwitch status,
    IconButton deleteIcon,
  ) {
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
        // for (var i = 0; i < allBeyondLinks.length; i++)
        DataCell(Text(id)),
        DataCell(Text(devicename)),
        DataCell(Text(username)),
        DataCell(Text(devicetype)),
        DataCell(Text(beyondlinkname)),
        DataCell(Text(ordernum)),
        DataCell(Text(firstname)),
        DataCell(Text(lastname)),
        DataCell(Text(
          deviceurl,
          style: TextStyle(color: AppColors.primaryColor),
        )),
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
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          status,
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              deleteIcon,
              const SizedBox(
                width: 12,
              ),
              IconButton(
                onPressed: () {},
                icon: const ActionIcons(icon: FontAwesomeIcons.userEdit),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allDevices.length;

  @override
  int get selectedRowCount => 0;
}
