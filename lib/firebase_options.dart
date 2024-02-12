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
    apiKey: 'AIzaSyAl13aijqpvJoXj-X_26JSXmIuxNyf1fNA',
    appId: '1:902623872039:web:eb73e4327532ed2324fa02',
    messagingSenderId: '902623872039',
    projectId: 'notesapp-b9853',
    authDomain: 'notesapp-b9853.firebaseapp.com',
    databaseURL: 'https://notesapp-b9853-default-rtdb.firebaseio.com',
    storageBucket: 'notesapp-b9853.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxOWX3Dcml9DwITXU7Rgt67mvfswM_wbo',
    appId: '1:902623872039:android:19bb988e9038d86424fa02',
    messagingSenderId: '902623872039',
    projectId: 'notesapp-b9853',
    databaseURL: 'https://notesapp-b9853-default-rtdb.firebaseio.com',
    storageBucket: 'notesapp-b9853.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgW2MTOPR2DSI6lDGPNJXhqwFbvOi8nzE',
    appId: '1:902623872039:ios:df51d235d535ad1424fa02',
    messagingSenderId: '902623872039',
    projectId: 'notesapp-b9853',
    databaseURL: 'https://notesapp-b9853-default-rtdb.firebaseio.com',
    storageBucket: 'notesapp-b9853.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgW2MTOPR2DSI6lDGPNJXhqwFbvOi8nzE',
    appId: '1:902623872039:ios:578c82fc6e2043d624fa02',
    messagingSenderId: '902623872039',
    projectId: 'notesapp-b9853',
    databaseURL: 'https://notesapp-b9853-default-rtdb.firebaseio.com',
    storageBucket: 'notesapp-b9853.appspot.com',
    iosBundleId: 'com.example.notesApp.RunnerTests',
  );
}