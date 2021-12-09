import 'package:beyondant_new_app/Pages/Dashboard/dash_widgets/dash_charts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column DashboradCharts(
  BuildContext context,
  List<ProfileChart> profileChart,
  List<ContactChart> contactChart,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 30,
      ),
      // if (widget.profileChartData.isNotEmpty)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          'Total Profile Visits',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // if (widget.profileChartData.isNotEmpty)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.40,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          // color: Colors.white.withOpacity(0.5),
          child: ProfileVisitChart(
            profiledata: profileChart,
          ),
        ),
      ),
      // if (widget.contactChartData.isNotEmpty)
      const SizedBox(
        height: 30,
      ),
      // if (widget.contactChartData.length == 0)s
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          'Total Contact Download',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // if (widget.contactChartData.isNotEmpty)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.40,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          // color: Colors.white.withOpacity(0.5),
          child: ContactDownloadsChart(
            contactdata: contactChart,
          ),
        ),
      ),
      // if (widget.contactChartData.isNotEmpty)
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
