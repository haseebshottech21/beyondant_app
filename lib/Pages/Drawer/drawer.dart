import 'package:beyondant_new_app/Pages/BeyondLinks/AllBeyondLinks/all_beyond_links.dart';
import 'package:beyondant_new_app/Pages/BeyondLinks/MyBeyondLinks/my_personal_beyond_links.dart';
import 'package:beyondant_new_app/Pages/Contacts/AllContacts/all_contacts.dart';
import 'package:beyondant_new_app/Pages/Contacts/MyContacts/my_contacts.dart';
import 'package:beyondant_new_app/Pages/Dashboard/dashboard.dart';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/AllDevices/all_devices.dart';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/CreateDevice/create_new_device.dart';
import 'package:beyondant_new_app/Pages/DeviceConfiguration/MyDevices/my_devices.dart';
import 'package:beyondant_new_app/Pages/DeviceType/device_type.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/AllSocialMediaAccounts/all_social_media_accounts.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/MySocialMediaAccounts/my_social_media_accounts.dart';
import 'package:beyondant_new_app/Pages/SocialMediaPlatform/social_medial_platform.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management.dart';
import 'package:beyondant_new_app/Pages/maps/bracelate_locations.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('User Role' + MyApp.userRole);
    return Drawer(
      child: Container(
        color: const Color(0xFF242424),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/businesscard.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildMenuList(
                  context,
                  title: 'Dashboard',
                  icon: FontAwesomeIcons.home,
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BeyondantDashboard(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                buildMenuList(
                  context,
                  title: 'Beyond Links Map',
                  icon: FontAwesomeIcons.shareSquare,
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BracelateLocationScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.shareSquare,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  title: Text(
                    "Beyond Links",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: <Widget>[
                    if (BeyondantDashboard.findUserPermision(
                        'list-my-business-card'))
                      buildMenuChildrenList(
                        context,
                        title: 'My Personal Beyond Links',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MyPersonalBeyondLinks(),
                            ),
                          );
                        },
                      ),
                    if (BeyondantDashboard.findUserPermision(
                        'list-other-business-card'))
                      buildMenuChildrenList(
                        context,
                        title: 'All Beyond Links',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllBeyondLinks(),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (BeyondantDashboard.findUserPermision(
                    'list-social-media-platform'))
                  buildMenuList(
                    context,
                    title: 'Social Media Platforms',
                    icon: FontAwesomeIcons.bullhorn,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SocialMediaPlatform(),
                        ),
                      );
                    },
                  ),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.userAstronaut,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  title: Text(
                    "Social Media Accounts",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: <Widget>[
                    if (BeyondantDashboard.findUserPermision(
                        'list-my-social-media-account'))
                      buildMenuChildrenList(
                        context,
                        title: 'My Social Media Accounts',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MySocialMediaAccounts(),
                            ),
                          );
                        },
                      ),
                    if (BeyondantDashboard.findUserPermision(
                        'list-other-social-media-account'))
                      buildMenuChildrenList(
                        context,
                        title: 'All Social Media Accounts',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AllSocialMediaAccounts(),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (BeyondantDashboard.findUserPermision('list-device-type'))
                  buildMenuList(
                    context,
                    title: 'Device Types',
                    icon: FontAwesomeIcons.desktop,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeviceTypesBeyondant(),
                        ),
                      );
                    },
                  ),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.laptopCode,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  title: Text(
                    "Device configuration",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: <Widget>[
                    if (BeyondantDashboard.findUserPermision('list-my-device'))
                      buildMenuChildrenList(
                        context,
                        title: 'My Devices',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyDevice(),
                            ),
                          );
                        },
                      ),
                    if (BeyondantDashboard.findUserPermision(
                        'list-other-device'))
                      buildMenuChildrenList(
                        context,
                        title: 'All Devices',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllDevices(),
                            ),
                          );
                        },
                      ),
                    if (BeyondantDashboard.findUserPermision('create-device'))
                      buildMenuChildrenList(
                        context,
                        title: 'Create Devices',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateNewDevice(),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (BeyondantDashboard.findUserPermision('list-user'))
                  buildMenuList(
                    context,
                    title: 'User Management',
                    icon: FontAwesomeIcons.userCog,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserManagement(),
                        ),
                      );
                    },
                  ),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.phone,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  title: Text(
                    "Contacts",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: <Widget>[
                    if (BeyondantDashboard.findUserPermision('list-my-contact'))
                      buildMenuChildrenList(
                        context,
                        title: 'My Contacts',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyContacts(),
                            ),
                          );
                        },
                      ),
                    if (BeyondantDashboard.findUserPermision(
                        'list-other-contact'))
                      buildMenuChildrenList(
                        context,
                        title: 'All Contacts',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllContacts(),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuList(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? sub,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    return ListTile(
      leading: FaIcon(
        icon,
        color: color,
        size: 22.0,
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: 14.0,
        ),
      ),
      onTap: onClicked,
    );
  }

  Widget buildMenuChildrenList(
    BuildContext context, {
    required String title,
    String? sub,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.angleDoubleRight,
          color: color,
          size: 20.0,
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: 13.0,
          ),
        ),
        onTap: onClicked,
      ),
    );
  }
}
