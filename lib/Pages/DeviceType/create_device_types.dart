import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'devicetypes_widgets/devicetype_dialog_box.dart';

class CreateBeyonDeviceTypes extends StatefulWidget {
  final VoidCallback getDeviceTypeTable;
  const CreateBeyonDeviceTypes({Key? key, required this.getDeviceTypeTable})
      : super(key: key);

  @override
  _CreateBeyonDeviceTypesState createState() => _CreateBeyonDeviceTypesState();
}

class _CreateBeyonDeviceTypesState extends State<CreateBeyonDeviceTypes> {
  var deviceTypeName = TextEditingController();
  var deviceTypeSlug = TextEditingController();

  BeyondantAPI createApi = BeyondantAPI();

  void createDeviceTypes() async {
    var formData = {
      'device_type_name': deviceTypeName.text,
      'device_type_slug': deviceTypeName.text,
    };

    if (deviceTypeName.text.length > 3) {
      await createApi.createDeviceTypes(
        '/device-types/create',
        formData,
        context,
      );
      if (deviceTypeName.text.isNotEmpty || deviceTypeName.text.isEmpty) {
        deviceTypeName.text = '';
      }
      widget.getDeviceTypeTable();
      setState(() {});
    } else if (deviceTypeName.text.isEmpty) {
      showToast(
        'Input field cannot be empty',
      );
    } else {
      showToast(
        'Device Name must be 3 words',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return FadeInDown(
              child: CreateDeviceTypeDialog(
                title: 'Create Device Types',
                firstcontroller: deviceTypeName,
                secondcontroller: deviceTypeName,
                onPressed: () {
                  createDeviceTypes();
                },
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.add_box,
        color: AppColors.primaryColor,
        size: 30.0,
      ),
    );
  }
}
