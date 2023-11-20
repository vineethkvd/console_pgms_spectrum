import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class PasswordSaltingSample extends StatefulWidget {
  const PasswordSaltingSample({super.key});

  @override
  State<PasswordSaltingSample> createState() => _PasswordSaltingSampleState();
}

class _PasswordSaltingSampleState extends State<PasswordSaltingSample> {
  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _encryptedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password salting')),
      body: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          String encryptedPassword = encryptPassword(_password);
                          setState(() {
                            _encryptedPassword = encryptedPassword;
                          });
                          print('Encrypted password: $encryptedPassword');
                          // Use the encrypted password for authentication or storage
                        }
                      },
                      child: Text("Login")),
                  if (_encryptedPassword.isNotEmpty)
                    Text('Encrypted password: $_encryptedPassword'),
                ],
              ))),
    );
  }
}
