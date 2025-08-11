

import 'package:flutter/material.dart';
import 'package:proyecto_final/models/medicamento.dart';

class Receta {

  final Medicamento medicamento;
  final List<TimeOfDay> horarios;
  
  Receta({
      required this.medicamento,
      required this.horarios
  });

   factory Receta.fromJson(Map<String, dynamic> map) => Receta(
    // id: json["id"],
    medicamento: Medicamento.fromJson(map["medicamento"]),
    horarios: map["dosis"]
  );

  Map<String, dynamic> toMap() => {
    // "id": id,
    'medicamento': medicamento.toJson(),
    'horarios': horarios
  };
}

