// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int maxQuestion = 10;
  BuildContext context;
  GamePageProvider({
    required this.context,
  }) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    getQuestionfromAPI();
    print('object');
  }

  Future<void> getQuestionfromAPI() async {
    var response = await _dio.get('', queryParameters: {
      "amount": maxQuestion,
      "type": "boolean",
      "difficulty": "easy"
    });
    var data = json.decode(response.toString());
    print(data);
  }
}
