import 'package:flutter/material.dart';
import 'package:quizzy/constants.dart';
import 'package:get/get.dart';
import 'package:quizzy/screens/quiz/components/body.dart';

// ignore_for_file: prefer_const_constructors

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final myController = TextEditingController();

  void clearText() {
    myController.clear();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg"),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_pic.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2), // 2/6
                Text(
                  "Let's play Quiz",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text("Enter you Name below"),
                Spacer(), // 1/6
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Spacer(), // 1/6
                InkWell(
                  onTap: () {
                    username = myController.text;
                    clearText();
                    Get.to(Body());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), //15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Let's start the quiz",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(flex: 2), // 2/6 space
              ],
            ),
          ))
        ],
      ),
    );
  }
}
