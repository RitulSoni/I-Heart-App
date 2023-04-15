import 'package:flutter/material.dart';
import 'main.dart'; // Import MainPage from main.dart

class PhysicianDashboard extends StatelessWidget {
  const PhysicianDashboard({Key? key}) : super(key: key);

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
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create new patient profile functionality
              },
              child: const Text('Create New Patient Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view patient profiles functionality
              },
              child: const Text('View Patient Profiles'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view CHD library functionality
              },
              child: const Text('View CHD Library'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to MainPage (Model Viewer) when pressing the Demo Mode button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage(title: 'Model Viewer Demo')),
                );
              },
              child: const Text('Demo Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
