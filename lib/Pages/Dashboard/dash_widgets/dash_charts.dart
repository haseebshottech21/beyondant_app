import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  // final List<DeveloperSeries> data = [
  //   DeveloperSeries(
  //     date: "1",
  //     developers: 400,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     date: "2",
  //     developers: 450,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.40,
          // child: DeveloperChart(data: data),
        ),
      ),
    );
  }
}

// class DeveloperChart extends StatelessWidget {
//   final List<ProfileChart> data;
//   const DeveloperChart({required this.data, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<ProfileChart, String>> series = [
//       charts.Series(
//           id: "developers",
//           data: data,
//           // labelAccessorFn: (DeveloperSeries series, _) =>
//           //     series.developers.toString(),
//           domainFn: (ProfileChart series, _) => series.date,
//           measureFn: (ProfileChart series, _) => series.profileVisit,
//           colorFn: (ProfileChart series, _) => series.barColor)
//     ];
//     return charts.BarChart(
//       series,
//       animate: true,
//       animationDuration: const Duration(seconds: 1),
//       domainAxis: const charts.OrdinalAxisSpec(
//         renderSpec: charts.SmallTickRendererSpec(
//           // Tick and Label styling here.
//           labelStyle: charts.TextStyleSpec(
//               fontSize: 15, // size in Pts.
//               color: charts.MaterialPalette.white),

//           // Change the line colors to match text color.
//           lineStyle: charts.LineStyleSpec(
//             color: charts.MaterialPalette.white,
//           ),
//         ),
//       ),
//       primaryMeasureAxis: const charts.NumericAxisSpec(
//         renderSpec: charts.GridlineRendererSpec(
//           // Tick and Label styling here.
//           labelStyle: charts.TextStyleSpec(
//             fontSize: 15, // size in Pts.
//             color: charts.MaterialPalette.white,
//           ),

//           // Change the line colors to match text color.
//           lineStyle: charts.LineStyleSpec(
//             color: charts.MaterialPalette.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProfileChart {
  final String date;
  final int profileVisit;
  final charts.Color barColor;

  ProfileChart(
      {required this.date, required this.profileVisit, required this.barColor});
}

class ProfileVisitChart extends StatelessWidget {
  final List<ProfileChart> profiledata;

  const ProfileVisitChart({required this.profiledata, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ProfileChart, String>> series = [
      charts.Series(
          id: "Profile Chart",
          data: profiledata,
          // labelAccessorFn: (DeveloperSeries series, _) =>
          //     series.developers.toString(),
          domainFn: (ProfileChart series, _) => series.date,
          measureFn: (ProfileChart series, _) => series.profileVisit,
          colorFn: (ProfileChart series, _) => series.barColor)
    ];
    return charts.BarChart(
      series,
      animate: true,
      animationDuration: const Duration(seconds: 1),
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // size in Pts.
            color: charts.MaterialPalette.white,
          ),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // size in Pts.
            color: charts.MaterialPalette.white,
          ),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
    );
  }
}

class ContactChart {
  final String date;
  final int contact;
  final charts.Color barColor;

  ContactChart(
      {required this.date, required this.contact, required this.barColor});
}

class ContactDownloadsChart extends StatelessWidget {
  final List<ContactChart> contactdata;

  const ContactDownloadsChart({required this.contactdata, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ContactChart, String>> contactSeries = [
      charts.Series(
          id: "Contact Chart",
          data: contactdata,
          // labelAccessorFn: (DeveloperSeries series, _) =>
          //     series.developers.toString(),
          domainFn: (ContactChart series, _) => series.date,
          measureFn: (ContactChart series, _) => series.contact,
          colorFn: (ContactChart series, _) => series.barColor)
    ];
    return charts.BarChart(
      contactSeries,
      animate: true,
      animationDuration: const Duration(seconds: 1),
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          // labelRotation: 90,
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // size in Pts.
            color: charts.MaterialPalette.white,
          ),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // size in Pts.
            color: charts.MaterialPalette.white,
          ),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
    );
  }
}
