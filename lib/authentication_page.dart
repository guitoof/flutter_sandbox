import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authClient = Supabase.instance.client.auth;

Future<void> signUp(String email, String password) async {
  final response = await authClient.signUp(email: email, password: password);
  final Session? session = response.session;
  final User? user = response.user;
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  String email = '';

  String password = '';

  void _authenticate() async {
    await signUp(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication with Supabase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              key: Key('email'),
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              key: Key('password'),
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _authenticate,
        child: Icon(Icons.login),
      ),
    );
  }
}
