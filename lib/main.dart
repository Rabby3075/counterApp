import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),

    );
  }
}

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends State<CounterScreen>{
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
      if (counter >= 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Button pressed $counter times.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count:',style: TextStyle(
              fontSize: 20
            ),),
            Text(counter.toString(),style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCounter,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20), // Add spacing between buttons
                ElevatedButton(
                    onPressed: decrementCounter,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}

