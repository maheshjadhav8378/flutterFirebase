import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  var isLoading;
  final Function submitForm;

  AuthForm(this.isLoading, this.submitForm);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var isSignup = false;
  var email = '';
  var username = '';
  var password = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      _formKey.currentState?.save();
      widget.submitForm(
        email,
        password,
        username,
        !isSignup,
        context,
      );
      print(email);
      print(username);
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (isSignup)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value!.length < 4) {
                          return 'Username must be at least 4 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      onPressed: _trySubmit,
                      child: Text(!isSignup ? 'Login' : 'Signup'),
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignup = !isSignup;
                        });
                      },
                      child: Text(!isSignup
                          ? 'Create an Account'
                          : 'Already have an account'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
