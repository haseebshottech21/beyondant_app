import 'dart:convert';
import 'package:beyondant_new_app/API/update.dart';
import 'package:beyondant_new_app/Model/socialMediaAccountModel/manage_media_account.dart';
import 'package:beyondant_new_app/Pages/Drawer/social_media_drawer.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_card_field.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_card_widget.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_submit.dart';
// import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ManageMySocialMediaAccount extends StatefulWidget {
  const ManageMySocialMediaAccount({Key? key}) : super(key: key);

  static const routeName = '/manage-my-social-media';

  @override
  _ManageMySocialMediaAccountState createState() =>
      _ManageMySocialMediaAccountState();
}

class _ManageMySocialMediaAccountState
    extends State<ManageMySocialMediaAccount> {
  // TextEditingController controller = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      await getManageMySMA();
      await getManageMySocailMediaAccounts();
    });
    super.initState();
  }

  UpdateAPI updateAPI = UpdateAPI();
  List<ManageSocailMediaAccountModel> manageMySocialMediaAccounts = [];
  Map<String, dynamic> getManageSMA = {};
  bool isLoading = false;

  // Map<String, bool> selectedSocialMediaSection = {
  //   'facebook': false,
  //   'google': false,
  // };

  updateMySMA() async {
    print(json.encode(getManageSMA));
    // return;
    updateAPI.update(
      '/social-media/account/my-accounts/manage',
      {
        'user_social_media_links': json.encode(getManageSMA),
        'user_username': await getSharedPrefenceValue(username),
      },
      context,
    );
  }

  Future getManageMySMA() async {
    final response = await http.get(
      Uri.parse(
        baseURL + '/social-media/account/my-accounts/manage',
      ),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // isLoading = false;
      setState(() {
        getManageSMA = body['socialMediaAccounts'];
        // facebookUrls = getManageSMA['facebook'];
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getManageMySMA);
    }
  }

  Future getManageMySocailMediaAccounts() async {
    // setState(() {
    //   isLoading = true;
    // });
    final response = await http.get(
        Uri.parse(
            baseURL + '/social-media/platform/get-platforms-for-accounts'),
        headers: {
          // "Content-Type": "application/json",
          'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        });

    var body = jsonDecode(response.body);
    // print(body['deviceTypes'][0]['device_type_name']);

    if (response.statusCode == 200) {
      for (var managesocialmedia in body['socialMediaPlatforms']) {
        manageMySocialMediaAccounts.add(
          ManageSocailMediaAccountModel(
            socialMediaId:
                managesocialmedia['social_media_platform_id'].toString(),
            socialMediaName:
                managesocialmedia['social_media_platform_name'].toString(),
            socialMediaSlug:
                managesocialmedia['social_media_platform_slug'].toString(),
            socialMediaBaseUrl:
                managesocialmedia['social_media_platform_base_url'].toString(),
            socialMediaImage:
                managesocialmedia['social_media_platform_image'].toString(),
            socialMediaCardHeader:
                managesocialmedia['social_media_platform_card_header']
                    .toString(),
            socailGradientleft: '0xFF' +
                managesocialmedia['social_media_platform_styles']
                        ['background-image']
                    .split(',')[1]
                    .replaceAll('#', '')
                    .trim(),
            // .toString(),
            socailGradientRight: '0xFF' +
                managesocialmedia['social_media_platform_styles']
                        ['background-image']
                    .split('#')
                    .last
                    .replaceAll(')', '')
                    .trim(),
            selected: getManageSMA.containsKey(
              managesocialmedia['social_media_platform_slug'].toString(),
            ),
          ),
        );
      }
      // isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getManageMySocailMediaAccounts);
    }

    // print(allSocialMediaAccounts.length);
  }

  selectSocialMediaSection(int index) {
    if (manageMySocialMediaAccounts[index].selected == false) {
      manageMySocialMediaAccounts[index].selected = true;
      setState(() {});
    }
  }

  closeSocialMediaSection(int index) {
    print(index);
    manageMySocialMediaAccounts[index].selected = false;

    (getManageSMA[manageMySocialMediaAccounts[index].socialMediaSlug] as List)
        .removeWhere((element) => element['social_media_account_name'] == '');

    // .add({"social_media_account_id": "", "social_media_account_name": ""});
    setState(() {});
  }

  addField(int index) {
    getManageSMA.putIfAbsent(
        manageMySocialMediaAccounts[index].socialMediaSlug, () => []);
    // if (getManageSMA
    //     .containsKey(manageMySocialMediaAccounts[index].socialMediaSlug)) {
    (getManageSMA[manageMySocialMediaAccounts[index].socialMediaSlug] as List)
        .add(
      {
        "social_media_account_id": null,
        "social_media_account_name": "",
      },
    );
    // } else {
    // }
    setState(() {});
  }

  removeField(int textIndex, listIndex) {
    (getManageSMA[manageMySocialMediaAccounts[listIndex].socialMediaSlug]
            as List)
        .removeAt(textIndex);

    // setState(() {});
  }

  textFieldOnChange(int textIndex, int listIndex, String text) {
    print('$textIndex, $listIndex $text');
    try {
      (getManageSMA[manageMySocialMediaAccounts[listIndex].socialMediaSlug]
          as List)[textIndex]["social_media_account_name"] = text.trim();

      setState(() {});
    } catch (ex) {
      print(ex.toString());
    }
  }

  // int getIndex(int index) {
  //   if (getManageSMA['facebook'] == 'facebook') {
  //     return facebookUrls.length;
  //   } else if (getManageSMA['google-plus'] == 'google-plus') {
  //     return googleUrls.length;
  //   } else {
  //     return 0;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print(getManageSMA);
    return Scaffold(
      endDrawer: SocialMediaDrawer(
        manageSocailMediaAccounts: manageMySocialMediaAccounts,
        // socialMediaImg: 'assets/images/facebook_icon.png',
        getUser: [],
        onPressed: selectSocialMediaSection,
        // socialMediaSelectedValues: selectedSocialMediaSection,
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text('Manage Account'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const FaIcon(FontAwesomeIcons.plusSquare),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                manageMySocialMediaAccounts.length,
                (index) {
                  return !(manageMySocialMediaAccounts[index].selected
                      // &&
                      // getManageSMA.containsKey(
                      //     manageMySocialMediaAccounts[index]
                      //         .socialMediaSlug)
                      )
                      ? const SizedBox()
                      : SocailMediaAccountCard(
                          topImage: baseUrlImage +
                              manageMySocialMediaAccounts[index]
                                  .socialMediaCardHeader
                                  .replaceAll(r"\", r"/"),
                          cancel: () => closeSocialMediaSection(index),
                          addMore: () => index == 5 ? null : addField(index),
                          textFieldsColumn: Column(
                            children: getManageSMA.containsKey(
                                    manageMySocialMediaAccounts[index]
                                        .socialMediaSlug)
                                ? List.generate(
                                    (getManageSMA[
                                            manageMySocialMediaAccounts[index]
                                                .socialMediaSlug] as List)
                                        .length,
                                    (urlIndex) {
                                      return SocialMediaAccountURLField(
                                        urlText: (getManageSMA[
                                                    manageMySocialMediaAccounts[
                                                            index]
                                                        .socialMediaSlug]
                                                as List)[urlIndex]
                                            ['social_media_account_name'],
                                        // urlIndex['social_media_account_name'].,
                                        onTextChange: textFieldOnChange,

                                        removeField: () {
                                          setState(() {
                                            removeField(urlIndex, index);
                                          });
                                        },
                                        index: index,
                                        urlIndex: urlIndex,
                                      );
                                    },
                                  )
                                : [],
                          ),
                          topLeftColor: Color(
                            int.parse(
                              manageMySocialMediaAccounts[index]
                                  .socailGradientleft,
                            ),
                          ),
                          bottomRightColor: Color(
                            int.parse(
                              manageMySocialMediaAccounts[index]
                                  .socailGradientRight,
                            ),
                          ),
                          index: index,
                        );
                },
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: SubmitButton(
                onPressed: () => updateMySMA(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
