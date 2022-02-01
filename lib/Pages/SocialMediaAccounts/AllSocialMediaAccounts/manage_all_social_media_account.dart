import 'dart:convert';
import 'package:beyondant_new_app/API/update.dart';
import 'package:beyondant_new_app/Model/socialMediaAccountModel/manage_media_account.dart';
import 'package:beyondant_new_app/Pages/Drawer/social_media_drawer.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_card_field.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_card_widget.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_submit.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ManageAllSocialMediaAccount extends StatefulWidget {
  const ManageAllSocialMediaAccount({Key? key}) : super(key: key);

  static const routeName = '/manage-all-social-media';

  @override
  _ManageAllSocialMediaAccountState createState() =>
      _ManageAllSocialMediaAccountState();
}

class _ManageAllSocialMediaAccountState
    extends State<ManageAllSocialMediaAccount> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      await getAPI();
      await getUsersDropDown();
    });
    super.initState();
  }

  Future getAPI() async {
    getManageSMA = {};
    manageAllSocialMediaAccounts = [];
    await getManageAll();
    await getManageAllSocailMediaAccounts();
  }

  UpdateAPI updateAPI = UpdateAPI();
  List<dynamic> getUsers = [];
  List<ManageSocailMediaAccountModel> manageAllSocialMediaAccounts = [];
  Map<String, dynamic> getManageSMA = {};
  String selectedUsername = 'beyondantadmi';

  updateAllSMA() async {
    print(json.encode(getManageSMA));
    // return;
    updateAPI.update(
      '/social-media/account/other-accounts/manage',
      {
        'user_social_media_links': json.encode(getManageSMA),
        'user_username': selectedUsername,
      },
      context,
    );
  }

  Future getUsersDropDown() async {
    final response = await http.get(
      Uri.parse(
        baseURL +
            '/user/for-selection?userUsername=beyondantadmi&page=1&items=18446744073709551615',
      ),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // isLoading = false;
      setState(() {
        getUsers = body['users']['rows'];
      });
      print(getUsers);
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getUsersDropDown);
    }
  }

  Future getManageAll() async {
    final response = await http.get(
      Uri.parse(
        baseURL +
            '/social-media/account/other-accounts/manage/$selectedUsername',
      ),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // isLoading = false;
      setState(() {
        getManageSMA = body['socialMediaAccounts'];
        // facebookUrls = getManageSMA['facebook'];
        print(body['socialMediaAccounts']);
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getManageAll);
    }
  }

  Future getManageAllSocailMediaAccounts() async {
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
        manageAllSocialMediaAccounts.add(
          ManageSocailMediaAccountModel(
              socialMediaId:
                  managesocialmedia['social_media_platform_id'].toString(),
              socialMediaName:
                  managesocialmedia['social_media_platform_name'].toString(),
              socialMediaSlug:
                  managesocialmedia['social_media_platform_slug'].toString(),
              socialMediaBaseUrl:
                  managesocialmedia['social_media_platform_base_url']
                      .toString(),
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
                  managesocialmedia['social_media_platform_slug'].toString())),
        );
      }
      // isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getManageAllSocailMediaAccounts);
    }

    // print(allSocialMediaAccounts.length);
  }

  selectSocialMediaSection(int index) {
    if (manageAllSocialMediaAccounts[index].selected == false) {
      manageAllSocialMediaAccounts[index].selected = true;
      setState(() {});
    }
  }

  closeSocialMediaSection(int index) {
    print(index);
    manageAllSocialMediaAccounts[index].selected = false;

    (getManageSMA[manageAllSocialMediaAccounts[index].socialMediaSlug] as List)
        .removeWhere((element) => element['social_media_account_name'] == '');

    // .add({"social_media_account_id": "", "social_media_account_name": ""});
    setState(() {});
  }

  addField(int index) {
    getManageSMA.putIfAbsent(
        manageAllSocialMediaAccounts[index].socialMediaSlug, () => []);
    // if (getManageSMA
    //     .containsKey(manageMySocialMediaAccounts[index].socialMediaSlug)) {
    (getManageSMA[manageAllSocialMediaAccounts[index].socialMediaSlug] as List)
        .add({"social_media_account_id": "", "social_media_account_name": ""});
    // } else {
    // }
    setState(() {});
  }

  removeField(int textIndex, listIndex) {
    (getManageSMA[manageAllSocialMediaAccounts[listIndex].socialMediaSlug]
            as List)
        .removeAt(textIndex);

    // setState(() {});
  }

  textFieldOnChange(int textIndex, listIndex, String text) {
    // (urlIndex, index, val)
    try {
      (getManageSMA[manageAllSocialMediaAccounts[listIndex].socialMediaSlug]
          as List)[textIndex]["social_media_account_name"] = text.trim();

      setState(() {});
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SocialMediaDrawer(
        manageSocailMediaAccounts: manageAllSocialMediaAccounts,
        // socialMediaImg: 'assets/images/facebook_icon.png',
        getUser: getUsers,
        onPressed: selectSocialMediaSection,
        showDropdown: true,
        // socialMediaSelectedValues: selectedSocialMediaSection,
        onChanged: (val) {
          // getDropDownItem();
          // widget.getValue;
          selectedUsername = val.toString();
          getAPI();

          // print(val);
        },
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
                manageAllSocialMediaAccounts.length,
                (index) {
                  return !(manageAllSocialMediaAccounts[index].selected
                      // &&
                      // getManageSMA.containsKey(
                      //     manageMySocialMediaAccounts[index]
                      //         .socialMediaSlug)
                      )
                      ? const SizedBox()
                      : SocailMediaAccountCard(
                          topImage: baseUrlImage +
                              manageAllSocialMediaAccounts[index]
                                  .socialMediaCardHeader
                                  .replaceAll(r"\", r"/"),
                          cancel: () => closeSocialMediaSection(index),
                          addMore: () => addField(index),
                          textFieldsColumn: Column(
                            children: getManageSMA.containsKey(
                                    manageAllSocialMediaAccounts[index]
                                        .socialMediaSlug)
                                ? List.generate(
                                    (getManageSMA[
                                            manageAllSocialMediaAccounts[index]
                                                .socialMediaSlug] as List)
                                        .length,
                                    (urlIndex) {
                                      return SocialMediaAccountURLField(
                                        urlText: (getManageSMA[
                                                    manageAllSocialMediaAccounts[
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
                              manageAllSocialMediaAccounts[index]
                                  .socailGradientleft,
                            ),
                          ),
                          bottomRightColor: Color(
                            int.parse(
                              manageAllSocialMediaAccounts[index]
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
                onPressed: () => updateAllSMA(),
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
