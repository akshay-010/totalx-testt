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
    apiKey: 'AIzaSyDZJCwG_PclgkkHRFCnzyXIbigx3aiDZsk',
    appId: '1:469576569317:web:ef7e658bd85eafeddcdf0c',
    messagingSenderId: '469576569317',
    projectId: 'totalx-test',
    authDomain: 'totalx-test.firebaseapp.com',
    storageBucket: 'totalx-test.appspot.com',
    measurementId: 'G-NB68TX8WJ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRbK-qosWr2ZhsshNRMY1f0YyGZp3I7RE',
    appId: '1:469576569317:android:21cab677583d197adcdf0c',
    messagingSenderId: '469576569317',
    projectId: 'totalx-test',
    storageBucket: 'totalx-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw0eGE9RPiYUPy_A7zzkuOEXEq0gmaCo4',
    appId: '1:469576569317:ios:be308913f3da6334dcdf0c',
    messagingSenderId: '469576569317',
    projectId: 'totalx-test',
    storageBucket: 'totalx-test.appspot.com',
    iosBundleId: 'com.example.machinetestt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw0eGE9RPiYUPy_A7zzkuOEXEq0gmaCo4',
    appId: '1:469576569317:ios:be308913f3da6334dcdf0c',
    messagingSenderId: '469576569317',
    projectId: 'totalx-test',
    storageBucket: 'totalx-test.appspot.com',
    iosBundleId: 'com.example.machinetestt',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDZJCwG_PclgkkHRFCnzyXIbigx3aiDZsk',
    appId: '1:469576569317:web:4610d1bddef6e4cfdcdf0c',
    messagingSenderId: '469576569317',
    projectId: 'totalx-test',
    authDomain: 'totalx-test.firebaseapp.com',
    storageBucket: 'totalx-test.appspot.com',
    measurementId: 'G-6LCGBT28QC',
  );
}
