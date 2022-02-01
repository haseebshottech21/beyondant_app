import 'package:beyondant_new_app/Model/socialMediaAccountModel/manage_media_account.dart';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/CreateDevice/createdevice_widgets/create_device_dropdown.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SocialMediaDrawer extends StatefulWidget {
  final List<dynamic> getUser;
  final List<ManageSocailMediaAccountModel> manageSocailMediaAccounts;
  final Function onPressed;
  final bool showDropdown;
  final void Function(String?)? onChanged;
  const SocialMediaDrawer({
    required this.manageSocailMediaAccounts,
    required this.onPressed,
    required this.getUser,
    this.onChanged,
    this.showDropdown = false,
    Key? key,
  }) : super(key: key);

  @override
  State<SocialMediaDrawer> createState() => _SocialMediaDrawerState();
}

class _SocialMediaDrawerState extends State<SocialMediaDrawer> {
  // @override
  // void initState() {
  //   getUsersDropDown();
  //   super.initState();
  // }

  // List<dynamic> getUsers = [];

  // Future getUsersDropDown() async {
  //   final response = await http.get(
  //     Uri.parse(
  //       // baseURL + '/user/for-selection?page=1&items=18446744073709551615',
  //       baseURL +
  //           '/user/for-selection?userUsername=beyondantadmi&page=1&items=18446744073709551615',
  //     ),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
  //     },
  //   );

  //   var body = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     // isLoading = false;
  //     setState(() {
  //       getUsers = body['users']['rows'];
  //     });
  //   } else if (body['statusCode'] == 401) {
  //     checkTokenExipre(context, getUsersDropDown);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              // color: Color(0xFF242424),
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                // physics: const NeverScrollableScrollPhysics(),
                // Important: Remove any padding from the ListView.
                // padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/social_img.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'SOCIAL MEDIA \nPLATFORM',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.showDropdown)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: SearchDropDownField(
                        // context,
                        hintText: 'Select User',
                        mode: Mode.MENU,
                        maxHeight: MediaQuery.of(context).size.height * 0.40,
                        dropdownItems: widget.getUser.map(
                          (users) {
                            // print(users['user_username'].length);
                            return users['user_username'].toString();
                          },
                        ).toList(),
                        // onChanged: (value2) {
                        //   setState(() {
                        //     _values['input2'] = value2;
                        //   });
                        // },
                        // onChanged: (val) {
                        //   // getDropDownItem();
                        //   // widget.getValue;
                        //   setState(
                        //     () {
                        //       // selectedUser = val.toString();
                        //       // cardBoxValue = selectedUser;
                        //       // getUser();
                        //     },
                        //   );
                        //   // print(val);
                        // },
                        onChanged:
                            widget.showDropdown ? widget.onChanged : (val) {},
                      ),
                    ),
                  // socialMediaAccountPlatform(),
                  Container(
                    color: Colors.black,
                    height: widget.showDropdown == true
                        ? MediaQuery.of(context).size.height * 0.75
                        : MediaQuery.of(context).size.height * 0.82,
                    padding: const EdgeInsets.only(
                      // top: 2,
                      bottom: 25,
                    ),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.manageSocailMediaAccounts.length,
                      itemBuilder: (context, index) {
                        // String replaced = widget
                        //     .allSocailMediaAccountsTable[index].socialMediaImage
                        //     .replaceAll(r"\", r"/");
                        return socialMediaAccountPlatform(
                          isSelected:
                              widget.manageSocailMediaAccounts[index].selected,
                          index: index,
                          onPress: widget.onPressed,
                          socialImage: baseUrlImage +
                              widget.manageSocailMediaAccounts[index]
                                  .socialMediaImage
                                  .replaceAll(r"\", r"/"),
                          // widget.allSocailMediaAccountsTable[index]
                          //     .socialMediaImage
                          //     .toString(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget socialMediaAccountPlatform(
      {required String socialImage,
      required Function onPress,
      required int index,
      required bool isSelected}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: GestureDetector(
          onTap: () => onPress(index),
          child:
              // onTap == true ?
              Container(
            // width: 220,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  // 'https://api.beyondant.com:3000/social-media-platforms/twitter/6f533540-0f0f-47e8-93bf-c20a235eb6b0.png'
                  socialImage,
                  // 'assets/images/socail_facbook.jpg',
                  // widget.socialMediaImg,
                ),
                fit: BoxFit.fill,
                // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color)
                colorFilter: isSelected
                    ? null
                    : const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.color,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
