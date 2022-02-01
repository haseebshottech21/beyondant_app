import 'package:beyondant_new_app/Pages/Login/login.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visit_profile.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomMenuSheetProfile extends StatefulWidget {
  const BottomMenuSheetProfile({Key? key}) : super(key: key);

  @override
  _BottomMenuSheetProfileState createState() => _BottomMenuSheetProfileState();
}

class _BottomMenuSheetProfileState extends State<BottomMenuSheetProfile> {
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
                vertical: 12,
              ),
              height: MediaQuery.of(context).size.height * 0.35,
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
  }
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
