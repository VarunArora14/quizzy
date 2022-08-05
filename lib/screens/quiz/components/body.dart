import 'package:flutter/material.dart';
import 'package:quizzy/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:get/get.dart';
import '../../score/scores.dart';
import '../../../quizzy_brain.dart';

// ignore_for_file: prefer_const_constructors

QuizBrain quizBrain = QuizBrain();

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Icon> scorekeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        if (correctAnswer == userAnswer) {
          quizBrain.score++;
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        // show alert saying reached end of quiz
        // Replace this Alert with a final screen
        Get.to(
          ScoreScreen(
            fscore: quizBrain.score,
            totalques: quizBrain.queslen(),
          ),
        );
        // Alert(
        //   context: context,
        //   title: 'Game Over!',
        //   desc:
        //       'Thanks for playing. Your score is ${quizBrain.score}/${quizBrain.queslen()}',
        //   buttons: [
        //     DialogButton(
        //       child: Text(
        //         'Retry',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 18,
        //         ),
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       gradient: const LinearGradient(
        //         colors: [
        //           Color.fromRGBO(116, 116, 191, 1),
        //           Color.fromRGBO(52, 138, 199, 1.0)
        //         ],
        //       ),
        //     ),
        //   ],
        // ).show();

        quizBrain.reset();
        scorekeeper = [];
      } else {
        if (correctAnswer == userAnswer) {
          quizBrain.score++;
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg_pic.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              ),
              SizedBox(
                height: kDefaultPadding * 3,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Question ${quizBrain.quesnum() + 1}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${quizBrain.queslen()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: kDefaultPadding * 3,
              ),
              // QuestionCard(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        quizBrain.getQuestion(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: kBlackColor),
                      ),
                      SizedBox(
                        height: kDefaultPadding * 3,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      TextButton(
                        onPressed: () {
                          checkAnswer(true);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: kDefaultPadding),
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreenColor
                                // _truePressed ? kRedColor : kGrayColor
                                ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "True",
                                style:
                                    TextStyle(color: kGreenColor, fontSize: 16),
                              ),
                              //   Container(
                              //     height: 26,
                              //     width: 26,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50),
                              //       border: Border.all(color: kGreenColor),
                              //     ),
                              //   )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          checkAnswer(false);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: kDefaultPadding),
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            border: Border.all(color: kRedColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "False",
                                style:
                                    TextStyle(color: kRedColor, fontSize: 16),
                              ),
                              // Container(
                              //   height: 26,
                              //   width: 26,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(50),
                              //     border: Border.all(color: kRedColor),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: scorekeeper,
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
