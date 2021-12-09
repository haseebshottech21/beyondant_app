import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

Widget getBusinessCards(
  int index,
  String text,
  int selectItem,
  Function() onTap,
  BuildContext context,
) {
  return GestureDetector(
    onTap: onTap,
    // () {
    // setState(() {
    //   selectItem = index;
    //   // print(selectItem);
    // });
    // },
    child: FadeInUp(
      delay: Duration(milliseconds: index * 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: AnimatedContainer(
          // height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.60,
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 0.3,
            vertical: 0.3,
          ),
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color:
                  selectItem == index ? AppColors.primaryColor : Colors.white,
              width: selectItem == index ? 2.5 : 0.5,
            ),
            boxShadow: [
              selectItem == index
                  ? BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 5),
                      blurRadius: 5,
                      spreadRadius: 0,
                    )
                  : BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 5),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                  borderRadius: selectItem == index
                      ? BorderRadius.circular(17)
                      : BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade500,
                      offset: const Offset(0, 0),
                      blurRadius: 0,
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfxX8Vt6qkvzP3ChqHyWoOq-PXfIeifE8-Pw&usqp=CAU',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: selectItem == index
                      ? Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                          size: 30,
                        )
                      : const Text(''),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: Row(
          //   children: [
          //     selectItem == index
          //         ? Image.network(
          //             item[index]['back-img'],
          //             width: 50,
          //           )
          //         : Image.network(
          //             item[index]['back-img'],
          //             width: 50,
          //           ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Expanded(
          //       child: Text(
          //         item[index]['description'],
          //       ),
          //     ),
          //     Icon(
          //       Icons.check_circle,
          //       color: selectItem == index
          //           ? Colors.blue
          //           : Colors.white,
          //     )
          //   ],
          // ),
        ),
      ),
    ),
  );
}

// class BeyondBuisnessCards extends StatefulWidget {
//   int index;
//   String text;
//   BeyondBuisnessCards({required this.index, required this.text, Key? key})
//       : super(key: key);

//   @override
//   State<BeyondBuisnessCards> createState() => _BeyondBuisnessCardsState();
// }

// class _BeyondBuisnessCardsState extends State<BeyondBuisnessCards> {
//   int selectItem = -1;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectItem = widget.index;
//           // print(selectItem);
//         });
//       },
//       child: FadeInUp(
//         delay: Duration(milliseconds: widget.index * 100),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           child: AnimatedContainer(
//             // height: MediaQuery.of(context).size.height * 0.45,
//             width: MediaQuery.of(context).size.width * 0.60,
//             margin: const EdgeInsets.only(left: 10),
//             padding: const EdgeInsets.symmetric(
//               horizontal: 0.3,
//               vertical: 0.3,
//             ),
//             duration: const Duration(milliseconds: 300),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: selectItem == widget.index
//                     ? AppColors.primaryColor
//                     : Colors.white,
//                 width: selectItem == widget.index ? 2.5 : 0.5,
//               ),
//               boxShadow: [
//                 selectItem == widget.index
//                     ? BoxShadow(
//                         color: Colors.grey.shade500,
//                         offset: const Offset(0, 5),
//                         blurRadius: 5,
//                         spreadRadius: 0,
//                       )
//                     : BoxShadow(
//                         color: Colors.grey.shade500,
//                         offset: const Offset(0, 5),
//                         blurRadius: 5,
//                         spreadRadius: 0,
//                       ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.80,
//                   height: MediaQuery.of(context).size.height * 0.17,
//                   decoration: BoxDecoration(
//                     borderRadius: selectItem == widget.index
//                         ? BorderRadius.circular(17)
//                         : BorderRadius.circular(19),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.blueGrey.shade500,
//                         offset: const Offset(0, 0),
//                         blurRadius: 0,
//                       ),
//                     ],
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfxX8Vt6qkvzP3ChqHyWoOq-PXfIeifE8-Pw&usqp=CAU',
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 10,
//                   ),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: selectItem == widget.index
//                         ? Icon(
//                             Icons.check_circle,
//                             color: AppColors.primaryColor,
//                             size: 30,
//                           )
//                         : const Text(''),
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     width: MediaQuery.of(context).size.width * 0.20,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12.0),
//                         bottomRight: Radius.circular(12.0),
//                       ),
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20),
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(
//                         widget.text,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // child: Row(
//             //   children: [
//             //     selectItem == index
//             //         ? Image.network(
//             //             item[index]['back-img'],
//             //             width: 50,
//             //           )
//             //         : Image.network(
//             //             item[index]['back-img'],
//             //             width: 50,
//             //           ),
//             //     const SizedBox(
//             //       width: 20,
//             //     ),
//             //     Expanded(
//             //       child: Text(
//             //         item[index]['description'],
//             //       ),
//             //     ),
//             //     Icon(
//             //       Icons.check_circle,
//             //       color: selectItem == index
//             //           ? Colors.blue
//             //           : Colors.white,
//             //     )
//             //   ],
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }
