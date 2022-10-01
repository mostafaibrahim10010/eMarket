import 'package:dio/dio.dart';
import 'package:emarket/Screens/Home%20Screens/home.dart';
import 'package:emarket/Screens/register.dart';
import 'package:emarket/Utils/requests_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/screen_strings.dart';
import '../Widgets/myTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.green));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 180,
              child: Image.asset(logo),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 50),
              child: Text(
                "eMarket",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MYTextFields(
              isPassword: false,
              hint: "Email",
              inputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MYTextFields(
              isPassword: true,
              hint: "Password",
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    dioLogin();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: Colors.green,
                      textStyle: const TextStyle(fontSize: 20)),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "------- Or Login With -------",
                style: TextStyle(color: Colors.green),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/gmail.png",
                          height: 30.0,
                        ),
                      ),
                      onTap: () {
                        //signInWithGoogle();
                      },
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/facebook.png",
                          height: 30.0,
                        ),
                      ),
                      onTap: () {
                        //signInWithFacebook();
                      },
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/instagram.png",
                          height: 30.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet ?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  child: const Text(" Sign Up",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignUpScreen()));
                  },
                ),
              ],
            ),
          ]),
        )));
  }

  void dioLogin() async {
    try {
      var response = await Dio().post(loginRequest, data: {
        "email": emailController.text,
        "password": passwordController.text
      });
      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const Home(),
        ));
      } else {
        print("Error");
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
