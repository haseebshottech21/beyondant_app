import 'dart:convert';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
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
}
