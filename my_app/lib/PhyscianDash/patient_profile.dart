import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'physician_dashboard.dart'; // Import PhysicianDashboard
import 'package:firebase_core/firebase_core.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  DateTime? _birthday;
  Map<String, bool> _defects = {
    'ASD': false,
    'VSD': false,
    'PDA': false,
  };
  String? _size;
  bool _surgeryRequired = false;
  bool _defectClosesOnItsOwn = false;
  String? _typedStatement;
  List<bool> _languages = [false, false, false];

  final DateFormat _dateFormat = DateFormat('MMMM dd, yyyy');
  final dbRef = FirebaseDatabase.instance.ref().child("patients");

  // Birthday picker helper
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthday ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (String? value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Patient Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (String? value) => _email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Patient Email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address!';
                  }
                  return null;
                },
              ),
              // Add your date picker for Birthday here
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Birthday',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Birthday';
                      }
                      return null;
                    },
                    controller: TextEditingController(
                      text: _birthday == null
                          ? ''
                          : _dateFormat.format(_birthday!),
                    ),
                    onSaved: (String? value) =>
                        _birthday = _dateFormat.parse(value!),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text('Select Defect(s)'),
              ..._defects.entries.map(
                (entry) => CheckboxListTile(
                  title: Text(entry.key),
                  value: entry.value,
                  onChanged: (bool? value) {
                    setState(() {
                      _defects[entry.key] = value ?? false;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text('Select Size'),
              DropdownButton<String>(
                value: _size,
                onChanged: (String? newValue) {
                  setState(() {
                    _size = newValue;
                  });
                },
                items: ['Small (2mm)', 'Medium (4mm)', 'Large (6mm)']
                    .map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 20),
              Text('Statement(s)'),
              CheckboxListTile(
                title: const Text('Surgery may be required'),
                value: _surgeryRequired,
                onChanged: (bool? value) {
                  setState(() {
                    _surgeryRequired = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Your defect is likely to close on its own'),
                value: _defectClosesOnItsOwn,
                onChanged: (bool? value) {
                  setState(() {
                    _defectClosesOnItsOwn = value ?? false;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Typed statement'),
                onSaved: (String? value) => _typedStatement = value,
              ),
              SizedBox(height: 20),
              Text('Language(s)'),
              CheckboxListTile(
                title: const Text('English'),
                value: _languages[0],
                onChanged: (bool? value) {
                  setState(() {
                    _languages[0] = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Spanish'),
                value: _languages[1],
                onChanged: (bool? value) {
                  setState(() {
                    _languages[1] = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Hindi'),
                value: _languages[2],
                onChanged: (bool? value) {
                  setState(() {
                    _languages[2] = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save form and submit data
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Form submitted');
                    // Process the form data here
                    _submitProfileToFirebase();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhysicianDashboard()),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to submit the patient profile to Firebase
  void _submitProfileToFirebase() {
    // TODO: Implement your Firebase logic here to save the patient profile
    // You can use the data stored in _name, _email, _birthday, _defects, _size,
    // _surgeryRequired, _defectClosesOnItsOwn, _typedStatement, and _languages
    String? birthdayString =
        _birthday != null ? _dateFormat.format(_birthday!) : null;
    dbRef.push().set({
      "name": _name,
      "email": _email,
      "birthday": birthdayString,
      "defects": _defects,
      "size": _size,
      "surgeryRequired": _surgeryRequired,
      "defectClosesOnItsOwn": _defectClosesOnItsOwn,
      "typedStatement": _typedStatement,
      "languages": _languages
    }).then((_) {
      // Check if the widget is still mounted before showing the SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Successfully Added')));
      }
    }).catchError((onError) {
      // Check if the widget is still mounted before showing the SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(onError)));
      }
    });
  }
}
