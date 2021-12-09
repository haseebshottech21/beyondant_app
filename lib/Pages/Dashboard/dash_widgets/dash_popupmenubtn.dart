import 'package:beyondant_new_app/Pages/Login/login.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visit_profile.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopupMenuButtonBeyond extends StatefulWidget {
  const PopupMenuButtonBeyond({Key? key}) : super(key: key);

  @override
  State<PopupMenuButtonBeyond> createState() => _PopupMenuButtonBeyondState();
}

class _PopupMenuButtonBeyondState extends State<PopupMenuButtonBeyond> {
  String user = 'usrename';

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  void getUsername() async {
    user = await getSharedPrefenceValue(username);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  showbottomList(
                    user,
                    FontAwesomeIcons.userAlt,
                    () {},
                  ),
                  showbottomList(
                    'Profile Settings',
                    FontAwesomeIcons.userCog,
                    () {},
                  ),
                  showbottomList(
                    'Visit Profile',
                    FontAwesomeIcons.solidEye,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VisitProfile(),
                        ),
                      );
                    },
                  ),
                  showbottomList(
                    'Logout',
                    FontAwesomeIcons.signOutAlt,
                    () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove(token);
                      sharedPreferences.remove(refreshToken);
                      sharedPreferences.remove(username);
                      // sharedPreferences.clear();
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   LoginScreen.routeName,
                      //   (Route<dynamic> route) => false,
                      // );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName,
                        (route) => false,
                      );
                      showToast('You have been Logout');
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const FaIcon(
        FontAwesomeIcons.userAlt,
        size: 20,
      ),
    );
    // return PopupMenuButton<String>(
    //   icon: const FaIcon(
    //     FontAwesomeIcons.userAlt,
    //     size: 20,
    //   ),
    //   itemBuilder: (context) {
    //     return [
    //       _simplePopupItem(
    //         // 1,
    //         user,
    //         () {},
    //         FontAwesomeIcons.userAlt,
    //       ),
    //       _simplePopupItem(
    //         // 2,
    //         'Profile Settings',
    //         () {},
    //         FontAwesomeIcons.userCog,
    //       ),
    //       _simplePopupItem(
    //         // 3,
    //         'Vist Profile',
    //         () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const VisitProfile(),
    //             ),
    //           );
    //         },
    //         FontAwesomeIcons.solidEye,
    //       ),
    //       const PopupMenuDivider(),
    //       _simplePopupItem(
    //         // 3,
    //         'Logout',
    //         () async {
    //           final SharedPreferences sharedPreferences =
    //               await SharedPreferences.getInstance();
    //           sharedPreferences.remove(token);
    //           sharedPreferences.remove(refreshToken);
    //           sharedPreferences.remove(username);
    //           // sharedPreferences.clear();
    //           // Navigator.pushAndRemoveUntil(
    //           //   context,
    //           //   MaterialPageRoute(
    //           //     builder: (context) => const LoginScreen(),
    //           //   ),
    //           // );
    //           // Navigator.of(context).pushAndRemoveUntil(
    //           //   LoginScreen.routeName,
    //           //   (Route<dynamic> route) => false,
    //           // );
    //           Navigator.of(context).pushNamedAndRemoveUntil(
    //             LoginScreen.routeName,
    //             (route) => false,
    //           );

    //           print('Logout');

    //           Fluttertoast.showToast(
    //             msg: 'You have been Logout',
    //             fontSize: 18,
    //           );
    //         },
    //         FontAwesomeIcons.signOutAlt,
    //       ),
    //     ];
    //   },
    // );
  }

  // PopupMenuItem<String> _simplePopupItem(
  //     String text, VoidCallback onTap, IconData icon) {
  //   return PopupMenuItem(
  //     // value: val,
  //     child: ListTile(
  //       contentPadding: const EdgeInsets.symmetric(
  //         horizontal: 2.0,
  //       ),
  //       leading: FaIcon(
  //         icon,
  //         color: AppColors.primaryColor,
  //         size: 22,
  //       ),
  //       title: GestureDetector(
  //         onTap: onTap,
  //         child: Text(
  //           text,
  //           textAlign: TextAlign.start,
  //           style: TextStyle(
  //             color: AppColors.primaryColor,
  //           ),
  //         ),
  //       ),
  //     ),
  //     // Text(
  //     //   text,
  //     //   style: TextStyle(
  //     //     color: AppColors.primaryColor,
  //     //   ),
  //     // ),
  //   );
  // }
}

showbottomList(String text, IconData icon, VoidCallback onTap) {
  return ListTile(
    // contentPadding: const EdgeInsets.symmetric(
    //   horizontal: 2.0,
    // ),
    leading: FaIcon(
      icon,
      color: AppColors.primaryColor,
      size: 22,
    ),
    title: GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
