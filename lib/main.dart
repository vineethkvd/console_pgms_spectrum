import 'package:console_pgms_spectrum/sqlite_database/view/sqlflitehome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'android_json_parsing/Using_GetX/view/api_home.dart';
import 'data_to_pdf/data_to_pdf.dart';

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
      home: ProductView(),
    );
  }
}
