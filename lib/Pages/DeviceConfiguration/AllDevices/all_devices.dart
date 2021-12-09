import 'dart:convert';
import 'package:beyondant_new_app/Model/deviceConfigurationModel/all_device_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/AllDevices/all_devices_table.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllDevices extends StatefulWidget {
  const AllDevices({Key? key}) : super(key: key);

  @override
  _AllDevicesState createState() => _AllDevicesState();
}

class _AllDevicesState extends State<AllDevices> {
  TextEditingController searchController = TextEditingController();
  List<AllDeviceModel> allDevicesList = [];
  List<AllDeviceModel> allDevicesListFilter = [];

  bool isLoading = false;

  @override
  void initState() {
    getAllDevices();
    super.initState();
  }

  Future getAllDevices() async {
    searchController.text = '';
    allDevicesListFilter.clear();
    setState(() {
      isLoading = true;
    });
    allDevicesList = [];
    final response = await http.get(
      Uri.parse(baseURL + '/devices/list/other-devices'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['businessCards']);

    if (response.statusCode == 200) {
      isLoading = false;
      setState(() {
        for (var alldevice in body['devices']) {
          allDevicesList.add(
            AllDeviceModel(
              deviceId: alldevice['device_id'].toString(),
              deviceUserId: alldevice['device_user_id'].toString(),
              deviceName: alldevice['device_name'].toString(),
              deviceURL: alldevice['device_url'].toString(),
              deviceOrderId: alldevice['device_order_id'].toString(),
              deviceIsActive: alldevice['device_is_active'],
              deviceTypeName:
                  alldevice['deviceType']['device_type_name'].toString(),
              businessCardName: alldevice['businessCard'] == null
                  ? ''
                  : alldevice['businessCard']['business_card_name'].toString(),
              userFirstName: alldevice['user']['user_first_name'].toString(),
              userLastName: alldevice['user']['user_last_name'].toString(),
              userUsername: alldevice['user']['user_username'].toString(),
              userProfilePic:
                  alldevice['user']['user_profile_picture'].toString(),
            ),
          );
        }
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getAllDevices);
    }
  }

  void searchTable(String val) {
    allDevicesListFilter = [];
    for (var item in allDevicesList) {
      if (item.deviceName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userUsername.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.deviceTypeName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.businessCardName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.userFirstName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userLastName.toLowerCase().contains(val.toLowerCase().trim())) {
        allDevicesListFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('All Devices'),
      body: Stack(
        children: [
          tableBackground(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Text(
                        'ALL DEVICES',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: BeyondAnimatedTableSearchBar(
                        searchController: searchController,
                        onChanged: (value) {
                          searchTable(value);
                        },
                        getTable: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : AllDevicesTable(
                            allDevicesTable: allDevicesListFilter.isEmpty
                                ? allDevicesList
                                : allDevicesListFilter,
                            getTableData: () async {
                              await getAllDevices();
                              showToast('Device has been Deleted');
                            },
                          ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
