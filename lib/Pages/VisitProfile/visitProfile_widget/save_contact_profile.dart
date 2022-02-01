import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visitProfile_widget/save_contact_dialogbox.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:simple_vcard_parser/simple_vcard_parser.dart';

class SaveContactVisitProfile extends StatefulWidget {
  const SaveContactVisitProfile({Key? key}) : super(key: key);

  @override
  _SaveContactVisitProfileState createState() =>
      _SaveContactVisitProfileState();
}

class _SaveContactVisitProfileState extends State<SaveContactVisitProfile> {
  TextEditingController meetingController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  BeyondantAPI createApi = BeyondantAPI();

//   // VCard vc = VCard(myVCard);
//   if (await FlutterContacts.requestPermission()) {
//   // Get all contacts (lightly fetched)
//   List<Contact> contacts = await FlutterContacts.getContacts();

//   // Get all contacts (fully fetched)
//   contacts = await FlutterContacts.getContacts(
//       withProperties: true, withPhoto: true);

//   // Get contact with specific ID (fully fetched)
//   Contact contact = await FlutterContacts.getContact(contacts.first.id);

//   // Insert new contact
//   final newContact = Contact()
//     ..name.first = 'John'
//     ..name.last = 'Smith'
//     ..phones = [Phone('555-123-4567')];
//   await newContact.insert();

//   // Update contact
//   contact.name.first = 'Bob';
//   await contact.update();

//   // Delete contact
//   await contact.delete();

//   // Open external contact app to view/edit/pick/insert contacts.
//   await FlutterContacts.openExternalView(contact.id);
//   await FlutterContacts.openExternalEdit(contact.id);
//   final contact = await FlutterContacts.openExternalPick();
//   final contact = await FlutterContacts.openExternalInsert();

//   // Listen to contact database changes
//   FlutterContacts.addListener(() => print('Contact DB changed'));

//   // Export contact to vCard
//   String vCard = contact.toVCard();

//   // Import contact from vCard
//   contact = Contact.fromVCard('BEGIN:VCARD\n'
//       'VERSION:3.0\n'
//       'N:;Joe;;;\n'
//       'TEL;TYPE=HOME:123456\n'
//       'END:VCARD');
// }

  void myContactSaved() async {
    var formData = {
      'contact_meeting_location': meetingController.text,
      'contact_first_name': firstnameController.text,
      'contact_last_name': lastnameController.text,
      'contact_email': emailController.text,
      'contact_phone_number': contactController.text,
    };
    if (meetingController.text.isNotEmpty ||
        firstnameController.text.isNotEmpty ||
        lastnameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        contactController.text.isNotEmpty) {
      await createApi.createMyContact(
        '/user/v-card/mail/${await getSharedPrefenceValue(username)}',
        formData,
        context,
      );
      // widget.getTableData();
      // setState(() {});
      showToast('Contact has been created');
    } else {
      showToast('Input field cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton.icon(
          label: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Text('Save Contact'),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.solidSave,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () {
            // print('save contact');
            setState(() {
              meetingController.text = '';
              firstnameController.text = '';
              lastnameController.text = '';
              emailController.text = '';
              contactController.text = '';
            });
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return FadeInDown(
                      child: SaveContactDialogBox(
                        meetingController: meetingController,
                        firstnameController: firstnameController,
                        lastnameController: lastnameController,
                        emailController: emailController,
                        contactController: contactController,
                        onPressed: myContactSaved,
                      ),
                    );
                  },
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
