import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {

    setState(() {
      _counter++;
    });
    // Display message when counter reaches 10
    if (_counter == 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You reached count 10!')),
      );
    }
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Aa Ja Count Karu'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text(
          'Count: $_counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
      FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
          SizedBox(width: 70),
          FloatingActionButton(
        onPressed: _decrementCounter,
        child: Icon(Icons.exposure_minus_1),
      ),
      ],
      ),
    );
  }
}
