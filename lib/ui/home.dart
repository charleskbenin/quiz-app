import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBox = [
    Question.name("NPP a corrupt gov lskdj lsdh;aol o;hsf isdhfa", true),
    Question.name(
        "In the face of Islamic encroachment, \n the Ethiopian kings were ruthless in subduing the sultans along the Red Sea coast trade routes.",
        true),
    Question.name("Is NPP a corrupt gov", true),
    Question.name("Is NPP a corrupt gov", true)
  ];

  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red, Colors.yellow, Colors.green
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'images/flag.jpg',
                    width: 250,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: Colors.blueGrey.shade400,
                            style: BorderStyle.solid)),
                    height: 120,
                    child: Center(
                      child: Text(
                        questionBox[_currentQuestionIndex].questionText,
                        style: TextStyle(color: Colors.white, fontSize: 16.9),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.blueGrey.shade900,
                      child: Text('TRUE', style: TextStyle(color: Colors.white,),),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.blueGrey.shade900,
                      child: Text('FALSE', style: TextStyle(color: Colors.white,),),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_forward, color: Colors.white,),
                    )
                  ],
                ),
                Spacer()
              ],
            ),
          );
        },
      ),
    );
  }

  // Correct Answer
  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBox[_currentQuestionIndex].isCorrect){

      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text('Yes Correct!'));
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }else{
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text('Incorrect!'));
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint('Incorrect');
    }
  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBox.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
    // setState(() {
    //   _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBox.length;
    // });
  }
}
