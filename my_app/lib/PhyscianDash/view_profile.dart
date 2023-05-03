import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final dbRef = FirebaseDatabase.instance.ref().child("patients");
  List<Map<String, dynamic>> patients = [];

  @override
  void initState() {
    super.initState();
    // Listen for changes in the patients collection
    dbRef.onValue.listen((event) {
      // Extract the patient data from the event snapshot
      Map<dynamic, dynamic>? data =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        patients = [];
        data.forEach((key, value) {
          List<String> defectNames = [];

          Map<dynamic, dynamic> defectsMap = value['defects'];

          if (defectsMap['ASD'] == true) {
            defectNames.add("ASD");
          }
          if (defectsMap['VSD'] == true) {
            defectNames.add("VSD");
          }
          if (defectsMap['PDA'] == true) {
            defectNames.add("PDA");
          }

          Map<String, dynamic> patient = {
            'key': key,
            'name': value['name'],
            'birthday': value['birthday'],
            'defects': defectNames,
            'size': value['size'],
            "surgeryRequired": generateSgyString(value['surgeryRequired']),
            "defectClosesOnItsOwn":
                generateRcvString(value['defectClosesOnItsOwn']),
            "typedStatement": value['typedStatement'],
            'language': generateLanguageString(value['languages']),
          };
          patients.add(patient);
        });
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  String generateSgyString(bool need) {
    String result = "";
    if (need == true) {
      result = "Surgery may be required";
    }
    return result;
  }

  String generateRcvString(bool need) {
    String result = "";
    if (need == true) {
      result = "Defect is likely to close on its own";
    }
    return result;
  }

  String generateLanguageString(List<dynamic> languages) {
    List<String> selectedLanguages = [];

    // Check if the languages list contains bool values
    if (languages.every((element) => element is bool)) {
      List<bool> boolLanguages = languages.cast<bool>();

      if (boolLanguages[0]) {
        selectedLanguages.add('English');
      }
      if (boolLanguages[1]) {
        selectedLanguages.add('Spanish');
      }
      if (boolLanguages[2]) {
        selectedLanguages.add('Hindi');
      }
    }

    return selectedLanguages.join(', ');
  }

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
                      patients[index]['surgeryRequired'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      patients[index]['defectClosesOnItsOwn'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      patients[index]['typedStatement'],
                      style: TextStyle(color: Colors.white),
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
