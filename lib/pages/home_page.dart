import 'package:flutter/material.dart';
import 'package:fravia_app/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _customHeight, _customWidth;
  double _difficultylevel = 0;
  final List<String> dificultyTextLevel = ['Easy', 'Medium', 'Hard'];

  @override
  Widget build(BuildContext context) {
    _customHeight = MediaQuery.of(context).size.height;
    _customWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _customWidth! * 0.10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              appTitle(),
              difficultyLevel(),
              selectButton(),
            ],
          )),
        ),
      ),
    );
  }

  Widget appTitle() {
    return Column(
      children: [
        const Text(
          'Fravia Quiz App',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          dificultyTextLevel[_difficultylevel.toInt()],
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget difficultyLevel() {
    return Slider(
      min: 0,
      max: 2,
      divisions: 3,
      label: 'Difficulty',
      value: _difficultylevel,
      onChanged: (value) {
        setState(() {
          _difficultylevel = value;
        });
        print(_difficultylevel);
      },
    );
  }

  Widget selectButton() {
    return MaterialButton(
      color: Colors.yellow,
      height: _customHeight! * 0.08,
      minWidth: _customWidth! * 0.88,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePage(
                difficultyLevel:
                    dificultyTextLevel[_difficultylevel.toInt()].toLowerCase(),
              ),
            ));
      },
      child: const Text(
        'Lets Go',
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1.8,
        ),
      ),
    );
  }
}
