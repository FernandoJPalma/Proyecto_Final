import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: const [
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('(editar)'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('(editar)'),
          ),
        ],
      ),
    );
  }
}
