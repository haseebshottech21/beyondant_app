// import 'package:flutter/material.dart';

// class SaveContactDialogBox extends StatefulWidget {
//   const SaveContactDialogBox({Key? key}) : super(key: key);

//   @override
//   _SaveContactDialogBoxState createState() => _SaveContactDialogBoxState();
// }

// class _SaveContactDialogBoxState extends State<SaveContactDialogBox> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(10.0),
//         ),
//       ),
//       backgroundColor: AppColors.primaryColor,
//       title: Text(
//         widget.title,
//         style: const TextStyle(
//           color: Colors.white,
//         ),
//       ),
//       content: Container(
//         height: MediaQuery.of(context).size.height * 0.20,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 'Beyond Link Name',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.055,
//               child: TextFormField(
//                 controller: beyondLinkName,
//                 onChanged: (val) {
//                   widget.onChanged(val);
//                   setState(() {});
//                 },
//                 // textAlignVertical: TextAlignVertical.center,
//                 // textAlign: TextAlign.left,
//                 // validator: widget.validator,
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.all(10.0),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Color(0xFF000000)),
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   hintText: 'Beyond Link Name',
//                   hintStyle: const TextStyle(color: Colors.black54),
//                   // hintStyle: GoogleFonts.montserrat(color: Colors.black),
//                   // isDense: true,
//                   // helperText: 'Keep it short, this is just a demo.',
//                   // prefixIcon: Padding(
//                   //   padding: const EdgeInsets.only(left: 15),
//                   //   child: widget.prefixIcon,
//                   // ),
//                   prefixText: '  ',
//                   // suffixIcon: suffixIcon,
//                   // suffixText: 'USD',
//                   // suffixStyle: const TextStyle(color: Colors.green)),
//                 ),
//               ),
//             ),
//             // TextField(
//             //   controller: widget.firstcontroller,
//             //   decoration: const InputDecoration(
//             //     hintText: "Beyond Link Name",
//             //   ),
//             // ),
//             const Spacer(),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 'Select User Name',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Container(
//               // width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.055,
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(30),
//                 ),
//                 border: Border.all(color: Colors.grey, width: 1.5),
//               ),
//               child: DropdownSearch(
//                 mode: Mode.DIALOG,
//                 // items: dropdownItems,
//                 items: allBeyondSelectedUsers.map(
//                   (users) {
//                     return users['user_username'].toString();
//                   },
//                 ).toList(),
//                 // onChanged: (item) => print(item),
//                 onChanged: (val) {
//                   setState(
//                     () {
//                       _dropDownValue = val as String;
//                       // print(widget.dropdrownvalue);
//                     },
//                   );
//                   // print(_dropDownValue);
//                 },
//                 // selectedItem: ,
//                 dropDownButton: const Align(
//                   alignment: Alignment.centerRight,
//                   child: FaIcon(
//                     FontAwesomeIcons.caretDown,
//                     size: 15,
//                     color: Colors.black45,
//                   ),
//                 ),
//                 showSearchBox: true,
//                 searchFieldProps: TextFieldProps(
//                   keyboardType: TextInputType.name,
//                 ),
//                 dropdownSearchDecoration: const InputDecoration.collapsed(
//                   hintText: 'Select User',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text(
//             'CANCEL',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           onPressed: () {
//             if (beyondLinkName.text.isNotEmpty || beyondLinkName.text.isEmpty) {
//               beyondLinkName.text = '';
//               Navigator.pop(context);
//             }
//           },
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(),
//             shadowColor: Colors.transparent,
//             primary: Colors.black,
//             minimumSize: Size(
//               MediaQuery.of(context).size.width * 0.25,
//               MediaQuery.of(context).size.height * 0.050,
//             ),
//           ),
//           onPressed:
//               beyondLinkName.text.isEmpty ? null : createAllPersonalBeyondLink,
//           child: const Padding(
//             padding: EdgeInsets.only(
//               top: 5,
//               bottom: 5,
//             ),
//             child: Text(
//               'CREATE',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 // fontSize: 10.0,
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
