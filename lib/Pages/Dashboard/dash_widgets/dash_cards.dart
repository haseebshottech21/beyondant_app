import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashCards extends StatelessWidget {
  IconData dashIcon;
  String dashTitle;
  String dashData;
  DashCards(this.dashIcon, this.dashTitle, this.dashData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.18,
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.primaryColor.withOpacity(0.5),
        //     // spreadRadius: 5,
        //     blurRadius: 5,
        //     offset: const Offset(3, 5), // changes position of shadow
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: Colors.white,
              child: FaIcon(
                dashIcon,
                color: AppColors.primaryColor,
                size: 21,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dashTitle,
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  dashData,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerDashCard extends StatelessWidget {
  const ShimmerDashCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
