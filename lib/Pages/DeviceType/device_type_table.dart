import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Model/device_type_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_device_type_view_dialog.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceTypeTable extends StatefulWidget {
  final VoidCallback getTableData;
  final List<DeviceTypeModel> deviceTypeTable;
  const DeviceTypeTable({
    Key? key,
    required this.deviceTypeTable,
    required this.getTableData,
  }) : super(key: key);

  @override
  _DeviceTypeTableState createState() => _DeviceTypeTableState();
}

class _DeviceTypeTableState extends State<DeviceTypeTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteDeviceType(String deviceName) async {
    bool result = await delete.deleteForAll(
      '/device-types/delete/$deviceName',
    );
    // print('Result $result');
    if (result == true) {
      Navigator.pop(context);
      widget.getTableData();
      setState(() {});
    } else {
      showToast('Failed Deleted');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            dataRowHeight: 90,
            // rowsPerPage: 10,
            // dividerThickness: 1,
            headingRowColor: MaterialStateProperty.all(const Color(0xFF242424)),
            headingTextStyle: const TextStyle(
              color: Colors.white,
            ),
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
                label: const Text('Status'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Action'),
                onSort: (columnIndex, _) {},
              ),
            ],
            rows: widget.deviceTypeTable.map((deviceType) {
              return devicetyperow(
                // item['device_type_id'].toString(),
                (widget.deviceTypeTable.indexOf(deviceType) + 1).toString(),
                deviceType.deviceTypeName,
                CupertinoSwitch(
                  activeColor: AppColors.primaryColor,
                  value: deviceType.deviceTypeIsActive,
                  onChanged: (value) {
                    setState(() {
                      deviceType.deviceTypeIsActive = value;
                      // print(item['device_type_is_active']);
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    // deleteMyPersonalBeyondLink(
                    //   mybeyondLink['business_card_id'].toString(),
                    // );
                    // print(mybeyondLink['business_card_id']);
                    showDialog(
                      context: context,
                      builder: (_) {
                        return BeyondAlertDeleteDialog(
                          title: 'Would you like to delete this device ?',
                          onPressed: () {
                            deleteDeviceType(
                              deviceType.deviceTypeName,
                            );
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return DeviceTypeAlertViewDialog(
                          title: 'Device Type Detail',
                          deviceTypeId: deviceType.deviceTypeId,
                          deviceName: deviceType.deviceTypeName,
                          deviceStatus: deviceType.deviceTypeIsActive == true
                              ? 'Yes Active'
                              : 'No Active',
                        );
                      },
                    );
                  },
                  icon: const ActionIcons(icon: FontAwesomeIcons.solidEye),
                ),
              );
            }
                // DataRow(
                //   cells: [
                //     devicetyperow('1', 'abc', _switchValue),
                //     DataCell(
                //       Text(
                //         item['device_type_id'].toString(),
                //       ),
                //     ),
                //     DataCell(
                //       Text(
                //         item['device_type_name'].toString(),
                //       ),
                //     ),
                //     DataCell(
                //       CupertinoSwitch(
                //         activeColor: AppColors.primaryColor,
                //         value: item['device_type_is_active'],
                //         onChanged: (value) {
                //           setState(() {
                //             item['device_type_is_active'] = value;
                //           });
                //         },
                //       ),
                //     ),
                //     DataCell(
                //       Row(
                //         mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //         children: [
                //           TableIcons(icon: Icons.remove_red_eye),
                //           const SizedBox(
                //             width: 15,
                //           ),
                //           TableIcons(icon: Icons.edit),
                //           const SizedBox(
                //             width: 15,
                //           ),
                //           TableIcons(icon: Icons.delete),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                ).toList(),
          ),
        ),
      ),
    );
  }

  DataRow devicetyperow(
    String id,
    String deviceName,
    CupertinoSwitch switchValue,
    IconButton deleteIcon,
    IconButton viewIcon,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(deviceName)),
        DataCell(
          switchValue,
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              viewIcon,
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {},
                icon: const ActionIcons(icon: FontAwesomeIcons.userEdit),
              ),
              const SizedBox(
                width: 15,
              ),
              deleteIcon,
            ],
          ),
        ),
      ],
    );
  }
}
