// ignore_for_file: const_constructor
class Question {
  String questionText = '';
  bool quesAnswer = false;

  Question(String q, bool a) {
    questionText = q;
    quesAnswer = a;
  }
}
