import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/view.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  ///SCROLL CONTROLLER
  final ScrollController scrollController = ScrollController();

  ///SIZE
  var width = 0.0;
  var height = 0.0;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureTextPassword = true;

  @override
  void initState() {
    super.initState();

    _emailController.text = "Admin";
    _passwordController.text = "123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: AppColors.loginBackgroundColor),
      width: width,
      height: height,
      child: Column(
        children: [
          const SizedBox(height: 35),
          Hero(
            tag: 'splash',
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 250,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: AutofillGroup(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey)
                          boxShadow: AppShadows.shadow1,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person_outlined,
                                  size: 24,
                                  color: AppColors.primaryLightBlue007BFF),
                            ),
                            SizedBox(
                              width: width * 0.6,
                              child: TextField(
                                enableSuggestions: true,
                                autofillHints: const <String>[
                                  AutofillHints.email
                                ],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  color: Colors.grey,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  labelText: "ABHA Address",
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  counterText: '',
                                ),
                                maxLength: 80,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey)
                          boxShadow: AppShadows.shadow1,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.vpn_key,
                                  size: 24,
                                  color: AppColors.primaryLightBlue007BFF),
                            ),
                            SizedBox(
                              width: width * 0.75,
                              child: TextField(
                                autofillHints: const [AutofillHints.password],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  color: Colors.grey,
                                ),
                                obscureText: _obscureTextPassword,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  border: InputBorder.none,
                                  counterText: '',
                                  suffix: InkWell(
                                    onTap: _togglePassword,
                                    child: Icon(
                                      _obscureTextPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                maxLength: 80,
                                controller: _passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Center(
            child: InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                width: width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryLightBlue007BFF),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Get.offAll(() => const DiscoverFulfillmentPage());
              },
            ),
          ),
        ],
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
