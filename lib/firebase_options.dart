// firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // Web
      return FirebaseOptions(
        apiKey: 'AIzaSyBzxDMDkOsgRwqezNjidxka_344EebpWuk',
        authDomain: 'clone-ad660.firebaseapp.com',
        projectId: 'clone-ad660',
        storageBucket: 'clone-ad660.appspot.com',
        messagingSenderId: '884775505847',
        appId: '1:884775505847:web:e620b241bf17d1581ba232',
      );
    }
    throw UnsupportedError(
        'DefaultFirebaseOptions are not supported for this platform.');
  }
}
