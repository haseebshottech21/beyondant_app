import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Model/beyondLinkModel/all_beyond_link_model.dart';
import 'package:beyondant_new_app/Pages/BeyondLinks/AllBeyondLinks/edit_all_beyond_links.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllBeyondLinksTable extends StatefulWidget {
  final VoidCallback getTableData;
  final List<AllBeyondLinkModel> allBeyondLinksTable;

  const AllBeyondLinksTable({
    Key? key,
    required this.getTableData,
    required this.allBeyondLinksTable,
  }) : super(key: key);

  @override
  _AllBeyondLinksTableState createState() => _AllBeyondLinksTableState();
}

class _AllBeyondLinksTableState extends State<AllBeyondLinksTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteAllBeyondLink(String beyondLinkId) async {
    bool result = await delete.deleteForAll(
      '/business-cards/delete/other-card/$beyondLinkId',
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
          context: context,
          allbeyondLinks: widget.allBeyondLinksTable,
          onDeleteAllBeyond: deleteAllBeyondLink,
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
            label: const Text('First Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Business Card Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Last Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('User Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Status'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Profile Picture'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Action'),
            onSort: (columnIndex, _) {},
          ),
        ],
      ),
    );
  }
}

class UserDataTable extends DataTableSource {
  List<AllBeyondLinkModel> allbeyondLinks;
  Function onDeleteAllBeyond;
  BuildContext context;

  UserDataTable({
    required this.onDeleteAllBeyond,
    required this.context,
    required this.allbeyondLinks,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= allbeyondLinks.length) {
      return null!;
    }
    final allbeyondLinkModel = allbeyondLinks[index];
    // print(index + 1);
    // print(_traffic['social_media_platform_id']);

    return allbeyondlinksrow(
      index,
      (allbeyondLinks.indexOf(allbeyondLinkModel) + 1).toString(),
      // allbeyondLinkModel.businessCardId,
      allbeyondLinkModel.userFirstName,
      allbeyondLinkModel.businessCardName,
      allbeyondLinkModel.userLastName,
      allbeyondLinkModel.userUsername,
      CupertinoSwitch(
        activeColor: AppColors.primaryColor,
        value: allbeyondLinkModel.businessCardIsActive,
        onChanged: (value) {
          // setState(() {
          allbeyondLinkModel.businessCardIsActive = value;
          //   // print(item['device_type_is_active']);
          // });
        },
      ),
      allbeyondLinkModel.userProfilePic,
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BeyondAlertDeleteDialog(
                title: 'Would you like to delete this beyond link ?',
                onPressed: () {
                  onDeleteAllBeyond(
                    allbeyondLinkModel.businessCardId,
                  );
                  // print(allbeyondLinkModel.businessCardId);
                },
              );
            },
          );
        },
        icon: const ActionIcons(icon: FontAwesomeIcons.solidTrashAlt),
      ),
      IconButton(
        onPressed: () {
          // print('click');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditAllBeyondLinks(
                userId: allbeyondLinkModel.businessCardId,
                userName: allbeyondLinkModel.userUsername,
              ),
            ),
          );
        },
        icon: const ActionIcons(icon: FontAwesomeIcons.userEdit),
      ),
    );
  }

  DataRow allbeyondlinksrow(
    int index,
    String id,
    String firstname,
    String buisinesscardname,
    String lastname,
    String username,
    CupertinoSwitch status,
    String profilepicture,
    IconButton deleteIcon,
    IconButton editIcon,
  ) {
    // print(allBeyondLinkModel.userProfilePic);
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
        DataCell(Text(firstname)),
        DataCell(Text(buisinesscardname)),
        DataCell(Text(lastname)),
        DataCell(Text(username)),
        DataCell(status),
        DataCell(
          Container(
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
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              editIcon,
              const SizedBox(
                width: 12,
              ),
              deleteIcon,
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allbeyondLinks.length;

  @override
  int get selectedRowCount => 0;
}
