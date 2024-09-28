import 'package:firebase_authentication/homepage.dart';
import 'package:firebase_authentication/login.dart';
import 'package:firebase_authentication/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              if (snapshot.data!.emailVerified) {
                return Homepage();
              } else {
                return VerifyEmail();
              }
            } else {
              return Login();
            }
          }),
    );
  }
}
