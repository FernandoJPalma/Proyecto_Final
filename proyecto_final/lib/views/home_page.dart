import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final/config/noti_service.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';
import 'package:proyecto_final/widgets/opciones_main.dart';
import '../widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final medicamentoController = Get.put<MedicamentosController>(
    MedicamentosController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
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
            'hola (editar) *agrega hora', //aqui tiene que ir el nombre del usuari@ y tiene que cambiar el dia y noches por hora
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          OpcionesMain(),
          

          
          ElevatedButton(
            onPressed: () async {
              try {
                await NotiService().showNotification(
                  id: 1, // ID único
                  title: "Recordatorio de Medicamento",
                  body: "Es hora de tomar tu medicamento",
                );
              } catch (e) {
                debugPrint('Error al mostrar notificación: $e');
                // Opcional: mostrar un mensaje al usuario
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al mostrar notificación: ${e.toString()}')),
                );
              }
            },
            child: const Text("Mostrar Notificación"),
          ),


        ],
      ),
    );
  }
}
