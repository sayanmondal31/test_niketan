import 'dart:developer';
import 'dart:html';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'counter.dart';

void main() => runApp(CounterInterface());

class CounterInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterHome(),
    );
  }
}

class CounterHome extends StatelessWidget {
  final Counter counter = Counter();
  final Counter counter1 = Counter();
  final Counter counter2 = Counter();
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
            CounterShowContainer(counter: counter),
            CounterShowContainer(counter: counter1),
            CounterShowContainer(counter: counter2),
          ],
        ),
      ),
      
    );
  }
}

class CounterShowContainer extends StatelessWidget {
  const CounterShowContainer({
    Key key,
    @required this.counter,
  }) : super(key: key);

  final Counter counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Observer(builder: (_) {
          return Text("${counter.value}");
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton( 
              child: Text("down"),
              onPressed: counter.decrement),
            SizedBox(height:10),
            RaisedButton(
              child: Text("up"),
              onPressed: counter.increment)
          ],
        )
      ]),
    );
  }
}
