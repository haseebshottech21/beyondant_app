import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDropDownField extends StatefulWidget {
  String hintText;
  List<String> dropdownItems;
  // String onChange;
  void Function(String?)? onChanged;
  SearchDropDownField({
    required this.hintText,
    required this.dropdownItems,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _SearchDropDownFieldState createState() => _SearchDropDownFieldState();
}

class _SearchDropDownFieldState extends State<SearchDropDownField> {
  // String cardBox = 'Abc';

  // void getDropDownItem() {
  //   setState(() {
  //     widget.cardBox = widget.onChange;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.055,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        items: widget.dropdownItems,
        // items: createDeviceUsers.map(
        //   (users) {
        //     return users['user_username'].toString();
        //   },
        // ).toList(),
        onChanged: (widget.onChanged),
        // onChanged: (val) {
        //   // getDropDownItem();
        //   // widget.getValue;
        //   setState(
        //     () {
        //       widget.onChange = val.toString();
        //     },
        //   );
        //   // print(val);
        // },
        // selectedItem: widget.onChange,
        dropDownButton: const Align(
          alignment: Alignment.centerRight,
          child: FaIcon(
            FontAwesomeIcons.caretDown,
            size: 15,
            color: Colors.black45,
          ),
        ),
        showSearchBox: true,
        dropdownSearchDecoration: InputDecoration.collapsed(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

Container searchDropdownField(
    BuildContext context, String hintText, List<String> dropdownItems) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.055,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      border: Border.all(color: Colors.grey, width: 1.5),
    ),
    child: DropdownSearch(
      mode: Mode.BOTTOM_SHEET,
      items: dropdownItems,
      // items: createDeviceUsers.map(
      //   (users) {
      //     return users['user_username'].toString();
      //   },
      // ).toList(),
      // onChanged: (item) => print(item),
      onChanged: (val) {
        // setState(
        //   () {
        //     onChange = val as String;
        //     // print(widget.dropdrownvalue);
        //   },
        // );
        // print(val);
      },
      // selectedItem: ,
      dropDownButton: const Align(
        alignment: Alignment.centerRight,
        child: FaIcon(
          FontAwesomeIcons.caretDown,
          size: 15,
          color: Colors.black45,
        ),
      ),
      showSearchBox: true,
      dropdownSearchDecoration: InputDecoration.collapsed(
        hintText: hintText,
      ),
    ),
  );
}


// createDeviceTypes.isEmpty
//     ? const Center(child: CircularProgressIndicator())
//     : Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 0.055,
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.shade700),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton(
//             hint: selectDevice == null
//                 ? const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Text(
//                       'Device Type Name',
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   )
//                 : Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Text(
//                       selectDevice!,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 15.0,
//                       ),
//                     ),
//                   ),
//             // value:
//             isExpanded: true,
//             iconSize: 25.0,
//             icon: const Icon(
//               Icons.arrow_drop_down,
//               color: Colors.black45,
//             ),
//             itemHeight: 100.0,
//             // menuMaxHeight: 300.0,
//             style: const TextStyle(color: Colors.black54),
//             items: createDeviceTypes.map(
//               (devices) {
//                 return DropdownMenuItem<String>(
//                   value: devices['device_type_name'],
//                   child: Text(devices['device_type_name']),
//                 );
//               },
//             ).toList(),
//             onChanged: (val) {
//               setState(
//                 () {
//                   selectDevice = val as String;
//                   // print(widget.dropdrownvalue);
//                 },
//               );
//               print(selectDevice);
//             },
//           ),
//         ),
//       ),