// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:fravia_app/providers/gamePage_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  double? _customHeight, _customWidth;
  GamePageProvider? _pageProvider;
  GamePage({
    super.key,
    required this.difficultyLevel,
  });
  final difficultyLevel;

  @override
  Widget build(BuildContext context) {
    _customHeight = MediaQuery.of(context).size.height;
    _customWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => GamePageProvider(
        context: context,
        difficultyLevel: difficultyLevel,
      ),
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return Builder(builder: (context) {
      _pageProvider = context.watch<GamePageProvider>();
      if (_pageProvider!.questions != null) {
        return Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: _customHeight! * 0.05),
            child: gameUI(),
          )),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        questionText(),
        Column(
          children: [
            selectTRUEButton(),
            const SizedBox(
              height: 15,
            ),
            selectFALSEButton(),
          ],
        ),
      ],
    );
  }

  Widget questionText() {
    return Text(
      _pageProvider!.getQuestion(),
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  //-----------------------------Select Button
  Widget selectTRUEButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.anserQuestion('True');
      },
      color: Colors.green,
      height: _customHeight! * 0.08,
      minWidth: _customWidth! * 85,
      child: const Text(
        'True',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget selectFALSEButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.anserQuestion('False');
      },
      color: Colors.red,
      height: _customHeight! * 0.08,
      minWidth: _customWidth! * 85,
      child: const Text(
        'False',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
