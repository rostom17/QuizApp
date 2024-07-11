import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/flutter_logo_2.png',
            width: 150,
            color: const Color.fromARGB(71, 242, 246, 246),
          ),
          const SizedBox(height: 40,),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40,),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.not_started),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}