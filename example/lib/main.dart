import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:led_counter/led_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;
  var count = -1;
  var start = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    if (_timer != null && _timer!.isActive) {
      return;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count > 8) {
          setState(() {
            count = 0;
          });
        } else {
          setState(() {
            count += 1;
          });
        }
      },
    );
  }

  void startStop() {
    setState(() {
      start = !start;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (start) {
      startTimer();
    } else {
      _timer?.cancel();
      setState(() {
        count = -1;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: startStop,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 10,
                      top: 10,
                    ),
                    color: Colors.blue,
                    child: Text(
                      start ? "Stop" : "Start",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              LedCounter(
                height: 200,
                width: 100,
                number: count,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
