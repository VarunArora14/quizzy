import 'package:flutter/material.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/screens/welcome/welcome.dart';

// ignore_for_file:  prefer_const_constructors
class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key, this.fscore = 0, this.totalques = 13})
      : super(key: key);

  final int fscore, totalques;
  @override
  Widget build(BuildContext context) {
    print(username);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_pic.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                "Congratulations 🎉🎊",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                username,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "$fscore/$totalques",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 3,
              ),
              InkWell(
                onTap: () {
                  var count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding * 0.75), //15
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Retry",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
