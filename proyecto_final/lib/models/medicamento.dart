class Medicamento {
  // final int id;
  final String nombre;
  final String dosis;
  final String frecuencia;
  final String? descripcion;

  Medicamento({
    // required this.id,
    required this.nombre,
    required this.dosis,
    required this.frecuencia,
    this.descripcion,
  });

  factory Medicamento.fromJson(Map<String, dynamic> map) => Medicamento(
    // id: json["id"],
    nombre: map["nombre"],
    dosis: map["dosis"],
    frecuencia: map["frecuencia"],
    descripcion: map["descripcion"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    'nombre': nombre,
    'dosis': dosis,
    'frecuencia': frecuencia,
    'descripcion': descripcion,
  };
}
