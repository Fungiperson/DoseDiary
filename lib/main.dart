import 'package:flutter/material.dart';
//import 'screens/MedicinePage.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/med_screen.dart';  // Ensure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 154, 239)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToHome() {
    // Navigate to the Home screen (assuming HomeScreen is defined in home.dart)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),  // Replace with HomeScreen if that's your widget's name
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
    // Navigate to the MedicinePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedScreen()),
    );
  },
  child: const Text("Go to Medicine Page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToHome,  // Call the method that navigates to home
        tooltip: 'Go to Home',
        child: const Icon(Icons.home),  // You can change the icon if needed
      ),
    );
  }
}
