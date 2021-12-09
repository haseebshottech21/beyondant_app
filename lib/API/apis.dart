import 'dart:async';
import 'dart:convert';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/CreateDevice/create_new_device.dart';
import 'package:beyondant_new_app/Pages/UserManagment/create_new_user_management.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/user_already_exsit_dialogbox.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeyondantAPI {
  Future<bool> createMyBeyondLink(
      String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
      body: data,
    );

    // print(response.statusCode);
    if (response.statusCode == 201) {
      // var body = jsonDecode(response.body);
      // showToast(
      //   'Beyond Link Created',
      // );
      Navigator.pop(context);
      return true;
    } else {
      showToast(
        'Failed To Creted Beyond Link',
      );
      return false;
    }
  }

  Future createAllBeyondLink(String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
      body: data,
    );

    // print(response.statusCode);
    if (response.statusCode == 201) {
      // var body = jsonDecode(response.body);
      Navigator.pop(context);
    } else {
      showToast(
        'Failed To Creted Beyond Link',
      );
    }
  }

  Future createDeviceTypes(String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
      body: data,
    );

    // print(response.statusCode);
    if (response.statusCode == 201) {
      // var body = jsonDecode(response.body);
      Navigator.pop(context);
    } else {
      showToast(
        'Device Failed !!',
      );
    }
  }

  Future createNewDevice(String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
      body: data,
    );

    print(response.statusCode);
    if (response.statusCode == 201) {
      // var body = jsonDecode(response.body);
      // Fluttertoast.showToast(
      //   msg: 'Device Created',
      // );
      showDialog(
        context: context,
        builder: (ctxt) => const AlertDialog(
          title: Text("Device Created"),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateNewDevice(),
        ),
      );
    } else {
      // Fluttertoast.showToast(
      //   msg: 'Device Not Created !!',
      //   fontSize: 18,
      // );
    }
  }

  Future createNewUser(String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
      body: data,
    );

    // print(response.statusCode);
    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'New User Created Successfuly',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      );
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateNewUserManagement(),
          ),
        ),
      );
    } else if (response.statusCode == 400) {
      var body = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (_) {
          return UserAlreadyExistDialog(
            username: body['message'][0]
                .toString()
                .replaceAll('user_', '')
                .replaceAll(':', ':\n'),
            // useremail: body['message'][1]
            //     .toString()
            //     .replaceAll('user_', '')
            //     .replaceAll(':', ':\n')
            //     .replaceAll('already', '\nalready'),
          );
        },
      );
    } else {
      print(response.statusCode);
      showToast(
        'User Create Failed',
      );
    }
  }
}
