import 'package:flutter/material.dart';

class SocialMedaiTable extends StatefulWidget {
  final socialMediaPlatformTable;
  const SocialMedaiTable(this.socialMediaPlatformTable, {Key? key})
      : super(key: key);

  @override
  State<SocialMedaiTable> createState() => _SocialMedaiTableState();
}

class _SocialMedaiTableState extends State<SocialMedaiTable> {
  List<dynamic> socialMediaPlatform = [];
  final String baseUrl = 'https://api.beyondant.com:3000/';
  String image = '';

  @override
  void initState() {
    socialMediaPlatform = widget.socialMediaPlatformTable;
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
            // source: UserDataTable(trafficData: socialMediaPlatform),
            // sortColumnIndex: _currentSortColumn,
            // sortAscending: _isAscending,
            dataRowHeight: 90,
            // rowsPerPage: 5,
            // header: Center(
            //   child: Text(
            //     'SOCIAL MEDIA PLATFORM',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // onRowsPerPageChanged: (perPage) {},
            // dividerThickness: 1,
            headingRowColor: MaterialStateProperty.all(const Color(0xFF242424)),
            headingTextStyle: const TextStyle(
              color: Colors.white,
            ),
            columns: <DataColumn>[
              DataColumn(label: const Text('#'), onSort: (columnIndex, _) {}),
              DataColumn(
                  label: const Text('Logos'), onSort: (columnIndex, _) {}),
              DataColumn(
                label: const Text('Platform Name'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Status'),
                onSort: (columnIndex, _) {},
              ),
              DataColumn(
                label: const Text('Base URL'),
                onSort: (columnIndex, _) {},
              ),
            ],
            rows: socialMediaPlatform
                .map((item) => socialmediaplatformrow(
                          item['social_media_platform_id'].toString(),
                          baseUrl +
                              item['social_media_platform_card_header']
                                  .toString(),
                          // baseUrl +
                          //     'social-media-platforms/facebook/5149c8c3-6efb-45aa-81e0-1e71ff422c94.png',
                          item['social_media_platform_name'].toString(),
                          item['social_media_platform_is_active'].toString() ==
                                  'true'
                              ? 'Enable'
                              : 'Disable',
                          item['social_media_platform_base_url'].toString(),
                        )

                    //           DataRow(
                    //         cells: <DataCell>[
                    //           DataCell(
                    //             Text(
                    //               item['social_media_platform_id'].toString(),
                    //             ),
                    //           ),
                    //           DataCell(
                    //             Container(
                    //               height: 100,
                    //               width: 120,
                    //               child: Image.network(
                    //                 baseUrl +
                    //                     item['social_media_platform_card_header']
                    //                         .toString(),
                    //                 fit: BoxFit.fitWidth,
                    //               ),
                    //             ),
                    //           ),
                    //           DataCell(
                    //             Text(
                    //               item['social_media_platform_name'].toString(),
                    //             ),
                    //           ),
                    //           DataCell(
                    //             Text(
                    //               item['social_media_platform_is_active'].toString() ==
                    //                       'true'
                    //                   ? 'Enable'
                    //                   : 'Disable',
                    //             ),
                    //           ),
                    //           DataCell(
                    //             Text(
                    //               item['social_media_platform_base_url'].toString(),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    )
                .toList(),
          ),
        ),
      ),
    );
  }

  DataRow socialmediaplatformrow(
      String id, String image, String platform, String status, String baseUrl) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(
          Container(
            height: 100,
            width: 120,
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        DataCell(Text(platform)),
        DataCell(Text(status)),
        DataCell(Text(baseUrl)),
      ],
    );
  }
}

class UserDataTable extends DataTableSource {
  final List<dynamic> _trafficData;
  final String baseUrl = 'https://api.beyondant.com:3000/';

  UserDataTable({
    required List<dynamic> trafficData,
  })  : _trafficData = trafficData,
        assert(trafficData != null);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _trafficData.length) {
      return null!;
    }
    final _traffic = _trafficData[index];
    // print(_traffic['social_media_platform_id']);

    return socialmediaplatformrow(
      index,
      _traffic['social_media_platform_id'].toString(),
      baseUrl + _traffic['social_media_platform_card_header'].toString(),
      // baseUrl +
      //     'social-media-platforms/facebook/5149c8c3-6efb-45aa-81e0-1e71ff422c94.png',
      _traffic['social_media_platform_name'].toString(),
      _traffic['social_media_platform_is_active'].toString() == 'true'
          ? 'Enable'
          : 'Disable',
      _traffic['social_media_platform_base_url'].toString(),
    );

    // DataRow.byIndex(
    //   index: index,
    //   color: MaterialStateColor.resolveWith(
    //     (states) {
    //       if (index % 2 == 0) {
    //         return Colors.grey.shade100;
    //       } else {
    //         return Colors.white;
    //       }
    //     },
    //   ),
    //   cells: <DataCell>[
    //     DataCell(
    //       Text(
    //         _traffic['social_media_platform_id'].toString(),
    //       ),
    //     ),
    //     DataCell(
    //       Container(
    //         height: 100,
    //         width: 120,
    //         child: Image.network(
    //           baseUrl +
    //               _traffic['social_media_platform_card_header'].toString(),
    //           fit: BoxFit.fitWidth,
    //         ),
    //       ),
    //     ),
    //     DataCell(
    //       Text(
    //         _traffic['social_media_platform_name'].toString(),
    //       ),
    //     ),
    //     DataCell(
    //       Text(
    //         _traffic['social_media_platform_is_active'].toString() == 'true'
    //             ? 'Enable'
    //             : 'Disable',
    //       ),
    //     ),
    //     DataCell(
    //       Text(
    //         _traffic['social_media_platform_base_url'].toString(),
    //       ),
    //     ),
    //   ],
    // );
    // )
    // .toList();
    // DataRow(
    //   // index: index,
    //   color: MaterialStateColor.resolveWith((states) {
    //     if (index % 2 == 0) {
    //       return Colors.grey.shade200;
    //     } else {
    //       return Colors.grey.shade100;
    //     }
    //   }),
    //   cells: <DataCell>[
    //     DataCell(Text(_traffic['storeId'].toString())),
    //     DataCell(Text(_traffic['storeName'].toString())),
    //     DataCell(Text(_traffic['date'].toString())),
    //     DataCell(Text(_traffic['hour'].toString())),
    //     DataCell(Text(_traffic['footFall'].toString())),
    //   ],
    // );
  }

  DataRow socialmediaplatformrow(int Index, String id, String image,
      String platform, String status, String baseUrl) {
    return DataRow.byIndex(
      index: Index,
      color: MaterialStateColor.resolveWith(
        (states) {
          if (Index % 2 == 0) {
            return Colors.grey.shade300;
          } else {
            return Colors.grey.shade100;
          }
        },
      ),
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(
          Container(
            height: 100,
            width: 120,
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        DataCell(Text(platform)),
        DataCell(Text(status)),
        DataCell(Text(baseUrl)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _trafficData.length;

  @override
  int get selectedRowCount => 0;
}
