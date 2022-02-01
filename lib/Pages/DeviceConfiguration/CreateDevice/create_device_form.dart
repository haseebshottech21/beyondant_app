import 'dart:convert';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Model/device_type_dialog_dropdown.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'createdevice_widgets/beyond_business_cards.dart';
import 'createdevice_widgets/create_device_dropdown.dart';
import 'createdevice_widgets/create_device_filed.dart';
import 'package:http/http.dart' as http;

class CreateDeviceForm extends StatefulWidget {
  const CreateDeviceForm({Key? key}) : super(key: key);

  @override
  _CreateDeviceFormState createState() => _CreateDeviceFormState();
}

class _CreateDeviceFormState extends State<CreateDeviceForm> {
  List<dynamic> createDeviceUsers = [];
  List<dynamic> createDeviceTypes = [];
  List<dynamic> getUserBuisnessCardName = [];
  int getBusinessCardId = 0;
  final List<DropDownDeviceType> _deviceTypes = [];

  TextEditingController deviceName = TextEditingController();
  TextEditingController orderNumber = TextEditingController();
  TextEditingController deviceURL = TextEditingController();
  int selectItem = -1;

  // List item = ['1', '2'];

  String cardBoxValue = 'Beyond Link Card';
  String selectedUser = '';
  String getDeviceTypeId = '';

  BeyondantAPI createApi = BeyondantAPI();

  @override
  void initState() {
    getCreateDeviceUsersDropDown();
    getDeviceTypeDropDown();
    super.initState();
  }

  void createAllPersonalBeyondLink() async {
    var formData = {
      'device_name': deviceName.text,
      'device_active_card_id': getBusinessCardId.toString(),
      'device_device_type_id': getDeviceTypeId,
      'device_overridden_link': deviceURL.text,
      'device_order_id': orderNumber.text,
    };

    if (deviceName.text.isEmpty ||
        getDeviceTypeId == '' ||
        orderNumber.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Input field cannot be empty',
      );
    } else if (getBusinessCardId == 0) {
      Fluttertoast.showToast(
        msg: 'Select Your Beyond Link',
      );
    } else {
      // deviceURL.text == 'https://';
      await createApi.createNewDevice(
        '/devices/create/beyondantadmi',
        formData,
        context,
      );
    }
  }

  Future getUser() async {
    final response = await http.get(
      Uri.parse(baseURL + '/devices/create/$selectedUser'),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // isLoading = false;
      setState(() {
        getUserBuisnessCardName = body['businessCards'];
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getUser);
    }
  }

  Future getCreateDeviceUsersDropDown() async {
    final response = await http.get(
      Uri.parse(
        baseURL + '/user/for-selection?page=1&items=18446744073709551615',
      ),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // isLoading = false;
      setState(() {
        createDeviceUsers = body['users']['rows'];
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getUser);
    }
  }

  Future getDeviceTypeDropDown() async {
    _deviceTypes.clear();

    final response = await http.get(
      Uri.parse(baseURL + '/device-types/list'),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // print(body['deviceTypes']);
      for (var devices in body['deviceTypes']) {
        _deviceTypes.add(
          DropDownDeviceType(
            id: devices['device_type_id'].toString(),
            deviceName: devices['device_type_name'].toString(),
          ),
        );
      }
      // print(_deviceTypes);
      // setState(() {
      //   // createDeviceTypes = body['deviceTypes'];
      //   // print(createDeviceTypes);
      // });
      // print(createDeviceTypes[0]['device_type_id']);
    }
  }

  // void getDropDownItem() {
  //   setState(() {
  //     print(cardBoxValue);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return createDeviceUsers.isEmpty || _deviceTypes.isEmpty
        ? circularProgress()
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '* Select User For Device',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SearchDropDownField(
                  // context,
                  hintText: 'Select User',
                  mode: Mode.BOTTOM_SHEET,
                  dropdownItems: createDeviceUsers.map(
                    (users) {
                      // print(users['user_username'].length);
                      return users['user_username'].toString();
                    },
                  ).toList(),
                  onChanged: (val) {
                    // getDropDownItem();
                    // widget.getValue;
                    setState(
                      () {
                        selectedUser = val.toString();
                        cardBoxValue = selectedUser;
                        getUser();
                      },
                    );
                    // print(val);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '* Device Name',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CreateDeviceField(
                  controller: deviceName,
                  hintText: 'Device Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '* Order Number',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CreateDeviceField(
                  controller: orderNumber,
                  hintText: 'Order Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '* Device Type',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SearchDropDownField(
                  // context,
                  hintText: 'Select Device Type',
                  mode: Mode.BOTTOM_SHEET,
                  // maxHeight: null,
                  dropdownItems: _deviceTypes.map(
                    (devices) {
                      // print(devices);
                      return devices.deviceName;
                    },
                  ).toList(),
                  onChanged: (val) {
                    // selectDevice = val.toString();
                    setState(() {
                      getDeviceTypeId = _deviceTypes
                          .firstWhere((element) => element.deviceName == val)
                          .id;
                    });

                    // print(selectDevice);

                    // print((val as DropDownDeviceType).id);

                    // getDropDownItem();
                    // widget.getValue;
                    // int index;
                    // for (index = 0; index < createDeviceTypes.length; index++) {
                    //   // print(index);
                    // }
                    // setState(
                    //   () {
                    //     int index = 1;
                    //     selectDevice = val.toString();
                    //     getDeviceTypeId =
                    //         createDeviceTypes[index]['device_type_id'];
                    //     // print(getDeviceTypeId);
                    //   },
                    // );
                    // Text(list[index]);

                    // print(val);
                  },
                ),
                // searchDropdownField(
                //   context,
                //   'Select Device Type',
                //   createDeviceTypes.map(
                //     (devices) {
                //       return devices['device_type_name'].toString();
                //     },
                //   ).toList(),
                // ),
                // Center(
                //   child: Container(
                //     height: MediaQuery.of(context).size.height * 0.30,
                //     width: MediaQuery.of(context).size.width * 0.50,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Stack(
                //       children: [
                //         SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.15,
                //           child: Image.network(
                //             'https://app.beyondant.com/static/media/cardbg.173ce649.jpg',
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //         Center(
                //           child: Container(
                //             height: MediaQuery.of(context).size.height * 0.08,
                //             width: MediaQuery.of(context).size.width * 0.15,
                //             decoration: const BoxDecoration(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(12.0),
                //                 bottomRight: Radius.circular(12.0),
                //               ),
                //               image: DecorationImage(
                //                 image: NetworkImage(
                //                   'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
                //                 ),
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //           ),
                //         ),
                //         const Padding(
                //           padding: EdgeInsets.only(bottom: 30),
                //           child: Align(
                //             alignment: Alignment.bottomCenter,
                //             child: Text('My Data'),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // child: Align(
                //   alignment: Alignment.topCenter,
                //   child: Image.network(
                //     'https://app.beyondant.com/static/media/cardbg.173ce649.jpg',
                //     height: 100,
                //   ),
                // ),
                const SizedBox(
                  height: 35,
                ),
                const Center(
                  child: Text(
                    'Redirect Your Beyondant Device To The URL Below:',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CreateDeviceField(
                  controller: deviceURL,
                  hintText: 'Enter redirect link url',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidAddressBook,
                        color: AppColors.primaryColor,
                        size: 45.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Select Your Beyond Link',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Select Your Beyond Link',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                getUserBuisnessCardName.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            'Select Your Beyond Link',
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: getUserBuisnessCardName.length,
                          itemBuilder: (context, index) {
                            return getBusinessCards(
                              index,
                              getUserBuisnessCardName[index]
                                  ['business_card_name'],
                              selectItem,
                              () {
                                setState(() {
                                  selectItem = index;
                                  getBusinessCardId =
                                      getUserBuisnessCardName[selectItem]
                                          ['business_card_id'];
                                  // print(getBusinessCardId);
                                });
                              },
                              context,
                            );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      shadowColor: Colors.transparent,
                      primary: AppColors.primaryColor,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.height * 0.050,
                      ),
                    ),
                    onPressed: () {
                      createAllPersonalBeyondLink();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          // fontSize: 10.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget getBusinessCard(String text, int value, Function(int?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.17,
                child: Image.network(
                  'https://app.beyondant.com/static/media/cardbg.173ce649.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
