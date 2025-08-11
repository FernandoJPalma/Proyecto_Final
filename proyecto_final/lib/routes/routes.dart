import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/views/agregar_medicamento.dart';
import 'package:proyecto_final/views/home_page.dart';
import 'package:proyecto_final/views/login_page.dart';
import 'package:proyecto_final/views/medicamentos_agregados.dart';
import 'package:proyecto_final/views/registration_page.dart';

final router = GoRouter(


  //initialLocation: '/login',

  redirect: (BuildContext context, GoRouterState state) {
    final usuarioStorage = 'usuarioStorage';
    final isLoggedIn = GetStorage(usuarioStorage).read('isLoggedIn') ?? false;

    if (isLoggedIn) { 
      return '/homepage';
    }

    return null;
  },
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login', 
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: 'signIn',
      path: '/signIn',
      builder: (context, state) {
        return const RegistrationPage();
      },
    ),
    GoRoute(
      name: 'homePage',
      path: '/homepage', 
      builder: (context, state) {
        return HomePage();
      },
    ),GoRoute(
      name: 'agregarMedicamento',
      path: '/agregar', 
      builder: (context, state) {
        return AgregarMedicamento();
      },
    ),GoRoute(
      name: 'lista-medicamentos',
      path: '/lista-medicamentos', 
      builder: (context, state) {
        return MedicamentosAgregados();
      },
    ),
    
  ],
);
