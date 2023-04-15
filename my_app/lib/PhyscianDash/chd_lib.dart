import 'package:flutter/material.dart';

class CHDLib extends StatefulWidget {
  const CHDLib({Key? key}) : super(key: key);

  @override
  _CHDLibState createState() => _CHDLibState();
}

class _CHDLibState extends State<CHDLib> {
  String? _selectedCHD;

  // Define CHD types and their corresponding .glb files
  final Map<String, String> chdTypes = {
    'CHD Type 1': 'assets/chd_type_1.glb',
    'CHD Type 2': 'assets/chd_type_2.glb',
    'CHD Type 3': 'assets/chd_type_3.glb',
    // Add more CHD types and their corresponding .glb files here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CHD Library')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
            child: DropdownButton<String>(
              dropdownColor: Theme.of(context).accentColor,
              value: _selectedCHD,
              hint: Text(
                'Select a CHD type',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCHD = newValue;
                });
                // Load the .glb file with your model viewer here
                print('Selected .glb file: ${chdTypes[newValue]}');
              },
              items: chdTypes.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
          ),
          // Add your model viewer here
        ],
      ),
    );
  }
}
