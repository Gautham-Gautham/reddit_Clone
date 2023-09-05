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
    apiKey: 'AIzaSyCUeI9m39E33tN-OSGb082t8y7AZNgOr44',
    appId: '1:371757039932:web:a58d9c1107bc1d5ece5e39',
    messagingSenderId: '371757039932',
    projectId: 'reddit-clone-86165',
    authDomain: 'reddit-clone-86165.firebaseapp.com',
    storageBucket: 'reddit-clone-86165.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGnLw0kgEgttZKxcpWNhvtg5gVmeqjUcQ',
    appId: '1:371757039932:android:4cfe59d3959b1cf7ce5e39',
    messagingSenderId: '371757039932',
    projectId: 'reddit-clone-86165',
    storageBucket: 'reddit-clone-86165.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-Ih8CQHtcJvTgb-ZoZmjaWHkmEt7D3S8',
    appId: '1:371757039932:ios:22ec7b95321d7534ce5e39',
    messagingSenderId: '371757039932',
    projectId: 'reddit-clone-86165',
    storageBucket: 'reddit-clone-86165.appspot.com',
    iosClientId: '371757039932-jjbrjrp34c2ssbb9j2nt7r4lfmqhjbdv.apps.googleusercontent.com',
    iosBundleId: 'com.example.reditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-Ih8CQHtcJvTgb-ZoZmjaWHkmEt7D3S8',
    appId: '1:371757039932:ios:b50b8204245c77e3ce5e39',
    messagingSenderId: '371757039932',
    projectId: 'reddit-clone-86165',
    storageBucket: 'reddit-clone-86165.appspot.com',
    iosClientId: '371757039932-lb16lc7g11llp5cmfe5dq0v90lo97elp.apps.googleusercontent.com',
    iosBundleId: 'com.example.reditClone.RunnerTests',
  );
}
