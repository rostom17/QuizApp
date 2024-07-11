import 'package:flutter/material.dart';
import 'package:image_and_button/dummy_data/questions.dart';
import 'package:image_and_button/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAns});

  final List<String> choosenAns;

  List<Map<String,Object>>  getSummaryData(){
    final List<Map<String,Object>>summary =[];

    for(int i=0; i<choosenAns.length;i++){
      summary.add(
        {
          'question_index' : i + 1,
          'question' : questions[i].text,
          'correct_ans' : questions[i].answers[0],
          'your_answer': choosenAns[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalQuestion = questions.length;
    final totalCorrectAns =summary.where((data){
      return data['your_answer'] == data['correct_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $totalCorrectAns out of $totalQuestion question correctly",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Summary(summary),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
