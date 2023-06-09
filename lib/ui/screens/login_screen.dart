import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/ui/screens/user_screen.dart';
import 'package:flash/ui/widgets/eye_button.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../constants.dart';
import '../widgets/loading_widget.dart';
import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool isLoading = false;
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 48.0,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your email")),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: isObscured,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password",
                  suffixIcon: EyeButton(
                    isObscured: isObscured,
                    onPressed: () {
                      setState(
                        () {
                          isObscured = !isObscured;
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              isLoading
                  ? const LoadingWidget()
                  : RoundedButton(
                      colour: Colors.blueAccent,
                      title: "Log In",
                      onPressed: () async {
                        try {
                          if (email != null && password != null) {
                            setState(() {
                              isLoading = true;
                            });

                            ///what is this?
                            final user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email!, password: password!);

                            log("Login Success $user");
                            log("Token ${user.credential?.accessToken}");

                            setState(() {
                              isLoading = false;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamedAndRemoveUntil(
                                context, UserScreen.id, (_) => false);
                          }
                        } catch (e) {
                          log("Login Error $e");
                          setState(() {
                            isLoading = false;
                            Alert(
                                    context: context,
                                    buttons: [
                                      DialogButton(
                                          onPressed: () {},
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("OK")))
                                    ],
                                    title: "Failed Login",
                                    desc: (e as FirebaseAuthException).message)
                                .show();
                          });
                        }
                      })
            ],
          ),
        ),
      ),
    );
  }
}
