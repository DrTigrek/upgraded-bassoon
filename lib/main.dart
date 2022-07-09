import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '';
  static Parser parser = Parser();

  void appendToText(String s) {
    setState(() {
      text += s;
    });
  }

  void clearText() {
    setState(() {
      text = '';
    });
  }

  void updateText(String s) {
    setState(() {
      text = s;
    });
  }

  /// evaluate the result of text and update text with result
  void calculateResult() {
    double result =
        parser.parse(text).evaluate(EvaluationType.REAL, ContextModel());
    print(result);
    updateText(result.toInt().toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Calculator')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton('1', onPressed: () => appendToText('1')),
                MyButton('2', onPressed: () => appendToText('2')),
                MyButton('+', onPressed: () => appendToText('+')),
                MyButton('c', onPressed: () => clearText()),
                MyButton('=', onPressed: () => calculateResult()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String value;
  final Function()? onPressed;

  MyButton(this.value, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(value),
    );
  }
}
