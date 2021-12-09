import 'package:beyondant_new_app/Model/contactModel/all_contact_model.dart';
import 'package:flutter/material.dart';

class AllContactsTable extends StatefulWidget {
  final List<AllContactModel> allContactTable;
  const AllContactsTable({
    required this.allContactTable,
    Key? key,
  }) : super(key: key);

  @override
  _AllContactsTableState createState() => _AllContactsTableState();
}

class _AllContactsTableState extends State<AllContactsTable> {
  List<dynamic> allContacts = [];

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
        source: UserDataTable(allContactModel: widget.allContactTable),
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
            label: const Text('Contact Meeting Location'),
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
            label: const Text('User First Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('User Last Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('User User Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Profile Picture'),
            onSort: (columnIndex, _) {},
          ),
        ],
      ),
    );
  }
}

class UserDataTable extends DataTableSource {
  // final List<dynamic> _allContacts;
  // final String baseUrl = 'https://api.beyondant.com:3000/';
  // // final String adminbaseUrl = 'https://api.beyondant.com:3000/';
  // // final isSwitch = {'business_card_is_active': true};

  // UserDataTable({
  //   required List<dynamic> allContacts,
  // })  : _allContacts = allContacts,
  //       assert(allContacts != null);

  List<AllContactModel> allContactModel;

  UserDataTable({
    required this.allContactModel,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= allContactModel.length) {
      return null!;
    }
    final allcontacts = allContactModel[index];

    return allcontactsrow(
      index,
      (allContactModel.indexOf(allcontacts) + 1).toString(),
      // allcontacts.contactId,
      allcontacts.contacDate,
      allcontacts.contactMeetingLocation,
      allcontacts.contactFirstName,
      allcontacts.contactLastName,
      allcontacts.contactPhoneNumber,
      allcontacts.contactEmail,
      allcontacts.userFirstName,
      allcontacts.userLastName,
      allcontacts.userUsername,
      allcontacts.userProfilePic,
    );
  }

  DataRow allcontactsrow(
    int index,
    String id,
    String contactDate,
    String contlocation,
    String contfirstname,
    String contlasttname,
    String contphone,
    String contemail,
    String userfirstname,
    String userlastname,
    String userusername,
    String profilepicture,
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
        DataCell(Text(contactDate)),
        DataCell(Text(contlocation)),
        DataCell(Text(contfirstname)),
        DataCell(Text(contlasttname)),
        DataCell(Text(contphone)),
        DataCell(Text(contemail)),
        DataCell(Text(userfirstname)),
        DataCell(Text(userlastname)),
        DataCell(Text(userusername)),
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allContactModel.length;

  @override
  int get selectedRowCount => 0;
}
