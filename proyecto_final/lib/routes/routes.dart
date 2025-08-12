import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/models/medicamento.dart';
import 'package:proyecto_final/views/agregar_medicamento.dart';
import 'package:proyecto_final/views/detalle_medicamento.dart';
import 'package:proyecto_final/views/home_page.dart';
import 'package:proyecto_final/views/login_page.dart';
import 'package:proyecto_final/views/medicamentos_agregados.dart';
import 'package:proyecto_final/views/registration_page.dart';
import 'package:proyecto_final/views/mostrar_medicamentos.dart';

final router = GoRouter(


  //initialLocation: '/login',

  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = GetStorage('usuarioStorage').read('isLoggedIn') ?? false;
    final currentLocation = state.matchedLocation;

    final publicRoutes = ['/login', '/signIn']; 

    if (!isLoggedIn && !publicRoutes.contains(currentLocation)) { 
      return '/login';
    }
    if (isLoggedIn && publicRoutes.contains(currentLocation)) {
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
      name: 'mostrarMedicamento',
      path: '/mostrar', 
      builder: (context, state) {
        return MostrarMedicamentos();
      },
    ),GoRoute(
      name: 'lista-medicamentos',
      path: '/lista-medicamentos', 
      builder: (context, state) {
        return MedicamentosAgregados();
      },
    ),GoRoute(
      name: 'detalle medicamento',
      path: '/detalle-medicamento', 
      builder: (context, state) {
        final medicamento = state.extra as Medicamento;
        return DetalleMedicamento(medicamento: medicamento,);
      },
    ),
    
  ],
);
