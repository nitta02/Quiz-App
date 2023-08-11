// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:fravia_app/providers/gamePage_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  double? _customHeight, _customWidth;
  GamePageProvider? _pageProvider;
  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    _customHeight = MediaQuery.of(context).size.height;
    _customWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => GamePageProvider(context: context),
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return Builder(builder: (context) {
      _pageProvider = context.watch<GamePageProvider>();
      return Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: _customHeight! * 0.05),
          child: gameUI(),
        )),
      );
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
    return const Text(
      'Question 1',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  //-----------------------------Select Button
  Widget selectTRUEButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      height: _customHeight! * 0.08,
      minWidth: _customWidth! * 85,
      child: Text(
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
      onPressed: () {},
      color: Colors.red,
      height: _customHeight! * 0.08,
      minWidth: _customWidth! * 85,
      child: Text(
        'False',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
