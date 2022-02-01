import 'dart:convert';
import 'package:beyondant_new_app/API/update.dart';
import 'package:beyondant_new_app/Model/beyondLinkModel/edt_beyond_link_model.dart';
import 'package:beyondant_new_app/Model/beyondLinkModel/social_media_beyond_link.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyondant_buttons.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class EditAllBeyondLinks extends StatefulWidget {
  final String userId;
  final String userName;
  const EditAllBeyondLinks({
    required this.userId,
    required this.userName,
    Key? key,
  }) : super(key: key);

  static const routeName = '/edit-all-beyond-link';

  @override
  _EditAllBeyondLinksState createState() => _EditAllBeyondLinksState();
}

class _EditAllBeyondLinksState extends State<EditAllBeyondLinks> {
  EditBeyondLinkModel? futureBeyond;

  UpdateAPI updateAPI = UpdateAPI();

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero).then((value) async {
    //   // futureBeyond = await
    //   fetchBeyondLink();
    // });

    // print(widget.userId);
    // print(widget.userName);
  }

  updateBeyondLink() async {
    // print(json.encode(getManageSMA));
    // return;
    updateAPI.update(
      '/business-cards/manage/other-card/${widget.userId}/${widget.userName}',
      {
        'embedLink': 'null',
        'borderColor': '#1b00ff',
        'selectedColor': '',
      },
      context,
    );
  }

  List<EditSocialMedaBeyondLinkModel> socialMediaBeyondList = [];

  // update /business-cards/manage/other-card/1625/haseebdev21

  Future<EditBeyondLinkModel> fetchBeyondLink() async {
    socialMediaBeyondList = [];
    final response = await http.get(
      Uri.parse(baseURL +
          '/business-cards/get-data/other-card/${widget.userId}/${widget.userName}'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);

      final responseData = json.decode(response.body);
      for (var link in responseData['userSocialMediaAccounts']) {
        socialMediaBeyondList.add(
          EditSocialMedaBeyondLinkModel.fromJson(link),
        );
      }

      return EditBeyondLinkModel.fromJson(responseData);
    }
    // else if (response.statusCode == 401) {
    //   return checkTokenExipre(context, getEditAllBeyondLink);
    // }
    else {
      throw Exception('Failed to load');
    }
  }

  final double coverHeight = 180;
  final double profileHeight = 90;

  String img =
      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACICAYAAAAF3RIJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjFFNkQzMTdFQjlBQTExRUJBNUM3QjNFQjU1RTk3Nzg3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjFFNkQzMTdGQjlBQTExRUJBNUM3QjNFQjU1RTk3Nzg3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MUU2RDMxN0NCOUFBMTFFQkE1QzdCM0VCNTVFOTc3ODciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MUU2RDMxN0RCOUFBMTFFQkE1QzdCM0VCNTVFOTc3ODciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz69v3o4AAAR8klEQVR42uxd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';

  @override
  Widget build(BuildContext context) {
    // Center(
    //       child: FutureBuilder<Album>(
    //         future: futureAlbum,
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    //             return Text(snapshot.data.title);
    //           } else if (snapshot.hasError) {
    //             return Text("${snapshot.error}");
    //           }
    //           return CircularProgressIndicator();
    //         },
    //       ),
    //     ),
    //   ),

    return Scaffold(
      drawer: const MyDrawer(),
      // appBar: myAppBar('Edit All Beyond Links'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text('Edit Beyond Link'),
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
            builder: (context) => TextButton(
              onPressed: updateBeyondLink,
              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<EditBeyondLinkModel>(
          future: fetchBeyondLink(),
          builder: (context, snapshot) {
            // print(futureBeyond!.socialMediaAccountList.length);
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    children: [
                      buildTop(
                        baseUrlImage + snapshot.data!.userCoverPic,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              snapshot.data!.userUsername,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (ctx, index) {
                                return beyondImage(
                                  socialMediaBeyondList[index],
                                  context,
                                );
                              },
                              itemCount: socialMediaBeyondList.length,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       beyondImage(
                            //           'assets/images/beyondlink.png', context),
                            //       beyondImage(
                            //           'assets/images/vcardlink.png', context),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       beyondImage(
                            //           'assets/images/fblink.png', context),
                            //       beyondImage(
                            //           'assets/images/instalink.png', context),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       beyondImage(
                            //           'assets/images/sclink.png', context),
                            //       beyondImage(
                            //           'assets/images/ytlink.png', context),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       beyondImage(
                            //           'assets/images/twlink.png', context),
                            //       beyondImage(
                            //           'assets/images/ldklink.png', context),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       beyondImage(
                            //           'assets/images/gplink.png', context),
                            //       beyondImage(
                            //           'assets/images/tiklink.png', context),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 22),
                            //   child: beyondImage(
                            //       'assets/images/wapplink.png', context),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: profileImage(
                          profileImage: snapshot.data!.userProfilePic == ''
                              ? emptyImage
                              : baseUrlImage + snapshot.data!.userProfilePic,
                          borderColor:
                              '0xFF${(snapshot.data!.profileBorderColor).split('#').last.trim()}'),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return circularProgress();
          },
        ),
      ),
    );
  }

  Widget buildTop(
    String coverPic,
  ) {
    // final top = coverHeight - profileHeight / 1.5;
    var cover =
        'https://api.beyondant.com:3000/users/albertcustomlast11/business-card-styles/f655338c-3375-4dfe-b39c-f6c9218329f9.png';

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          // alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: coverHeight,
              // alignment: Alignment.center,
              // color: Colors.grey[200],
              decoration: BoxDecoration(
                border: Border.all(width: 0.1),
                image: DecorationImage(
                  image: NetworkImage(coverPic),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.7),
                  child: const FaIcon(
                    FontAwesomeIcons.camera,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Stack profileImage({
  required String profileImage,
  required String borderColor,
}) {
  return Stack(
    children: [
      Container(
        height: 155,
        width: 155,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[6],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
          border: Border.all(
            color: Color(int.parse(borderColor)),
            width: 5,
          ),
          image: DecorationImage(
            image: NetworkImage(
              profileImage,
              // 'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: 5,
        bottom: 5,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ],
  );
}

Stack beyondImage(EditSocialMedaBeyondLinkModel editSocialMedaBeyondLinkModel,
    BuildContext context) {
  // Image example. Put your data string
  // String base64Image = image;

  // Convert to UriData
  // final UriData data = UriData.parse(base64Image);

  // Will returns your image as Uint8List
  // Uint8List myImage = data.contentAsBytes();

  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          if (editSocialMedaBeyondLinkModel.socialMediaAccountList.isNotEmpty) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 6,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/' +
                          editSocialMedaBeyondLinkModel.socilMediaPlatformSlug +
                          '.png',
                      height: 80,
                      width: 80,
                    ),
                    Column(
                      children: editSocialMedaBeyondLinkModel
                          .socialMediaAccountList
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e['social_media_account_name'].toString(),
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: const Color(0xFF16b211),
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                actionsPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                actions: [
                  BeyondButton(
                    text: 'Done',
                    color: Colors.black,
                    size: const Size(30, 35),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          }
        },
        child: Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/' +
                    editSocialMedaBeyondLinkModel.socilMediaPlatformSlug +
                    '.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 10,
        child: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 16,
          child: Text(
            (editSocialMedaBeyondLinkModel.socialMediaAccountList.length)
                .toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      )
    ],
  );
}
