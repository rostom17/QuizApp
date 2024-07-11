import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
   const AnswerButton({super.key,required this.txt,required this.onTap,});

   final String txt;
   final void Function() onTap;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
        child: Text(txt,textAlign: TextAlign.center,),);
  }
}