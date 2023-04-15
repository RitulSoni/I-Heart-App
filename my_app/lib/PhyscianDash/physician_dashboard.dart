import 'package:flutter/material.dart';
import '../main.dart'; // Import MainPage from main.dart
import 'chd_lib.dart'; // Import CHDLib

class PhysicianDashboard extends StatelessWidget {
  const PhysicianDashboard({Key? key}) : super(key: key);

  // Helper method to create custom buttons
  Widget _customButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physician Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(context, 'Create New Patient Profile', () {
              // TODO: Implement create new patient profile functionality
            }),
            const SizedBox(height: 20),
            _customButton(context, 'View Patient Profiles', () {
              // TODO: Implement view patient profiles functionality
            }),
             const SizedBox(height: 20),
            _customButton(context, 'View CHD Library', () {
              // Navigate to CHDLib when pressing the "View CHD Library" button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CHDLib()),
              );
            }),
            const SizedBox(height: 20),
            _customButton(context, 'Demo Mode', () {
              // Navigate to MainPage (Model Viewer) when pressing the Demo Mode button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage(title: 'Model Viewer Demo')),
              );
            }),
          ],
        ),
      ),
    );
  }
}
