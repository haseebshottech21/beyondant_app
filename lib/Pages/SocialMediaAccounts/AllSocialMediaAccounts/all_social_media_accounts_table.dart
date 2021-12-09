import 'package:beyondant_new_app/Model/socialMediaAccountModel/all_social_media_account_model.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSocailMediaAccountsTable extends StatefulWidget {
  final List<AllSocailMediaAccountModel> allSocailMediaAccountsTable;
  const AllSocailMediaAccountsTable({
    required this.allSocailMediaAccountsTable,
    Key? key,
  }) : super(key: key);

  @override
  _AllSocailMediaAccountsTableState createState() =>
      _AllSocailMediaAccountsTableState();
}

class _AllSocailMediaAccountsTableState
    extends State<AllSocailMediaAccountsTable> {
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
          allSocialMediaAccount: widget.allSocailMediaAccountsTable,
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
            label: const Text('First Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Last Name'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('UserName'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Profile Picture'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('UserName / Email ID'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Platform'),
            onSort: (columnIndex, _) {},
          ),
          DataColumn(
            label: const Text('Status'),
            onSort: (columnIndex, _) {},
          ),
        ],
      ),
    );
  }
}

class UserDataTable extends DataTableSource {
  final List<AllSocailMediaAccountModel> allSocialMediaAccount;
  // final String baseUrl = 'https://api.beyondant.com:3000/';
  // final String adminbaseUrl = 'https://api.beyondant.com:3000/';
  // final isSwitch = {'business_card_is_active': true};

  UserDataTable({
    required this.allSocialMediaAccount,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= allSocialMediaAccount.length) {
      return null!;
    }
    final allsocialmedia = allSocialMediaAccount[index];
    // print(_traffic['social_media_platform_id']);

    return allsocialmediaaccountsrow(
      index,
      // allbeyondlinkid(),
      // allsocialmedia['social_media_account_id'] = (index + 1).toString(),
      (allSocialMediaAccount.indexOf(allsocialmedia) + 1).toString(),
      // allsocialmedia.socialMediaId,
      allsocialmedia.userFirstName,
      allsocialmedia.userLastName,
      allsocialmedia.userUsername,
      allsocialmedia.userProfilePic,
      allsocialmedia.socialMediaName,
      allsocialmedia.socialMediaPlatformName,
      CupertinoSwitch(
        activeColor: AppColors.primaryColor,
        value: allsocialmedia.socialMediaIsActive,
        onChanged: (value) {
          // setState(() {
          allsocialmedia.socialMediaIsActive = value;
          // print(item['device_type_is_active']);
          // });
        },
      ),
    );
  }

  DataRow allsocialmediaaccountsrow(
    int index,
    String id,
    String firstname,
    String lasttname,
    String username,
    String profilepicture,
    String userplatformlink,
    String platform,
    CupertinoSwitch status,
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
        DataCell(Text(firstname)),
        DataCell(Text(lasttname)),
        DataCell(Text(username)),
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
        DataCell(Text(userplatformlink)),
        DataCell(Text(platform)),
        DataCell(
          status,
        ),
      ],
    );
  }

  // DataRow socialmediaplatformrow(int Index, String id, String image,
  //     String platform, String status, String baseUrl) {
  //   return DataRow.byIndex(
  //     index: Index,
  //     color: MaterialStateColor.resolveWith(
  //       (states) {
  //         if (Index % 2 == 0) {
  //           return Colors.grey.shade300;
  //         } else {
  //           return Colors.grey.shade100;
  //         }
  //       },
  //     ),
  //     cells: <DataCell>[
  //       DataCell(Text(id)),
  //       DataCell(
  //         Container(
  //           height: 100,
  //           width: 120,
  //           child: Image.network(
  //             image,
  //             fit: BoxFit.fitWidth,
  //           ),
  //         ),
  //       ),
  //       DataCell(Text(platform)),
  //       DataCell(Text(status)),
  //       DataCell(Text(baseUrl)),
  //     ],
  //   );
  // }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allSocialMediaAccount.length;

  @override
  int get selectedRowCount => 0;
}
