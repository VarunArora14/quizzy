import 'package:flutter/material.dart';
import 'quizzy_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore_for_file: prefer_const_constructors

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        // show alert saying reached end of quiz
        Alert(
          context: context,
          title: 'Game Over!',
          desc: 'Thanks for playing. Your score is ${quizBrain.score}/13',
          buttons: [
            DialogButton(
              child: Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(116, 116, 191, 1),
                  Color.fromRGBO(52, 138, 199, 1.0)
                ],
              ),
            ),
          ],
        ).show();

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questions[qno],
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                // user defined working
                // bool correctAnswer = answers[qno];
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                // user defined working
                // bool correctAnswer = answers[qno];
                checkAnswer(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */

// import 'package:flutter/material.dart';
// //TODO: Step 2 - Import the rFlutter_Alert package here.
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'quizzy_brain.dart';

// QuizBrain quizBrain = QuizBrain();

// void main() => runApp(Quizzler());

// class Quizzler extends StatelessWidget {
//   const Quizzler({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuizPage extends StatefulWidget {
//   const QuizPage({Key? key}) : super(key: key);
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [];

//   void checkAnswer(bool userPickedAnswer) {
//     bool correctAnswer = quizBrain.getAnswer();

//     setState(() {
//       //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
//       //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
//       if (quizBrain.isFinished() == true) {
//         //TODO Step 4 Part A - show an alert using rFlutter_alert,

//         //This is the code for the basic alert from the docs for rFlutter Alert:
//         //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

//         //Modified for our purposes:
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();

//         //TODO Step 4 Part C - reset the questionNumber,
//         quizBrain.reset();

//         //TODO Step 4 Part D - empty out the scoreKeeper.
//         scoreKeeper = [];
//       }

//       //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
//       else {
//         if (userPickedAnswer == correctAnswer) {
//           scoreKeeper.add(Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//         } else {
//           scoreKeeper.add(Icon(
//             Icons.close,
//             color: Colors.red,
//           ));
//         }
//         quizBrain.nextQuestion();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizBrain.getQuestion(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextButton(
//               child: Text(
//                 'True',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               onPressed: () {
//                 // user defined working
//                 // bool correctAnswer = answers[qno];
//                 checkAnswer(true);
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.green,
//               ),
//             ),
//             // FlatButton(
//             //   textColor: Colors.white,
//             //   color: Colors.green,
//             //   child: Text(
//             //     'True',
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //       fontSize: 20.0,
//             //     ),
//             //   ),
//             //   onPressed: () {
//             //     //The user picked true.
//             //     checkAnswer(true);
//             //   },
//             // ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextButton(
//               child: Text(
//                 'False',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               onPressed: () {
//                 // user defined working
//                 // bool correctAnswer = answers[qno];
//                 checkAnswer(false);
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         )
//       ],
//     );
//   }
// }

