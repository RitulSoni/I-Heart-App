import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  // Mock patient data
  List<Map<String, dynamic>> patients = [
    {
      'name': 'John Doe',
      'birthday': '01/01/1980',
      'defects': ['ASD', 'VSD'],
      'size': 'Medium (4mm)',
      'statements': ['Surgery may be required'],
      'language': 'English'
    },
    {
      'name': 'Jane Smith',
      'birthday': '02/02/1990',
      'defects': ['PDS'],
      'size': 'Small (2mm)',
      'statements': ['Your defect is likely to close on its own'],
      'language': 'Spanish'
    },
    // Add more mock patients here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Patient Profiles')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: patients.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.primaries[index % Colors.primaries.length],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patients[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      patients[index]['birthday'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: patients[index]['defects'].length,
                        itemBuilder: (BuildContext context, int subIndex) {
                          return Text(
                            patients[index]['defects'][subIndex],
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      patients[index]['size'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      patients[index]['language'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
