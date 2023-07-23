// Import required packages and libraries
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Define your Flutter application class (MyApp)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Counter App'),
        ),
        body: const Center(
          child: MyCounterWidget(),
        ),
      ),
    );
  }
}

// Define the counter widget
class MyCounterWidget extends StatefulWidget {
  const MyCounterWidget({Key? key}) : super(key: key);

  @override
  _MyCounterWidgetState createState() => _MyCounterWidgetState();
}

class _MyCounterWidgetState extends State<MyCounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$_counter', style: Theme.of(context).textTheme.headline4),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build your app (MyApp) and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that your counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that your counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
