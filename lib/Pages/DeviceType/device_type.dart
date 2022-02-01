import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/Model/device_type_model.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'create_device_types.dart';
import 'device_type_table.dart';

class DeviceTypesBeyondant extends StatefulWidget {
  const DeviceTypesBeyondant({Key? key}) : super(key: key);

  @override
  _DeviceTypesBeyondantState createState() => _DeviceTypesBeyondantState();
}

class _DeviceTypesBeyondantState extends State<DeviceTypesBeyondant> {
  List<DeviceTypeModel> deviceType = [];
  bool isLoading = false;

  @override
  void initState() {
    getDeviceTypeList();
    super.initState();
  }

  Future getDeviceTypeList() async {
    setState(() {
      isLoading = true;
    });
    deviceType = [];
    final response = await http.get(
      Uri.parse(baseURL + '/device-types/list'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var devicetype in body['deviceTypes']) {
        deviceType.add(
          DeviceTypeModel(
            deviceTypeId: devicetype['device_type_id'].toString(),
            deviceTypeName: devicetype['device_type_name'].toString(),
            deviceTypeSlug: devicetype['device_type_slug'].toString(),
            deviceTypeIsActive: devicetype['device_type_is_active'],
          ),
        );
      }
      isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getDeviceTypeList);
    }

    // print(deviceType.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('Device Types'),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'DEVICE TYPES',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CreateBeyonDeviceTypes(
                            getDeviceTypeTable: () async {
                              await getDeviceTypeList();
                              showToast('Device Created Successfully');
                            },
                          ),
                        ],
                      ),
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : FadeInDown(
                            child: DeviceTypeTable(
                              deviceTypeTable: deviceType,
                              getTableData: () {
                                getDeviceTypeList();
                              },
                              // showToast('Device has been Deleted');
                            ),
                          ),
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
