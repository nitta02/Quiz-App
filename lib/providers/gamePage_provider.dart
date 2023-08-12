// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int maxQuestion = 10;
  List? questions;
  BuildContext context;
  int currentQuestionIndex = 0;
  int correctanswerCount = 0;

  GamePageProvider({
    required this.context,
  }) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    getQuestionfromAPI();
    // print('object');
  }

  Future<void> getQuestionfromAPI() async {
    var response = await _dio.get('', queryParameters: {
      "amount": maxQuestion,
      "type": "boolean",
      "difficulty": "easy"
    });
    var data = json.decode(response.toString());
    print(data);
    questions = data["results"];
    notifyListeners();
  }

  String getQuestion() {
    return questions![currentQuestionIndex]["question"];
  }

  void anserQuestion(String answer) async {
    bool isCorrect =
        questions![currentQuestionIndex]["correct_answer"] == answer;
    correctanswerCount += isCorrect ? 1 : 0;

    currentQuestionIndex++;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          title: Icon(
            isCorrect ? Icons.check_circle : Icons.cancel_sharp,
            color: Colors.white,
          ),
        );
      },
    );
    await Future.delayed(const Duration(
      seconds: 1,
    ));
    Navigator.pop(context);
    if (currentQuestionIndex == maxQuestion) {
      finishQuestion();
    } else {
      notifyListeners();
    }
  }

  Future<void> finishQuestion() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: const Text(
            'Finish',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 25,
            ),
          ),
          content: Text('Score : $correctanswerCount/$maxQuestion'),
        );
      },
    );
    await Future.delayed(const Duration(
      seconds: 2,
    ));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
