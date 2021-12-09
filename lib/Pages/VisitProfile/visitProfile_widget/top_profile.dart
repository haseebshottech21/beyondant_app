import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';

class TopVisitProfile extends StatelessWidget {
  final Map profileData;
  const TopVisitProfile({
    required this.profileData,
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
              boxShadow: kElevationToShadow[6],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  profileData['user_profile_picture'].toString() == 'null'
                      ? 'https://app.beyondant.com/static/media/placeholder.672540c4.png'
                      : baseUrlImage +
                          profileData['user_profile_picture'].toString(),
                  // 'https://app.beyondant.com/static/media/placeholder.672540c4.png',
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
                if (profileData['company_details'] == '')
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 20,
                    ),
                    child: Text(
                      profileData['user_first_name'].toString() +
                          '\n' +
                          profileData['user_last_name'].toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (profileData['company_details'] != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      profileData['user_first_name'].toString() +
                          ' ' +
                          profileData['user_last_name'].toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 5,
                ),
                if (profileData['company_details'] != '')
                  Container(
                    height: 85,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      profileData['company_details'].toString(),
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
