import 'package:beyondant_new_app/Pages/Login/login.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setSharedPrefenceValue(String key, dynamic value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

Future<dynamic> getSharedPrefenceValue(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString(key);
}

Future<List<String>?> getListSharedPrefenceValue(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getStringList(key);
}

Future<void> checkTokenExipre(
    BuildContext context, VoidCallback getResponse) async {
  // print(await getSharedPrefenceValue(refreshToken));
  if (await getSharedPrefenceValue(refreshToken) != null) {
    await setSharedPrefenceValue(
        token, await getSharedPrefenceValue(refreshToken));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(refreshToken);
    // await getDashboard();
    getResponse();

    print('refresh token is set to token');
    // print('Token : ${await getSharedPrefenceValue(token)}');
    // print('RefreshToken : ${await getSharedPrefenceValue(refreshToken)}');
  } else if (await getSharedPrefenceValue(refreshToken) == null) {
    print('Token Expire');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(token);
    sharedPreferences.remove(refreshToken);
    sharedPreferences.remove(username);
    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.routeName,
      (route) => false,
    );

    showToast('You have been Logout');
    // print(response.body);
  }
}
