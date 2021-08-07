import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';

class AuthSreen extends StatelessWidget {
  const AuthSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(),
    );
  }
}
