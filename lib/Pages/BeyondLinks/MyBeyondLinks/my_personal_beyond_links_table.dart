import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Model/beyondLinkModel/my_beyond_link_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPersonalBeyondLinksTable extends StatefulWidget {
  final VoidCallback getTableData;
  final List<MyPersonalBeyondLinkModel> myPersonalBeyondLinksTable;
  const MyPersonalBeyondLinksTable({
    Key? key,
    required this.getTableData,
    required this.myPersonalBeyondLinksTable,
  }) : super(key: key);

  @override
  _MyPersonalBeyondLinksTableState createState() =>
      _MyPersonalBeyondLinksTableState();
}

class _MyPersonalBeyondLinksTableState
    extends State<MyPersonalBeyondLinksTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteMyPersonalBeyondLink(String id) async {
    bool result = await delete.deleteForAll(
      '/business-cards/delete/my-card/$id',
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
              DataColumn(label: const Text('#'), onSort: (columnIndex, _) {}),
              DataColumn(
                  label: const Text('Name'), onSort: (columnIndex, _) {}),
              DataColumn(
                label: const Text('Status'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Action'),
                onSort: (columnIndex, _) {},
              ),
            ],
            rows: widget.myPersonalBeyondLinksTable.map((mybeyondLink) {
              return mypersonalbeyondlinksrow(
                // mybeyondLink['business_card_id'].toString(),
                (widget.myPersonalBeyondLinksTable.indexOf(mybeyondLink) + 1)
                    .toString(),
                mybeyondLink.businessCardName,
                CupertinoSwitch(
                  activeColor: AppColors.primaryColor,
                  value: mybeyondLink.businessCardIsActive,
                  onChanged: (value) {
                    setState(() {
                      mybeyondLink.businessCardIsActive = value;
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
                          title: 'Would you like to delete this beyond link ?',
                          onPressed: () {
                            deleteMyPersonalBeyondLink(
                              mybeyondLink.businessCardId,
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const ActionIcons(icon: FontAwesomeIcons.solidTrashAlt),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  DataRow mypersonalbeyondlinksrow(
    String id,
    String name,
    CupertinoSwitch status,
    IconButton deleteIcon,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(name)),
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
}
