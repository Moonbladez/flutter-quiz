import 'package:flutter/material.dart';

import "./../login/login.dart";
import "./../topics/topics.dart";

import "./../services/auth.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading");
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("error screen"),
          );
        } else if (snapshot.hasData) {
          print(snapshot);
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
