import 'dart:convert';
import 'package:beyondant_new_app/Pages/Dashboard/dashboard.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  var baseUrl = 'https://api.beyondant.com:3000/user/authentication';

  Future loginBeyondant(String url, Map data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      body: data,
    );
    if (response.statusCode == 201) {
      var body = jsonDecode(response.body);
      await setSharedPrefenceValue(token, body['user_access_token']);
      await setSharedPrefenceValue(refreshToken, body['user_refresh_token']);

      Map<String, dynamic> payload = Jwt.parseJwt(body['user_refresh_token']);
      await setSharedPrefenceValue(username, payload['user_username']);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      // print(payload['user_permissions']);
      List<String> list = (payload['user_permissions'] as List).cast<String>();
      // print(list);
      await preferences.setStringList('role', list);
      // print(await preferences.getStringList('role'));

      // if (payload['user_role'] == 'super-admin') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '1',
      //   );
      // } else if (payload['user_role'] == 'company-admin') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '2',
      //   );
      // } else if (payload['user_role'] == 'company-manager') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '3',
      //   );
      // } else if (payload['user_role'] == 'company-employee') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '4',
      //   );
      // } else if (payload['user_role'] == 'multi-device-profile') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '5',
      //   );
      // } else if (payload['user_role'] == 'basic-profile') {
      //   await setSharedPrefenceValue(
      //     'userRole',
      //     '6',
      //   );
      // }
      // await setSharedPrefenceValue(
      //   username,
      //   payload['user_username'],
      // );

      showToast('Successfully Login');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BeyondantDashboard(),
        ),
      );
    } else {
      // throw Exception('Failed to Login!');
      showToast('Invalid Credentials');
    }
  }
}
