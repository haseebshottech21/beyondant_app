import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetUser {
  Future gettotalUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final refreshToken = _prefs.getString('refresh_token');

    // setState(() {
    //   refreshData = refreshToken!;
    // });
    final response = await http.get(
        Uri.parse(
          'https://api.beyondant.com:3000/user/get-users',
        ),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $refreshToken',
          // HttpHeaders.authorizationHeader: 'Basic $data',
        });

    // var body = jsonDecode(response.body);
    // print(body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      // print(body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt(
        'totaluser',
        body['users']['count'],
      );

      // final totalUser = preferences.getInt('totaluser');
      // print(totalUser);

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => const Dashboard()));
    }
  }
}
