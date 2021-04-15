import 'question.dart';

/// The QuizBrain holds the questions and their answers
class QuizBrain {
  int _questionNum = 0;
  final List<Question> _questionBank = <Question>[
    Question(questionText: 'My name is John.', questionAnswer: true),
    Question(questionText: 'I am 100 years old.', questionAnswer: false),
    Question(questionText: 'I have a dog.', questionAnswer: false),
    Question(questionText: 'I love Sana.', questionAnswer: true),
    Question(questionText: 'I am engaged.', questionAnswer: true),
    Question(questionText: 'The Earth is flat.', questionAnswer: false),
    Question(
        questionText: 'UH has a great Computer Science department.',
        questionAnswer: false),
    Question(questionText: '2 + 2 = 4.', questionAnswer: true),
  ];

  ///Moves the questionNum to the next question in the questionBank
  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  ///Checks to see if we are at the last question of the questionBank
  bool isLastQuestion() {
    return _questionNum == _questionBank.length - 1;
  }

  ///Returns the current question text
  String getQuestionText() {
    return _questionBank[_questionNum].questionText;
  }

  ///Returns the true or false answer to the current question
  bool getQuestionAns() {
    return _questionBank[_questionNum].questionAnswer;
  }

  ///Resets the questionNum to 0 bringing us back to the first question
  void reset() {
    _questionNum = 0;
  }
}
