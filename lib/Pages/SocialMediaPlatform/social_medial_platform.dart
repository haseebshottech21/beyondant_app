import 'dart:convert';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/SocialMediaPlatform/social_media_widgets.dart/socail_media_table.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SocialMediaPlatform extends StatefulWidget {
  const SocialMediaPlatform({Key? key}) : super(key: key);

  @override
  _SocialMediaPlatformState createState() => _SocialMediaPlatformState();
}

class _SocialMediaPlatformState extends State<SocialMediaPlatform> {
  List<dynamic> socialMediaPlatforms = [];

  @override
  void initState() {
    getSocialMediaPlatform();
    super.initState();
  }

  Future getSocialMediaPlatform() async {
    final response = await http.get(
        Uri.parse(
          baseURL + '/social-media/platform/get-platforms-for-accounts',
        ),
        headers: {
          // "Content-Type": "application/json",
          'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        });

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        socialMediaPlatforms = body['socialMediaPlatforms'];
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getSocialMediaPlatform);
    }

    // print(socialMediaPlatforms.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('Socail Media Platform'),
      body: Stack(
        children: [
          tableBackground(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Text(
                        'SOCIAL MEDIA PLATFORM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    socialMediaPlatforms.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            // alignment: Alignment.center,
                            child: circularProgress(),
                          )
                        : SocialMedaiTable(
                            socialMediaPlatforms,
                          ),
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
