import 'dart:async'; // Import Timer package
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
  List<int> _history = [];
  Timer? _inactivityTimer;

  void _startInactivityTimer() {
    // Cancel the previous timer if it's running
    _inactivityTimer?.cancel();

    // Start a new 5-second timer
    _inactivityTimer = Timer(Duration(seconds: 5), () {
      setState(() {
        _history.add(_counter); // Add the final counter value to history
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _startInactivityTimer(); // Restart inactivity timer
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
    _startInactivityTimer(); // Restart inactivity timer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Aa Ja Count Karu'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count: $_counter',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Final Count: ${_history[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 70),
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: Icon(Icons.exposure_minus_1),
          ),
          SizedBox(width: 70),
          FloatingActionButton(
            onPressed: () {
              _inactivityTimer?.cancel(); // Stop inactivity timer
              setState(() {
                _counter = 0;
                _history.clear(); // Clear history on reset
              });
            },
            child: Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _inactivityTimer?.cancel();
    super.dispose();
  }
}
