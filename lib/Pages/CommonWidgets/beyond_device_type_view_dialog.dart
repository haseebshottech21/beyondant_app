import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class DeviceTypeAlertViewDialog extends StatefulWidget {
  final String title;
  final String deviceTypeId;
  final String deviceName;
  final String deviceStatus;
  const DeviceTypeAlertViewDialog({
    required this.title,
    required this.deviceTypeId,
    required this.deviceName,
    required this.deviceStatus,
    Key? key,
  }) : super(key: key);

  @override
  _DeviceTypeAlertViewDialogState createState() =>
      _DeviceTypeAlertViewDialogState();
}

class _DeviceTypeAlertViewDialogState extends State<DeviceTypeAlertViewDialog> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      // animate: true,
      // duration: Duration(milliseconds: 500),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              deviceTypeView('Device Type Id', widget.deviceTypeId),
              const Divider(
                color: Colors.black26,
              ),
              deviceTypeView('Device Type Name', widget.deviceName),
              const Divider(
                color: Colors.black26,
              ),
              deviceTypeView(
                  'Current Status Of Device Type', widget.deviceStatus),
            ],
          ),
        ),
      ),
    );
  }
}

Column deviceTypeView(
  String title,
  String detail,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        detail,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    ],
  );
}
