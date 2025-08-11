import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/views/agregar_medicamento.dart';
import 'package:proyecto_final/views/home_page.dart';
import 'package:proyecto_final/views/login_page.dart';
import 'package:proyecto_final/views/medicamentos_agregados.dart';
import 'package:proyecto_final/views/registration_page.dart';

final router = GoRouter(
<<<<<<< HEAD
  initialLocation: '/homepage',
=======
  initialLocation: '/login',
>>>>>>> fd6d0926e41e911e45655b60f81871fc9ef39259
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
        return HomePage();
      },
    ),GoRoute(
      name: 'agregarMedicamento',
      path: '/agregar', // /home/perfil
      builder: (context, state) {
        return AgregarMedicamento();
      },
    ),GoRoute(
      name: 'lista-medicamentos',
      path: '/lista-medicamentos', // /home/perfil
      builder: (context, state) {
        return MedicamentosAgregados();
      },
    ),
    
  ],
);
