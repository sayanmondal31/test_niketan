import 'dart:developer';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'counter.dart';

void main()=>runApp(CounterInterface());

class CounterInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterHome(),
    );
  }
}

class CounterHome extends StatelessWidget {
  final Counter counter =  Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("counter with mobx"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {return Text("${counter.value}");})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:counter.increment ,),
    );
  }
}