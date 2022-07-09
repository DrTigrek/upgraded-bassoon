import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter is being fun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List<Widget> _children = [];

  int idx = 0;

  @override
  void initState() {
    super.initState();
    _children = [
      MyButton(),
      ElevatedButton(child: Text("Button $idx"), onPressed: () {}),
      ElevatedButton(child: Text("Button {$idx+1}"), onPressed: () {}),
    ];
    idx++;
  }

  void someActions() {
    Widget w = _children[0];
    print("Hello World");
  }

  void addChildHandler() {
    idx++;
    setState(() {
      var newChild = ElevatedButton(
        child: Text("Button $idx"),
        onPressed: someActions,
      );
      _children.add(newChild);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    _children = _children == null ? [] : List.from(_children);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Column Example')),
      body: Center(child: Column(children: _children)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: addChildHandler,
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int num = 0;
  String s = 'Button';
  double _height = 50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: ElevatedButton(
        onPressed: () {
          print('hi');
          setState(() {
            num++;
            s = 'hello';
            _height += 10;
          });
        },
        child: Text(s),
      ),
    );
  }
}
