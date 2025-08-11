import 'package:flutter/material.dart';
import 'package:proyecto_final/views/fragments/lista_medicamentos.dart';


class MedicamentosAgregados extends StatelessWidget {
  const MedicamentosAgregados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, elevation: 0),
      body: ListaMedicamentos(),
    );
  }
}