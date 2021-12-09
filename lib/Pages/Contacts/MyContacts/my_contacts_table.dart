import 'package:beyondant_new_app/API/delete.dart';
import 'package:beyondant_new_app/Model/contactModel/my_contact_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_action_icons.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_delete_dialog.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_view_dialog.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyContactsTable extends StatefulWidget {
  final VoidCallback getMyContact;
  final List<MyContactModel> myContactTable;
  const MyContactsTable({
    required this.getMyContact,
    required this.myContactTable,
    Key? key,
  }) : super(key: key);

  @override
  _MyContactsTableState createState() => _MyContactsTableState();
}

class _MyContactsTableState extends State<MyContactsTable> {
  BeyondantDeleteAPI delete = BeyondantDeleteAPI();

  Future<void> deleteMyContact(String contactId) async {
    // print('in');
    bool result = await delete.deleteForAll(
      '/contact/delete/my-contact/$contactId',
    );
    if (result) {
      Navigator.pop(context);
      widget.getMyContact();
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
          myContacts: widget.myContactTable,
          onDeleteAllBeyond: deleteMyContact,
        ),
        // sortColumnIndex: _currentSortColumn,
        // sortAscending: _isAscending,
        dataRowHeight: 90,
        // columnSpacing: 70,
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
            label: const Text('Date'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Contact First Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Contact Last Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Contact Phone Number'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Contact Email'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Contact Meeting Location'),
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
  List<MyContactModel> myContacts;
  Function onDeleteAllBeyond;
  BuildContext context;

  UserDataTable({
    required this.onDeleteAllBeyond,
    required this.context,
    required this.myContacts,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= myContacts.length) {
      return null!;
    }
    final mycontactsModel = myContacts[index];

    return mycontactsrow(
      index,
      (myContacts.indexOf(mycontactsModel) + 1).toString(),
      // mycontactsModel.contactId,
      mycontactsModel.contactDate,
      mycontactsModel.contactFirstName,
      mycontactsModel.contactLastName,
      mycontactsModel.contactPhoneNumber,
      mycontactsModel.contactEmail,
      mycontactsModel.contactMeetingLocation,
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BeyondAlertDeleteDialog(
                title: 'Would you like to delete this Contact ?',
                onPressed: () {
                  onDeleteAllBeyond(
                    mycontactsModel.contactId,
                  );
                  // print(allbeyondLinkModel.businessCardId);
                },
              );
            },
          );
          // deleteAllBeyondLink()
        },
        icon: const ActionIcons(icon: FontAwesomeIcons.solidTrashAlt),
      ),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BeyondAlertViewDialog(
                title: 'Personal Detail',
                firstName: mycontactsModel.contactFirstName,
                lastName: mycontactsModel.contactLastName,
                email: mycontactsModel.contactEmail,
                contNumber: mycontactsModel.contactPhoneNumber,
                meetingLoc: mycontactsModel.contactMeetingLocation,
              );
            },
          );
        },
        icon: const ActionIcons(icon: FontAwesomeIcons.solidEye),
      ),
    );
  }

  DataRow mycontactsrow(
    int index,
    String id,
    String contdate,
    String contfirstname,
    String contlasttname,
    String contphone,
    String contemail,
    String contlocation,
    IconButton delteIcon,
    IconButton viewIcon,
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
        DataCell(Text(id)),
        DataCell(Text(contdate)),
        DataCell(Text(contfirstname)),
        DataCell(Text(contlasttname)),
        DataCell(Text(contphone)),
        DataCell(Text(contemail)),
        DataCell(Text(contlocation)),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              viewIcon,
              const SizedBox(
                width: 10,
              ),
              delteIcon
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => myContacts.length;

  @override
  int get selectedRowCount => 0;
}
