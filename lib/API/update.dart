import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateAPI {
  Future<bool> update(String url, Map data, BuildContext context) async {
    final response = await http.patch(
      Uri.parse(baseURL + url),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        // HttpHeaders.authorizationHeader: 'Basic $data',
      },
      body: data,
    );

    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      // var body = jsonDecode(response.body);
      // showToast(
      //   'Beyond Link Created',
      // );
      // Navigator.pop(context);
      showToast('Successfully Updated');
      return true;
    } else {
      showToast(
        'Failed To Update',
      );
      return false;
    }
  }
}
