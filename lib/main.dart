import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzler',
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

///The True/False Quiz Page
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = <Icon>[];
  int correctCount = 0;
  int incorrectCount = 0;

  void checkAnswer({bool userAnswer}) {
    final bool correctAnswer = quizBrain.getQuestionAns();
    setState(() {
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        correctCount++;
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
        incorrectCount++;
      }
      if (quizBrain.isLastQuestion()) {
        //alert dialog for finishing the quiz
        Alert(
          context: context,
          type: AlertType.success,
          style: AlertStyle(
            backgroundColor: Colors.grey[800],
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.green[600],
              ),
            ),
            titleStyle: const TextStyle(
              color: Colors.white,
            ),
            descStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          title: 'You Finished!',
          desc: 'Correct: $correctCount\nIncorrect: $incorrectCount',
          closeIcon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          closeFunction: () {
            setState(() {
              scoreKeeper.clear();
              quizBrain.reset();
            });
            Navigator.pop(context);
          },
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  scoreKeeper.clear();
                  quizBrain.reset();
                });
                Navigator.pop(context);
              },
              color: Colors.green[600],
              width: 120,
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green[600],
                ),
                onPressed: () {
                  checkAnswer(userAnswer: true);
                },
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  checkAnswer(userAnswer: false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}
