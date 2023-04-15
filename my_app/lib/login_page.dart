import 'package:flutter/material.dart';
import 'main.dart';
import 'physician_dashboard.dart'; // Import PhysicianDashboard

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add your login form here
            ElevatedButton(
              onPressed: () {
                // Navigate to PhysicianDashboard after successful login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PhysicianDashboard()),
                );
              },
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
