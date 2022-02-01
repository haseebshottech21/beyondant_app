import 'package:flutter/material.dart';

class UserVisitTopProfile extends StatelessWidget {
  final String userProfilePic;
  final String fullName;
  final String jobTitle;
  final String companyDetail;
  const UserVisitTopProfile({
    required this.userProfilePic,
    required this.fullName,
    required this.jobTitle,
    required this.companyDetail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              // boxShadow: kElevationToShadow[2],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  userProfilePic,
                  // profileData['user_profile_picture'].toString() == 'null'
                  //     ? 'https://app.beyondant.com/static/media/placeholder.672540c4.png'
                  //     : baseUrlImage +
                  //         profileData['user_profile_picture'].toString(),
                  // 'https://app.beyondant.com/static/media/placeholder.672540c4.png',
                  // widget.coverImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                // if (fullName != 'null')
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    // vertical: 5,
                  ),
                  child: Text(
                    fullName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (jobTitle != 'null')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      jobTitle,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (companyDetail != 'null')
                  Container(
                    // height: 75,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      // profileData['company_details'].toString(),
                      companyDetail,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
