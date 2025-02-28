import 'package:detection_app/firebase_options.dart';
import 'package:detection_app/pages/home_page.dart';
import 'package:detection_app/pages/login_page.dart';
import 'package:detection_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(SuicidalIdeation());
}

class SuicidalIdeation extends StatelessWidget {
  const SuicidalIdeation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        MyHomePage.id: (context) => MyHomePage(),
        
      },
      initialRoute: LoginPage.id,
    );
  }
}
