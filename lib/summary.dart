import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.dataSummary, {super.key});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(BuildContext context) {
    var myColor  = Colors.blue;
    return SizedBox(
      height: 300,
      width: 280,
      child: SingleChildScrollView(
        child: Column(
          children: dataSummary.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Container(
                   height: 40,
                   width: 40,
                   alignment: Alignment.topLeft,
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  decoration: BoxDecoration(
                    color: myColor,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text(
                    (data['question_index'] as int).toString(),
                    //textDirection: TextDirection.ltr,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['your_answer'] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['correct_ans'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
