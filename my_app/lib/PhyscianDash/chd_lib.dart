import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CHDLib extends StatefulWidget {
  const CHDLib({Key? key}) : super(key: key);

  @override
  _CHDLibState createState() => _CHDLibState();
}

class _CHDLibState extends State<CHDLib> {
  String? _selectedCHD;

  // Define CHD types and their corresponding .glb files
  final Map<String, String> chdTypes = {
    'ASD': 'assets/ASD.glb',
    'PDA': 'assets/PDA.glb',
    'VSD': 'assets/VSD.glb',
    'Modified': 'assets/Modifiers.glb'
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
              },
              items:
                  chdTypes.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
          ),
          // Add your model viewer here
          Expanded(
            child: _selectedCHD == null
                ? Container() // empty container if no CHD type is selected
                : ModelViewer(
                    key: ValueKey(
                        chdTypes[_selectedCHD]), // Add the key property
                    src: chdTypes[_selectedCHD]!,
                    alt: "A 3D model of a $_selectedCHD",
                    ar: true,
                    autoRotate: true,
                    cameraControls: true,
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
          ),
        ],
      ),
    );
  }
}
