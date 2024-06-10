// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA_SkhRyonmpBDl9dBfsoLGl5Xp9uCR8GE',
    appId: '1:122561993229:web:a0bbc9c96949540bef1344',
    messagingSenderId: '122561993229',
    projectId: 'crud-flutter-acb1d',
    authDomain: 'crud-flutter-acb1d.firebaseapp.com',
    storageBucket: 'crud-flutter-acb1d.appspot.com',
    measurementId: 'G-H72LCXVE5D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZXk7ueMZhgGjORHEs6eZKSMaA0oCUPc8',
    appId: '1:122561993229:android:574d7c99b5f65c99ef1344',
    messagingSenderId: '122561993229',
    projectId: 'crud-flutter-acb1d',
    storageBucket: 'crud-flutter-acb1d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBe4GZLr1yXaJ6DxN03axCNGdL2lEZyHXY',
    appId: '1:122561993229:ios:0f90358752f19b51ef1344',
    messagingSenderId: '122561993229',
    projectId: 'crud-flutter-acb1d',
    storageBucket: 'crud-flutter-acb1d.appspot.com',
    iosBundleId: 'com.example.curdProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBe4GZLr1yXaJ6DxN03axCNGdL2lEZyHXY',
    appId: '1:122561993229:ios:0f90358752f19b51ef1344',
    messagingSenderId: '122561993229',
    projectId: 'crud-flutter-acb1d',
    storageBucket: 'crud-flutter-acb1d.appspot.com',
    iosBundleId: 'com.example.curdProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_SkhRyonmpBDl9dBfsoLGl5Xp9uCR8GE',
    appId: '1:122561993229:web:6712685fa548fd6cef1344',
    messagingSenderId: '122561993229',
    projectId: 'crud-flutter-acb1d',
    authDomain: 'crud-flutter-acb1d.firebaseapp.com',
    storageBucket: 'crud-flutter-acb1d.appspot.com',
    measurementId: 'G-T1SN2PM22S',
  );
}