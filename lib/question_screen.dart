import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_and_button/answer_button.dart';
import 'package:image_and_button/dummy_data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSlecetAns});

  final void Function(String answer) onSlecetAns;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int curQusIdx  = 0;
  void nextQuestion(String selectedAns){
    widget.onSlecetAns(selectedAns);
    setState(() {
      curQusIdx =curQusIdx + 1;
      // if(curQusIdx > 5){
      //   curQusIdx = 1;
      // }
    });

  }

  @override
  Widget build(context) {
    final curQusion = questions[curQusIdx];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(curQusion.text,
              style: GoogleFonts.roboto(
                color: Colors.yellow,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...curQusion.answers.map((answer){
              return  AnswerButton(
                txt: answer,
                onTap: (){
                  nextQuestion(answer);
                },
              );
            },),
          ],
        ),
      ),
    );
  }
}
