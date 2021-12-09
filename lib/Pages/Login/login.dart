import 'package:beyondant_new_app/API/authentication.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_logo.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_widgets/login_form_button.dart';
import 'login_widgets/login_form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isLoading = false;

  Authentication loginBeyond = Authentication();

  void login() async {
    setState(() {
      isLoading = true;
    });
    var formData = {
      'user_username': emailController.text,
      'user_password': passController.text,
    };
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      await loginBeyond.loginBeyondant('/sign-in', formData, context);
    } else {
      Fluttertoast.showToast(
        msg: 'Input field cannot be empty',
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    const BeyondantLogo(),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                          letterSpacing: 0.5),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'TO YOUR ACCOUNT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Form(
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            UserFormField(
                              emailController,
                              'Enter Username or Email',
                              Icon(
                                FontAwesomeIcons.solidEnvelopeOpen,
                                color: AppColors.primaryColor,
                                size: 20.0,
                              ),
                              (value) {
                                if (value!.isNotEmpty && value != null) {
                                  return null;
                                } else {
                                  return 'Please enter valid Username or Email';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PasswordFormField(
                              passController,
                              'Enter Password',
                              Icon(
                                FontAwesomeIcons.qrcode,
                                color: AppColors.primaryColor,
                                size: 20.0,
                              ),
                              (value) {
                                if (value!.isNotEmpty && value != null) {
                                  return null;
                                } else {
                                  return 'Please enter vaild Password';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            LoginFormButton(
                              isLoading: isLoading,
                              onClick: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  login();
                                }
                                // showToast();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
