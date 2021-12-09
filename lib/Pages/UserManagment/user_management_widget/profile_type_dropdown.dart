import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTypeDropDown extends StatefulWidget {
  String hintText;
  List<String> dropdownItems;
  void Function(String?)? onChanged;
  ProfileTypeDropDown({
    Key? key,
    required this.hintText,
    required this.dropdownItems,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ProfileTypeDropDownState createState() => _ProfileTypeDropDownState();
}

class _ProfileTypeDropDownState extends State<ProfileTypeDropDown> {
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
        showSearchBox: false,
        dropdownSearchDecoration: InputDecoration.collapsed(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

class ProfileRoleDropDown extends StatefulWidget {
  String hintText;
  List<String> dropdownItems;
  void Function(String?)? onChanged;
  ProfileRoleDropDown({
    required this.hintText,
    required this.dropdownItems,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileRoleDropDownState createState() => _ProfileRoleDropDownState();
}

class _ProfileRoleDropDownState extends State<ProfileRoleDropDown> {
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
        showSearchBox: false,
        dropdownSearchDecoration: InputDecoration.collapsed(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
