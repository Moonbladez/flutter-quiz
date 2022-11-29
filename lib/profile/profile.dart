import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/auth.dart';
import 'package:flutter_quiz/services/models.dart';
import 'package:flutter_quiz/widgets/loading.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(user.displayName ?? "Guest"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??
                        "https://www.gravatar.com/avatar/placeholder"),
                  ),
                ),
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                width: 100,
              ),
              Text(
                user.email ?? "",
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              Text(
                "${report.total}",
                style: Theme.of(context).textTheme.headline2,
              ),
              const Spacer(),
              Text(
                "Quizzes Completed",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                },
                child: const Text("Logout"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ));
    } else {
      return const Loader();
    }
  }
}
