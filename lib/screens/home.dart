import 'package:flutter/material.dart';
import 'package:myapp/screens/med_screen.dart';  // Ensure this import points to the correct location of MedScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToMed(BuildContext context) {
    // Navigate to the Med screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedScreen()), // Ensure MedScreen is correctly used
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"), // Title for the AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Home Page',
            ),
            Text(
              'You can navigate to the Med screen using the button below.',
              style: Theme.of(context).textTheme.headlineMedium, // Add some content to the second Text widget
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToMed(context),  // Call the method to navigate to Med screen
        tooltip: 'Go to Med',
        child: const Icon(Icons.medical_services),  // Change icon to reflect navigation to MedScreen
      ),
    );
  }
}
