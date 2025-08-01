import 'package:flutter/material.dart';
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
            'GESTIO DE MEDICAMENTOS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'hola (editar)',//aqui tiene que ir el nombre del usuari@ y tiene que cambiar el dia y noches por hora
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: List.generate(4, (index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.home, size: 40, color: Colors.blueGrey),
                        SizedBox(height: 10),
                        Text(
                          '(editar)',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
