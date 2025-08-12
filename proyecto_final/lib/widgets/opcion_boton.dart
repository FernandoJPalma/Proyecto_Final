import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Opcion extends StatelessWidget {
  
  const Opcion({super.key, required this.nombreOpcion, required this.nombreRuta});
  final String nombreOpcion;
  final String nombreRuta;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        context.push(nombreRuta);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(Icons.home, size: 40, color: Colors.blueGrey),
          Icon(
            nombreOpcion == 'Agregar Medicamento'
                ? Icons.medication 
                : nombreOpcion == 'Eliminar Medicamentos'
                    ? Icons.delete_forever
                    : nombreOpcion == 'Modificar Medicamento'
                        ? Icons.edit 
                        : Icons.list_alt, 
            size: 40,
            color: Colors.blueGrey,
          ),
          SizedBox(height: 10),
          Text(nombreOpcion, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
