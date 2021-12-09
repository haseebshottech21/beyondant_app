import 'dart:convert';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Pages/Dashboard/dash_widgets/dashboard_widgets.dart';
import 'package:beyondant_new_app/Pages/Drawer/bottom_menu_sheet.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dash_widgets/dash_charts.dart';

class BeyondantDashboard extends StatefulWidget {
  const BeyondantDashboard({Key? key}) : super(key: key);
  static const routeName = '/dashboard-screen';
  static List<String> userPermission = [];

  static bool findUserPermision(String value) {
    // print(userPermission);

    return userPermission.contains(value) ? true : false;
  }

  @override
  _BeyondantDashboardState createState() => _BeyondantDashboardState();
}

class _BeyondantDashboardState extends State<BeyondantDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Dashboard(),
        ],
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

var chartdisplay;

class _DashboardState extends State<Dashboard> {
  var noDataFound = 'No data';

  BeyondantAPI api = BeyondantAPI();
  final List<ProfileChart> profiletdata = [
    // DeveloperSeries(
    //   date: "1",
    //   developers: 400,
    //   barColor: charts.ColorUtil.fromDartColor(AppColors.primaryColor),
    // ),
  ];

  final List<ContactChart> contactdata = [
    // DeveloperSeries(
    //   date: "1",
    //   developers: 400,
    //   barColor: charts.ColorUtil.fromDartColor(AppColors.primaryColor),
    // ),
  ];

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      // print(await getListSharedPrefenceValue('role'));
      BeyondantDashboard.userPermission =
          (await getListSharedPrefenceValue('role'))!;
    });
    getDashboard();
    super.initState();
  }

  bool isLoaded = false;
  Map<dynamic, dynamic> total = {};

  // void decodeToken() {
  //   String token =
  //       'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3VzZXJuYW1lIjoiYmV5b25kYW50YWRtaSIsInVzZXJfcGVybWlzc2lvbnMiOlsidmlldy1kZXZpY2UtdHlwZSIsImRlbGV0ZS1kZXZpY2UtdHlwZSIsInVwZGF0ZS1kZXZpY2UtdHlwZSIsImNyZWF0ZS1kZXZpY2UtdHlwZSIsImxpc3QtZGV2aWNlLXR5cGUiLCJkZWxldGUtbXktZGV2aWNlIiwidXBkYXRlLW15LWRldmljZSIsImxpc3QtbXktZGV2aWNlIiwiZGVsZXRlLW90aGVyLWRldmljZSIsInVwZGF0ZS1vdGhlci1kZXZpY2UiLCJsaXN0LW90aGVyLWRldmljZSIsImNyZWF0ZS1kZXZpY2UiLCJkZWxldGUtbXktYnVzaW5lc3MtY2FyZCIsInVwZGF0ZS1teS1idXNpbmVzcy1jYXJkIiwiY3JlYXRlLW15LWJ1c2luZXNzLWNhcmQiLCJsaXN0LW15LWJ1c2luZXNzLWNhcmQiLCJkZWxldGUtb3RoZXItYnVzaW5lc3MtY2FyZCIsInVwZGF0ZS1vdGhlci1idXNpbmVzcy1jYXJkIiwiY3JlYXRlLW90aGVyLWJ1c2luZXNzLWNhcmQiLCJsaXN0LW90aGVyLWJ1c2luZXNzLWNhcmQiLCJsaXN0LXNvY2lhbC1tZWRpYS1wbGF0Zm9ybSIsIm1hbmFnZS1teS1zb2NpYWwtbWVkaWEtYWNjb3VudCIsImxpc3QtbXktc29jaWFsLW1lZGlhLWFjY291bnQiLCJtYW5hZ2Utb3RoZXItc29jaWFsLW1lZGlhLWFjY291bnQiLCJsaXN0LW90aGVyLXNvY2lhbC1tZWRpYS1hY2NvdW50IiwibG9naW4tYXMtYW5vdGhlci11c2VyIiwic2VuZC1tYWlsLXRvLXVzZXIiLCJ2aWV3LXVzZXIiLCJ1cGRhdGUtdXNlciIsImRlbGV0ZS11c2VyIiwidXBkYXRlLXVzZXItcGFzc3dvcmQiLCJjaGFuZ2UtdXNlci1yb2xlIiwiY3JlYXRlLXVzZXIiLCJsaXN0LXVzZXIiLCJsaXN0LW15LWNvbnRhY3QiLCJ2aWV3LW15LWNvbnRhY3QiLCJkZWxldGUtbXktY29udGFjdCIsImxpc3Qtb3RoZXItY29udGFjdCIsInZpZXctb3RoZXItY29udGFjdCIsImRlbGV0ZS1vdGhlci1jb250YWN0Iiwib3ZlcnJpZGUtdXNlciIsInZpZXctbXlzZWxmIiwidXBkYXRlLW15c2VsZiJdLCJ1c2VyX3JvbGUiOiJzdXBlci1hZG1pbiIsImlhdCI6MTYzNjc0OTEzMiwiZXhwIjoxNjM2NzUyNzMyfQ.DJjNvFKdtyM6dg4d226l8PFpCAVqTGJYaWB7C7vSl4PXrCWRsndyAae7J56QbDYdWawDikfxRJWd6tx1yEF2ig';

  //   // To decode the token
  //   Map<String, dynamic> payload = Jwt.parseJwt(token);
  //   // Print the payload
  //   print(payload['user_username']);
  // }

  var dashboardCard = {
    "myDevices": "0",
    "myContacts": "0",
    "myBusinessCards": "0",
    "mySocialMediaAccounts": "0",
    "users": "0",
    "otherDevices": "0",
    "otherContacts": "0",
    "otherBusinessCards": "0",
    "otherSocialMediaAccounts": "0",
    "socialMediaPlatforms": "0",
    "deviceTypes": "0",
  };

  getData(var body) {
    if (body["data"]["profileVisits"] != null) {
      for (int i = 0; i < body["data"]["profileVisits"].length; i += 2) {
        var date = body["data"]["profileVisits"][i]["date"].toString();
        var parts = date.split('-');
        var newdate = parts.last;
        profiletdata.add(
          ProfileChart(
            date: newdate,
            profileVisit: body["data"]["profileVisits"][i]["profileVisits"],
            barColor: charts.ColorUtil.fromDartColor(AppColors.primaryColor),
          ),
        );
      }
    }
    if (body["data"]["contactDownloads"] != null) {
      for (int i = 0; i < body["data"]["contactDownloads"].length; i++) {
        contactdata.add(
          ContactChart(
            date: body["data"]["contactDownloads"][i]["date"].toString(),
            contact: body["data"]["contactDownloads"][i]["profileVisits"],
            barColor: charts.ColorUtil.fromDartColor(AppColors.primaryColor),
          ),
        );
      }
    }
    setState(() {
      dashboardCard = {
        "myDevices": body["data"]["myDevices"].toString(),
        "myContacts": body["data"]["myContacts"].toString(),
        "myBusinessCards": body["data"]["myBusinessCards"].toString(),
        "mySocialMediaAccounts":
            body["data"]["mySocialMediaAccounts"].toString(),
        "users": body["data"]["users"].toString(),
        "otherDevices": body["data"]["otherDevices"].toString(),
        "otherContacts": body["data"]["otherContacts"].toString(),
        "otherBusinessCards": body["data"]["otherBusinessCards"].toString(),
        "otherSocialMediaAccounts":
            body["data"]["otherSocialMediaAccounts"].toString(),
        "socialMediaPlatforms": body["data"]["socialMediaPlatforms"].toString(),
        "deviceTypes": body["data"]["deviceTypes"].toString(),
      };
    });
  }

  List<dynamic> profileVisit = [];
  List<dynamic> contactDownload = [];

  Future getDashboard() async {
    final response =
        await http.get(Uri.parse(baseURL + '/dashboard'), headers: {
      // "Content-Type": "application/json",
      'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      // HttpHeaders.authorizationHeader: 'Basic $data',
    });

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (body['data'] != null) {
        getData(body);
        isLoaded = true;
      }
      // print(await getSharedPrefenceValue(token));
      // print(response.statusCode);
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getDashboard);
      // if (await getSharedPrefenceValue(refreshToken) != null) {
      //   setSharedPrefenceValue(
      //       token, await getSharedPrefenceValue(refreshToken));
      //   final SharedPreferences sharedPreferences =
      //       await SharedPreferences.getInstance();
      //   sharedPreferences.remove(refreshToken);
      //   await getDashboard();

      //   print('token is equal to reftesh');
      //   // print('${await getSharedPrefenceValue(refreshToken)}');
      // } else {
      //   print('Token Expire');
      //   final SharedPreferences sharedPreferences =
      //       await SharedPreferences.getInstance();
      //   sharedPreferences.remove(token);
      //   sharedPreferences.remove(refreshToken);
      //   sharedPreferences.remove(username);
      //   Navigator.of(context).pushNamedAndRemoveUntil(
      //     LoginScreen.routeName,
      //     (route) => false,
      //   );

      //   Fluttertoast.showToast(
      //     msg: 'You have been Logout',
      //     fontSize: 18,
      //   );
      //   print(response.body);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent.withOpacity(0.0),
            title: const Center(
              child: Text(
                'DASHBOARD',
                // style: TextStyle(color: Colors.black),
              ),
            ),
            actions: const [
              BottomMenuSheetProfile(),
            ],
          )
        ],
        body: !isLoaded
            ? circularProgress()
            : DashboardWidgets(
                dashboardCard: dashboardCard,
                profileChartData: profiletdata,
                contactChartData: contactdata,
              ),
        // ],
      ),
    );
  }
}
