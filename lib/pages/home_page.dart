import 'package:flutter/material.dart';
import 'package:fravia_app/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _customHeight, _customWidth;

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
              MaterialButton(
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(),
                      ));
                },
                child: const Text(
                  'Start Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget appTitle() {
    return const Text(
      'Fravia Quiz App',
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
