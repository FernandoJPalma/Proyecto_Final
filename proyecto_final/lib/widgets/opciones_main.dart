import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/opcion_boton.dart';

class OpcionesMain extends StatelessWidget {
  const OpcionesMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            Opcion(
              nombreOpcion: 'Agregar Medicamento',
              nombreRuta: '/agregar',
            ),
            Opcion(
              nombreOpcion: 'Eliminar medicamentos',
              nombreRuta: '/eliminar',
            ),
            Opcion(
              nombreOpcion: 'Modificar Medicamento',
              nombreRuta: '/modificar-medicamentos',
            ),
            Opcion(
              nombreOpcion: 'Ver Lista de Medicamento',
              nombreRuta: '/mostrar',
            ),
          ],
        ),
      ),
    );
  }
}
