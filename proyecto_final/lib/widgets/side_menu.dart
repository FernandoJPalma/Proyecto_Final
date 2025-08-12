import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('(editar)'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('(editar)'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Cerrar sesión'),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Cerrar sesión'),
                    content: Text('¿Estás seguro de querer cerrar sesión?'),
                    actions: [
                      TextButton(
                        style: ButtonStyle(
                          
                          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          GetStorage('usuarioStorage').write('isLoggedIn', false);
                          context.go('/login');
                        },
                        child: Text('Sí'),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
