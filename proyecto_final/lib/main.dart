import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart';
import 'routes/routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  
  //bloquear la orientación del dispositivo
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); 
}

class _MyAppState extends State<MyApp>{
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  
  @override
  void initState(){
    init();
    super.initState();
  }

Future<void> init() async {
  initializeTimeZones();

  //! https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  setLocalLocation(
    getLocation('America/Toronto'),
  );

  const androidSettings = 
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosSettings = 
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = 
      InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

  await notificationsPlugin.initialize(initializationSettings);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
