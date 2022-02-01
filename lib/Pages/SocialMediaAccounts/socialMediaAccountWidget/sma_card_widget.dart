import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocailMediaAccountCard extends StatelessWidget {
  final String topImage;
  final VoidCallback cancel;
  final VoidCallback addMore;
  final Widget textFieldsColumn;
  final Color topLeftColor;
  final Color bottomRightColor;
  final int index;
  const SocailMediaAccountCard({
    required this.topImage,
    required this.cancel,
    required this.addMore,
    required this.textFieldsColumn,
    required this.topLeftColor,
    required this.bottomRightColor,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Stack(
        children: [
          Positioned(
            // left: 1,
            // top: 15,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.network(
                topImage,
                // 'assets/images/fb.png',
                height: 45,
                width: 170,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 33),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: kElevationToShadow[6],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    cancel();
                    // toggleSocialMediaSection('facebook');
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 1],
                          colors: [
                            topLeftColor,
                            bottomRightColor,
                            // Color(0xFF29417A),
                            // Color(0xFF395BAA),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.times,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                textFieldsColumn,
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 35,
                      // height: formbuttonheight,
                      // width: formbuttonwidth,
                      // padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient:
                            // index == 5
                            //     ? const LinearGradient(
                            //         begin: Alignment.topLeft,
                            //         end: Alignment.bottomRight,
                            //         stops: [0.4, 1],
                            //         colors: [
                            //           Color(0xFFececec),
                            //           Color(0xFFececec),
                            //         ],
                            //       )
                            //     :
                            LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.4, 1],
                          colors: [
                            topLeftColor,
                            bottomRightColor,
                            // Color(0xFF29417A),
                            // Color(0xFF395BAA),
                          ],
                        ),
                        // color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton.icon(
                        label: const Text(
                          'Add More',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        icon: const Icon(Icons.add, size: 17),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shape: const StadiumBorder(),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(30.0),
                          //   // side: BorderSide(
                          //   //   color: Colors.teal,
                          //   //   width: 2.0,
                          //   // ),
                          // ),
                          shadowColor: Colors.transparent,
                          primary: Colors.transparent,
                          // minimumSize: Size(
                          //   MediaQuery.of(context).size.width * 0.30,
                          //   MediaQuery.of(context).size.height * 0.030,
                          // ),
                          // minimumSize: const Size(100, 32),
                        ),
                        onPressed: () {
                          addMore();
                          // facebookUrls.add('');
                          // setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
