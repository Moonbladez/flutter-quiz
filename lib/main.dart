import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_quiz/services/firestore.dart';
import 'package:flutter_quiz/services/models.dart';
import 'package:flutter_quiz/theme.dart';
import 'package:provider/provider.dart';

import "./about/about.dart";
import "./home/home.dart";
import "./login/login.dart";
import "./profile/profile.dart";
import "./topics/topics.dart";
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (_) => FirestoreService().stremReport(),
      initialData: Report(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const HomeScreen(),
        routes: {
          "/about": (context) => const AboutScreen(),
          "/login": (context) => const LoginScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/topics": (context) => const TopicsScreen()
        },
      ),
    );
  }
}
