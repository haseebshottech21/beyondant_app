import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(msg: message, fontSize: 18, timeInSecForIosWeb: 1);
}
