// import 'dart:convert';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'create_device_form.dart';
// import 'createdevice_widgets/create_device_filed.dart';
// import 'package:http/http.dart' as http;

class CreateNewDevice extends StatefulWidget {
  const CreateNewDevice({Key? key}) : super(key: key);

  @override
  _CreateNewDeviceState createState() => _CreateNewDeviceState();
}

class _CreateNewDeviceState extends State<CreateNewDevice> {
  // TextEditingController deviceName = TextEditingController();
  // TextEditingController orderNumber = TextEditingController();
  // TextEditingController deviceURL = TextEditingController();
  // void createAllPersonalBeyondLink() async {
  //   var formData = {
  //     'device_name': deviceName.text,
  //     'device_active_card_id': '1',
  //     'device_device_type_id': '1',
  //     'device_overridden_link': deviceURL.text,
  //     'device_order_id': orderNumber.text,
  //   };
  //   if (deviceName.text.isNotEmpty || orderNumber.text.isNotEmpty) {
  //     if (deviceURL.text.isNotEmpty ||
  //         deviceURL.text != 'https://beyondant.com/') {
  //       showDialog(
  //         context: context,
  //         builder: (ctxt) => const AlertDialog(
  //           title: Text("Device URL must be:  https://beyondant.com/"),
  //         ),
  //       );
  //     }
  //     deviceURL.text.isEmpty == 'https://beyondant.com/';
  //     await createApi.createNewDevice(
  //       '/devices/create/beyondantadmi',
  //       formData,
  //       context,
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Input field cannot be empty',
  //     );
  //   }
  // }

  // List<dynamic> createDeviceUsers = [];
  // String selectedUser = '';
  // var beyondBaseUrl = 'https://api.beyondant.com:3000';

  // @override
  // void initState() {
  //   getCreateDeviceUsersDropDown();
  //   super.initState();
  // }

  // Future getCreateDeviceUsersDropDown() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   // final accessToken = _prefs.getString('token');
  //   final refreshToken = _prefs.getString('refresh_token');
  //   final userUsername = _prefs.getString('username');
  //   // print(userUsername);

  //   final response = await http.get(
  //     Uri.parse(beyondBaseUrl +
  //         '/user/for-selection?userUsername=$userUsername&page=1&items=18446744073709551615'),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer $refreshToken',
  //       // HttpHeaders.authorizationHeader: 'Basic $data',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var body = jsonDecode(response.body);
  //     setState(() {
  //       createDeviceUsers = body['users']['rows'];
  //     });
  //     print(createDeviceUsers);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('Create Devices'),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 20.0),
                    //   child: Text(
                    //     'CREATE DEVICES',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 16.0,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.tv,
                            color: AppColors.primaryColor,
                            size: 55.0,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Create Device',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Submit form to create device',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CreateDeviceForm(),
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    // const Center(
                    //   child: Text(
                    //     'Redirect Your Beyondant Device To The URL Below:',
                    //     style: TextStyle(
                    //       fontSize: 13.0,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // CreateDeviceField(
                    //   hintText: 'Enter redirect link url',
                    // ),
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    // const Center(
                    //   child: Text('OR'),
                    // ),
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       FaIcon(
                    //         FontAwesomeIcons.solidAddressBook,
                    //         color: AppColors.primaryColor,
                    //         size: 45.0,
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: const [
                    //           Text(
                    //             'Select Your Beyond Link',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             'Select Your Beyond Link',
                    //             style: TextStyle(
                    //               fontSize: 14.0,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    // const SizedBox(
                    //   height: 80,
                    //   child: Card(
                    //     child: Center(
                    //       child: Text(
                    //         'Beyond Link Name',
                    //         style: TextStyle(
                    //           fontSize: 20.0,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       shape: const StadiumBorder(),
                    //       shadowColor: Colors.transparent,
                    //       primary: AppColors.primaryColor,
                    //       minimumSize: Size(
                    //         MediaQuery.of(context).size.width * 0.25,
                    //         MediaQuery.of(context).size.height * 0.050,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       createAllPersonalBeyondLink();
                    //       // Navigator.pushReplacement(
                    //       //   context,
                    //       //   MaterialPageRoute(
                    //       //     builder: (context) => const CreateNewDevice(),
                    //       //   ),
                    //       // );
                    //       showDialog(
                    //         context: context,
                    //         builder: (ctxt) => const AlertDialog(
                    //           title: Text("Text Dialog"),
                    //         ),
                    //       );
                    //       // setState(() {
                    //       //   // cardBoxValue = selectedUser;
                    //       //   // print(selectedUser);
                    //       // });
                    //     },
                    //     child: const Padding(
                    //       padding: EdgeInsets.only(
                    //         top: 5,
                    //         bottom: 5,
                    //       ),
                    //       child: Text(
                    //         'SUBMIT',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w500,
                    //           // fontSize: 10.0,
                    //           letterSpacing: 0.5,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
