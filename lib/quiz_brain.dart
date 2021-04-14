import 'package:flutter/cupertino.dart';

import 'question.dart';

class QuizBrain {
  int _questionNum = 0;
  List<Question> _questionBank = [
    Question('My name is John.', true),
    Question('I am 100 years old.', false),
    Question('I have a dog.', false),
    Question('I love Sana.', true),
    Question('I am engaged.', true),
    Question('The Earth is flat.', false),
    Question('UH has a great Computer Science department.', false),
    Question('2 + 2 = 4.', true),
  ];

  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNum].questionText;
  }

  bool getQuestionAns() {
    return _questionBank[_questionNum].questionAnswer;
  }
}
