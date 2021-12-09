import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDeviceTable extends StatefulWidget {
  final VoidCallback getTableData;
  final List<dynamic> myDevicesTable;
  const MyDeviceTable({
    Key? key,
    required this.getTableData,
    required this.myDevicesTable,
  }) : super(key: key);

  @override
  _MyDeviceTableState createState() => _MyDeviceTableState();
}

class _MyDeviceTableState extends State<MyDeviceTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteMyDevices(String id) async {
    bool result = await delete.deleteForAll(
      '/devices/delete/my-devices/$id',
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
                label: const Text('Device URL'),
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
            rows: widget.myDevicesTable.map((mydevices) {
              return mydevicesrow(
                // mydevices['device_device_type_id'] = (index).toString(),
                (widget.myDevicesTable.indexOf(mydevices) + 1).toString(),
                mydevices['device_name'].toString(),
                mydevices['deviceType']['device_type_name'].toString(),
                mydevices['businessCard'] == null
                    ? ''
                    : mydevices['businessCard']['business_card_name']
                        .toString(),
                mydevices['device_order_id'].toString(),
                deviceURL + mydevices['device_url'].toString(),
                CupertinoSwitch(
                  activeColor: AppColors.primaryColor,
                  value: mydevices['device_is_active'],
                  onChanged: (value) {
                    setState(() {
                      mydevices['device_is_active'] = value;
                      // print(item['device_type_is_active']);
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    // deleteMyDevices(
                    //   mydevices['device_id'].toString(),
                    // );
                    // print(mybeyondLink['business_card_id']);
                    showDialog(
                      context: context,
                      builder: (_) {
                        return BeyondAlertDeleteDialog(
                          title: 'Would you like to delete this device ?',
                          onPressed: () {
                            deleteMyDevices(
                              mydevices['device_id'].toString(),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const ActionIcons(icon: FontAwesomeIcons.solidTrashAlt),
                ),
              );
            }
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(
                //       Text(
                //         item['social_media_platform_id'].toString(),
                //       ),
                //     ),
                //     DataCell(
                //       Container(
                //         height: 100,
                //         width: 120,
                //         child: Image.network(
                //           baseUrl +
                //               item['social_media_platform_card_header']
                //                   .toString(),
                //           fit: BoxFit.fitWidth,
                //         ),
                //       ),
                //     ),
                //     DataCell(
                //       Text(
                //         item['social_media_platform_name'].toString(),
                //       ),
                //     ),
                //     DataCell(
                //       Text(
                //         item['social_media_platform_is_active'].toString() ==
                //                 'true'
                //             ? 'Enable'
                //             : 'Disable',
                //       ),
                //     ),
                //     DataCell(
                //       Text(
                //         item['social_media_platform_base_url'].toString(),
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

  DataRow mydevicesrow(
    String id,
    String devicename,
    String devicetype,
    String beyondlinkname,
    String ordernum,
    String deviceurl,
    CupertinoSwitch status,
    IconButton deleteIcon,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(devicename)),
        DataCell(Text(devicetype)),
        DataCell(Text(beyondlinkname)),
        DataCell(Text(ordernum)),
        DataCell(Text(
          deviceurl,
          style: TextStyle(color: AppColors.primaryColor),
        )),
        DataCell(
          status,
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              deleteIcon,
              const SizedBox(
                width: 15,
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
}
