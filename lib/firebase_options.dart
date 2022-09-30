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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA4N29-MAF56qshnyo4dl0Qh_HdA3l7xsc',
    appId: '1:517789274092:web:78fdeacff1b5876f85bac9',
    messagingSenderId: '517789274092',
    projectId: 'modu-f8cd4',
    authDomain: 'modu-f8cd4.firebaseapp.com',
    storageBucket: 'modu-f8cd4.appspot.com',
    measurementId: 'G-X0Z96KLZRS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqu8Tf4hC8bfwaU4Fqs7lBW-f3L1hLVMk',
    appId: '1:517789274092:android:9759be3720f9c3c385bac9',
    messagingSenderId: '517789274092',
    projectId: 'modu-f8cd4',
    storageBucket: 'modu-f8cd4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQEW2mYstDUwqQSFSL9MjCl4h5ZDKG_WQ',
    appId: '1:517789274092:ios:1e193ffbfce210f085bac9',
    messagingSenderId: '517789274092',
    projectId: 'modu-f8cd4',
    storageBucket: 'modu-f8cd4.appspot.com',
    androidClientId: '517789274092-uqkovfem2tan2aoj594rh585m70s2uo5.apps.googleusercontent.com',
    iosClientId: '517789274092-fmiqtjuupq2hbrugkejosodggep8m57g.apps.googleusercontent.com',
    iosBundleId: 'com.example.modu',
  );
}
