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
    List<MyButton> buttons = [];
    for (var i = 1; i < 10; i++) {
      buttons.add(
          MyButton(i.toString(), onPressed: () => appendToText(i.toString())));
    }
    buttons.add(MyButton('c', onPressed: () => clearText()));
    buttons.add(MyButton('+', onPressed: () => appendToText('+')));
    buttons.add(MyButton('=', onPressed: () => calculateResult()));
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
            Wrap(
              children: buttons,
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
