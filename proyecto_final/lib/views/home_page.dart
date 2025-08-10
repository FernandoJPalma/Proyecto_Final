import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/opciones_main.dart';
import '../widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Espacio para el logo central
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Text('LOGO'),
          ),
          // Busquen una imagen para poner ahi que valla acorde al proyecto
          const SizedBox(height: 20),

          const Text(
            'GESTION DE MEDICAMENTOS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'hola (editar) *agregar hora', //aqui tiene que ir el nombre del usuari@ y tiene que cambiar el dia y noches por hora
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          OpcionesMain()
        ],
      ),
    );
  }
}
