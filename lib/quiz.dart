
import 'package:flutter/material.dart';
import 'package:image_and_button/dummy_data/questions.dart';
import 'package:image_and_button/question_screen.dart';
import 'package:image_and_button/result_screen.dart';
import 'package:image_and_button/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAns = [];
  var activeScreen = 1;

  void chooseAns(String ans){
    selectedAns.add(ans);
    if(selectedAns.length == questions.length){
      setState(() {
        activeScreen = 3;
      });
    }
  }

  void switchScreen(){
    setState(() {
      activeScreen = 2;
    });
  }

  void reStartQuiz(){
    setState(() {
      selectedAns = [];
      activeScreen = 2;
    });
  }

  @override
  Widget build(context) {

    Widget curScreen = StartScreen(switchScreen);
    if(activeScreen == 1){
      curScreen = StartScreen(switchScreen);
    }
    else if(activeScreen == 2){
      curScreen  = QuestionScreen(onSlecetAns: chooseAns);
    }
    else{
      curScreen =  ResultScreen(choosenAns: selectedAns, onSelectRestart: reStartQuiz, );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: curScreen,
        ),
      ),
    );
  }
}
