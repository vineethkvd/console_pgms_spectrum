import 'package:console_pgms_spectrum/google_login_integration/normal/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'google_login_integration/getx/view/login.dart';
import 'mail_sending/mail_sending.dart';
import 'mail_sending/uri_launcher/mail_sending_uri.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:MailSendingUri(),
    );
  }
}
