import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                userProvider.fetchUser();
              },
              child: const Text('Fetch Random User'),
            ),
            if (userProvider.user != null)
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(userProvider.user!.picture),
                    radius: 60,
                  ),
                  const SizedBox(height: 20),
                  Text('Name: ${userProvider.user!.name}'),
                  Text('Email: ${userProvider.user!.email}'),
                  Text('Phone: ${userProvider.user!.phone}'),
                  const SizedBox(height: 20),
                  Text('Location: ${userProvider.user!.location}'),
                  // Display location
                ],
              ),
          ],
        ),
      ),
    );
  }
}