import 'dart:convert';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/MyDevices/my_device_table.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDevice extends StatefulWidget {
  const MyDevice({Key? key}) : super(key: key);

  @override
  _MyDeviceState createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice> {
  List<dynamic> myDevicesList = [];
  bool isLoading = false;

  @override
  void initState() {
    getMyDevices();
    super.initState();
  }

  Future getMyDevices() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
      Uri.parse('https://api.beyondant.com:3000/devices/list/my-devices'),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['deviceTypes'][0]['device_type_name']);

    if (response.statusCode == 200) {
      isLoading = false;
      setState(() {
        myDevicesList = body['devices'];
        // print(myDevices);
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getMyDevices);
    }

    // print(myDevices.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('My Devices'),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                          horizontal: 10.0, vertical: 20.0),
                      child: Text(
                        'MY DEVICES',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : MyDeviceTable(
                            myDevicesTable: myDevicesList,
                            getTableData: () async {
                              await getMyDevices();
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
