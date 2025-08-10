import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/views/agregar_medicamento.dart';
import 'package:proyecto_final/views/home_page.dart';
import 'package:proyecto_final/views/login_page.dart';
import 'package:proyecto_final/views/registration_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = GetStorage().read('isLoggedIn') ?? false;

    if (!isLoggedIn) { // borra todos los datos del alamcenamiento
      GetStorage().remove('user'); // borra los datos de la clave proporcionada
      return '/login';
    }

    return null;
  },
  routes: [
    GoRoute(
      name: 'login',
      path: '/login', // /home/perfil
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: 'sigin',
      path: '/sigin', // /home/perfil
      builder: (context, state) {
        return const RegistrationPage();
      },
    ),
    GoRoute(
      name: 'homePage',
      path: '/homepage', // /home/perfil
      builder: (context, state) {
        return const HomePage();
      },
    ),GoRoute(
      name: 'agregarMedicamento',
      path: '/agregar', // /home/perfil
      builder: (context, state) {
        return const AgregarMedicamento();
      },
    ),
  ],
);
