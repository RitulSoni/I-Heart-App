// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-KziVE9k_CTCGRzjVHz5_1qfIOHTxQ24',
    appId: '1:500026849943:web:1d46d70958d1fd2f8a07d2',
    messagingSenderId: '500026849943',
    projectId: 'iheart-4092e',
    authDomain: 'iheart-4092e.firebaseapp.com',
    storageBucket: 'iheart-4092e.appspot.com',
    measurementId: 'G-W8B7FQ7DL5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcEB7yboCDjNJF0vhvmRGIjwKT7USfR0o',
    appId: '1:500026849943:android:7f8316516c782f678a07d2',
    messagingSenderId: '500026849943',
    projectId: 'iheart-4092e',
    storageBucket: 'iheart-4092e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvssP1mWBKYzI2hwN2iYaRuahTQ_IkinA',
    appId: '1:500026849943:ios:0df3d1a087695fa78a07d2',
    messagingSenderId: '500026849943',
    projectId: 'iheart-4092e',
    storageBucket: 'iheart-4092e.appspot.com',
    iosClientId: '500026849943-1bjk6bii65fbepmpqq83t0lrvvjbfign.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvssP1mWBKYzI2hwN2iYaRuahTQ_IkinA',
    appId: '1:500026849943:ios:0df3d1a087695fa78a07d2',
    messagingSenderId: '500026849943',
    projectId: 'iheart-4092e',
    storageBucket: 'iheart-4092e.appspot.com',
    iosClientId: '500026849943-1bjk6bii65fbepmpqq83t0lrvvjbfign.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}
