import 'dart:convert';

import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BeyondantDeleteAPI {
  // var apiBaseUrl = 'https://api.beyondant.com:3000';

  // void showToast(String message) => Fluttertoast.showToast(
  //       msg: message,
  //       fontSize: 18,
  //     );

  Future<bool> deleteForAll(String middleUrl) async {
    final response = await http.delete(
      Uri.parse(baseURL + middleUrl),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );
    final responseData = jsonDecode(response.body);
    print(responseData);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  // Future deleteMyBeyondLink(String url, BuildContext context) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   // final accessToken = _prefs.getString('token');
  //   final refreshToken = _prefs.getString('refresh_token');

  //   final response = await http.delete(
  //     Uri.parse(baseURL + url),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer $refreshToken',
  //       // HttpHeaders.authorizationHeader: 'Basic $data',
  //     },
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // var body = jsonDecode(response.body);
  //     Fluttertoast.showToast(
  //       msg: 'Beyond Link Deleted',
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Failed To Delete',
  //       fontSize: 18,
  //     );
  //   }
  // }

  // Future deleteAllBeyondLink(String url, BuildContext context) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   // final accessToken = _prefs.getString('token');
  //   final refreshToken = _prefs.getString('refresh_token');

  //   final response = await http.delete(
  //     Uri.parse(baseURL + url),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer $refreshToken',
  //       // HttpHeaders.authorizationHeader: 'Basic $data',
  //     },
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // var body = jsonDecode(response.body);
  //     Fluttertoast.showToast(
  //       msg: 'Beyond Link Deleted',
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Failed To Delete',
  //       fontSize: 18,
  //     );
  //   }
  // }

  // Future deleteMyDevice(String url, BuildContext context) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   // final accessToken = _prefs.getString('token');
  //   final refreshToken = _prefs.getString('refresh_token');

  //   final response = await http.delete(
  //     Uri.parse(baseURL + url),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer $refreshToken',
  //       // HttpHeaders.authorizationHeader: 'Basic $data',
  //     },
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // var body = jsonDecode(response.body);
  //     Fluttertoast.showToast(
  //       msg: 'My Devices Deleted',
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Failed To Delete',
  //       fontSize: 18,
  //     );
  //   }
  // }
}
