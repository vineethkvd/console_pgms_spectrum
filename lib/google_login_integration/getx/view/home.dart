import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetxGoggleHomePage extends StatefulWidget {
  const GetxGoggleHomePage({super.key});

  @override
  State<GetxGoggleHomePage> createState() => _GetxGoggleHomePageState();
}

class _GetxGoggleHomePageState extends State<GetxGoggleHomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (user != null)
                Column(
                  children: [
                    Text(
                      "Welcome, ${user!.displayName ?? 'Guest'}",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Email: ${user!.email ?? 'No email available'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    if (user!.photoURL != null)
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user!.photoURL!),
                      ),
                  ],
                )
              else
                Text("No user signed in."),
            ]),
      ),
    );
  }
}
