import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/google-sign-in-controller.dart';

class GetxGoggleLoginPage extends StatefulWidget {
  const GetxGoggleLoginPage({super.key});

  @override
  State<GetxGoggleLoginPage> createState() => _GetxGoggleLoginPageState();
}

class _GetxGoggleLoginPageState extends State<GetxGoggleLoginPage> {
  final GoogleSignInController googleController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  googleController.signInWithGoogle();
                },
                child: Container(
                  width: 300,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F4040),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/flat-color-icons_google.svg',
                        height: 50,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sign up with google",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
