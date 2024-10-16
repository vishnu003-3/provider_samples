import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_samples/controller/counter_screen_controller.dart';
import 'package:provider_samples/view/second_screen/second_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild ui");
    final Providerobj = context.watch<CounterScreenController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_right))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterScreenController>().onIngrement();
        },
      ),
      body: Center(
          child: Consumer<CounterScreenController>(
        builder: (context, counterProvider, child) => Column(
          children: [
            Text(
              counterProvider.count.toString(),
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
            Text(
              counterProvider.name.toString(),
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
            Text(
              counterProvider.count.toString(),
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
          ],
        ),
      )),
    );
  }
}
