import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySocailMediaAccountsTable extends StatefulWidget {
  final mySocailMediaAccountsTable;

  const MySocailMediaAccountsTable(this.mySocailMediaAccountsTable, {Key? key})
      : super(key: key);

  @override
  _MySocailMediaAccountsTableState createState() =>
      _MySocailMediaAccountsTableState();
}

class _MySocailMediaAccountsTableState
    extends State<MySocailMediaAccountsTable> {
  List<dynamic> mySocailMediaAccounts = [];
  final String baseUrl = 'https://api.beyondant.com:3000/';
  // String image = '';

  @override
  void initState() {
    mySocailMediaAccounts = widget.mySocailMediaAccountsTable;
    // setState(() {
    //   image = baseUrl + socialMediaPlatform[0]['social_media_platform_image'];
    // });
    super.initState();
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
                label: const Text('User Name / Email ID'),
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
            rows: mySocailMediaAccounts
                .map(
                  (mySocialMedia) => mysocialmediaaccountsrow(
                    mySocialMedia['social_media_account_user_id'].toString(),
                    mySocialMedia['social_media_account_name'].toString(),
                    mySocialMedia['socialMediaPlatform']
                            ['social_media_platform_name']
                        .toString(),
                    CupertinoSwitch(
                      activeColor: AppColors.primaryColor,
                      value: mySocialMedia['social_media_account_is_active'],
                      onChanged: (value) {
                        setState(() {
                          mySocialMedia['social_media_account_is_active'] =
                              value;
                          // print(item['device_type_is_active']);
                        });
                      },
                    ),
                  ),

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
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  DataRow mysocialmediaaccountsrow(
    String id,
    String username,
    String platform,
    CupertinoSwitch status,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(username)),
        DataCell(Text(platform)),
        DataCell(
          status,
        ),
        // DataCell(
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       TableIcons(icon: Icons.delete),
        //       const SizedBox(
        //         width: 20,
        //       ),
        //       TableIcons(icon: Icons.edit),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
