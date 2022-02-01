import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDropDownField extends StatefulWidget {
  final String hintText;
  final List<String> dropdownItems;
  final Mode mode;
  final double? maxHeight;
  // String onChange;
  final void Function(String?)? onChanged;
  const SearchDropDownField({
    required this.hintText,
    required this.dropdownItems,
    required this.mode,
    required this.onChanged,
    this.maxHeight = null,
    Key? key,
  }) : super(key: key);

  @override
  _SearchDropDownFieldState createState() => _SearchDropDownFieldState();
}

class _SearchDropDownFieldState extends State<SearchDropDownField> {
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
        maxHeight: widget.maxHeight,
        // mode: Mode.MENU,
        mode: widget.mode,
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
