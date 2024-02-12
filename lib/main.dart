import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:notes_app/pages/home_page.dart.';
import 'package:notes_app/pages/to_dos.dart';
import 'package:notes_app/pages/new_note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => ToDos(),
      '/new_note': (context) => NewNote(),
    },
  ));
}