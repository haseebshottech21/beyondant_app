import 'package:beyondant_new_app/Pages/Dashboard/dash_widgets/dash_cards.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dash_charts.dart';
import 'dashboard_charts.dart';

class DashboardWidgets extends StatefulWidget {
  Map dashboardCard;
  List<ProfileChart> profileChartData;
  List<ContactChart> contactChartData;
  DashboardWidgets({
    required this.dashboardCard,
    required this.profileChartData,
    required this.contactChartData,
    Key? key,
  }) : super(key: key);

  @override
  _DashboardWidgetsState createState() => _DashboardWidgetsState();
}

class _DashboardWidgetsState extends State<DashboardWidgets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                      FontAwesomeIcons.users,
                      'Users',
                      widget.dashboardCard['users'] == 'null'
                          ? '0'
                          : widget.dashboardCard['users'].toString(),
                    ),
                    DashCards(
                      FontAwesomeIcons.tv,
                      'My Devices',
                      widget.dashboardCard['myDevices'] == 'null'
                          ? '0'
                          : widget.dashboardCard['myDevices'].toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                      FontAwesomeIcons.tv,
                      'All Devices',
                      widget.dashboardCard['otherDevices'] == 'null'
                          ? '0'
                          : widget.dashboardCard['otherDevices'].toString(),
                    ),
                    DashCards(
                      FontAwesomeIcons.shareSquare,
                      'My Personal \nBeyondant Links',
                      widget.dashboardCard['myBusinessCards'] == 'null'
                          ? '0'
                          : widget.dashboardCard['myBusinessCards'].toString(),
                    ),
                  ],
                ),
              ),
              if (widget.profileChartData.isNotEmpty ||
                  widget.contactChartData.isNotEmpty)
                DashboradCharts(
                  context,
                  widget.profileChartData,
                  widget.contactChartData,
                ),
              if (widget.profileChartData.isEmpty ||
                  widget.contactChartData.isEmpty)
                const SizedBox(
                  height: 10,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                      FontAwesomeIcons.shareSquare,
                      'All Beyond Links',
                      widget.dashboardCard['otherBusinessCards'] == 'null'
                          ? '0'
                          : widget.dashboardCard['otherBusinessCards']
                              .toString(),
                    ),
                    DashCards(
                      FontAwesomeIcons.userShield,
                      'My Social Media \nAccounts',
                      widget.dashboardCard['mySocialMediaAccounts'] == 'null'
                          ? '0'
                          : widget.dashboardCard['mySocialMediaAccounts']
                              .toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                      FontAwesomeIcons.shareAlt,
                      'All Social Media \nAccounts',
                      widget.dashboardCard['otherSocialMediaAccounts'] == 'null'
                          ? '0'
                          : widget.dashboardCard['otherSocialMediaAccounts']
                              .toString(),
                    ),
                    DashCards(
                      FontAwesomeIcons.bullhorn,
                      'Social Media \nPlatforms',
                      widget.dashboardCard['socialMediaPlatforms'] == 'null'
                          ? '0'
                          : widget.dashboardCard['socialMediaPlatforms']
                              .toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                      FontAwesomeIcons.shareAlt,
                      'Device Types',
                      widget.dashboardCard['deviceTypes'] == 'null'
                          ? '0'
                          : widget.dashboardCard['deviceTypes'].toString(),
                    ),
                    DashCards(
                      FontAwesomeIcons.addressCard,
                      'My Contacts',
                      widget.dashboardCard['myContacts'] == 'null'
                          ? '0'
                          : widget.dashboardCard['myContacts'].toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DashCards(
                      FontAwesomeIcons.addressCard,
                      'Other Contacts',
                      widget.dashboardCard['otherContacts'] == 'null'
                          ? '0'
                          : widget.dashboardCard['otherContacts'].toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
