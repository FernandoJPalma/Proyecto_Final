import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/login_page.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  //bloquear la orientación del dispositivo
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Access App',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
