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
    apiKey: 'AIzaSyA1J32PLI-sQsRU7j0QvNlmgYltweRWPe8',
    appId: '1:649843422117:web:fbf6a3589eb2a3b627ee4c',
    messagingSenderId: '649843422117',
    projectId: 'iti-task-eab1e',
    authDomain: 'iti-task-eab1e.firebaseapp.com',
    storageBucket: 'iti-task-eab1e.appspot.com',
    measurementId: 'G-JYXW7C1RH9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBW_257_JVoxJV0RhVe4Lib9tEluVKl7Vw',
    appId: '1:649843422117:android:3ed46d62af46e5a327ee4c',
    messagingSenderId: '649843422117',
    projectId: 'iti-task-eab1e',
    storageBucket: 'iti-task-eab1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALu6A1NFNO97GX43a1MOrs6jUdR37Qhrc',
    appId: '1:649843422117:ios:dc2be01350bce0fa27ee4c',
    messagingSenderId: '649843422117',
    projectId: 'iti-task-eab1e',
    storageBucket: 'iti-task-eab1e.appspot.com',
    iosClientId: '649843422117-jfqsmf2uddmvo68o98qe29k8nimid71e.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiCourseTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALu6A1NFNO97GX43a1MOrs6jUdR37Qhrc',
    appId: '1:649843422117:ios:06acb786257691fa27ee4c',
    messagingSenderId: '649843422117',
    projectId: 'iti-task-eab1e',
    storageBucket: 'iti-task-eab1e.appspot.com',
    iosClientId: '649843422117-1avtsvla3gdihvnha59tnbio1ufifarl.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiCourseTask.RunnerTests',
  );
}