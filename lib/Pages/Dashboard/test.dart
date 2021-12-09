import 'dart:convert';

import 'package:beyondant_new_app/Pages/Dashboard/dashboard.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dash_widgets/dash_cards.dart';

class TestingDashboard extends StatefulWidget {
  const TestingDashboard({Key? key}) : super(key: key);

  @override
  _TestingDashboardState createState() => _TestingDashboardState();
}

class _TestingDashboardState extends State<TestingDashboard> {
  var data;
  var refreshData;

  @override
  void initState() {
    // getDashboardData().then((value) {
    //   setState(() {
    //     info = value;
    //   });
    // });
    fetchDashboard = getDashboardData();
    super.initState();
  }

  Future? fetchDashboard;
  List<dynamic> Listresponse = [];
  var info;
  Map Mapresponse = {};

  Future getDashboardData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final accessToken = _prefs.getString('token');
    final refreshToken = _prefs.getString('refresh_token');

    setState(() {
      data = accessToken;
      refreshData = refreshToken;
    });

    final response = await http.get(
      Uri.parse('https://api.beyondant.com:3000/dashboard'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $data',
      },
    );
    // print(data);
    // final jsonData = response.body;
    // info = jsonDecode(response.body);
    // print(info['data']);
    // return info['data'];

    if (response.statusCode == 200) {
      setState(() {
        Mapresponse = jsonDecode(response.body);
        info = Mapresponse['data'];
        print(info);
        // // Listfacts2 = Mapresponse;
        // total = Mapresponse['total'];
      });
      return info;
    }

    // return Mapresponse['data'];
    // return jsonData['total'];

    // List<User> user = [];

    // if (jsonData['data'] != null) {
    //   for (var u in jsonData['data']) {
    //     User us = User(
    //       id: u['id'],
    //       email: u['email'],
    //       firstName: u['first_name'],
    //       lastName: u['last_name'],
    //       avatar: u['avatar'],
    //     );
    //     user.add(us);
    //   }
    // }
    // return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: fetchDashboard,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // print((snapshot.data.length));
              return ListView.builder(
                  // padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.46,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.userShield,
                                color: AppColors.primaryColor,
                                size: 22,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'User',
                                  maxLines: 2,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data['$index'].toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
