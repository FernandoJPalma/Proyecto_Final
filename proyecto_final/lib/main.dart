import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_final/config/noti_service.dart';
import 'routes/routes.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// late tz.Location appTimeZone;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotiService().initNotification();

  await GetStorage.init('usuarioStorage');
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  // appTimeZone = tz.getLocation('America/Tegucigalpa');

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
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
