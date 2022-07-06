// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'quizQues.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    home: Quizzler(),
  ));
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  int score = 0;
  Quiz gkquiz = Quiz();
  List<Icon> ansStatus = [];
  void checkAns(bool input) {
    if (input == gkquiz.checkValue()) {
      ansStatus.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      score++;
    } else {
      ansStatus.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    if (gkquiz.getquesno() == 13) {
      Alert(
              context: context,
              title: "Test Completed",
              desc: "You scored $score.")
          .show();
      ansStatus.clear();
      score = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    gkquiz.question(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        checkAns(true);
                      });
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        checkAns(false);
                      });
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
              )),
              Row(
                children: ansStatus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
