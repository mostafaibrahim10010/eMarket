import 'package:dio/dio.dart';
import 'package:emarket/Utils/requests_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/screen_strings.dart';
import '../Widgets/myTextField.dart';
import 'Home Screens/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.green));

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.green));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        hint: "Full Name",
                        inputType: TextInputType.name,
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 10,
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
                        isPassword: false,
                        hint: "Phone Number",
                        inputType: TextInputType.phone,
                        controller: numberController,
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
                        height: 10,
                      ),
                      MYTextFields(
                        isPassword: true,
                        hint: "Confirm Password",
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 70,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              dioRegister();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.green,
                                textStyle: const TextStyle(fontSize: 20)),
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ]))));
  }

  void dioRegister() async {
    try {
      var response = await Dio().post(registerRequest, data: {
        "name": nameController.text,
        "email": emailController.text,
        "number": numberController.text,
        "password": passwordController.text,
        "password_repeat": confirmPasswordController.text
      });
      if (response.statusCode == 201) {
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
