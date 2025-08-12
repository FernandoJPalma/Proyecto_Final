class Medicamento {  final String nombre;
  final String dosis;
  final Frecuencia frecuencia;
  final String descripcion;
  final List<DateTime> horas;
  Medicamento({
    required this.nombre,
    required this.dosis,
    required this.frecuencia,
    required this.horas,
    this.descripcion='',
  });
  static List<DateTime> horasMedicamento(Frecuencia fr, DateTime horaInicio) {
    int dias = fr.dias;
    int hora = fr.horas;
    int veces = 0;
    // int h = horaInicio.hour;
    // int m = horaInicio.minute;
    List<DateTime> horasMedicamento = [];

    while (dias * 24 > veces) {
      veces = veces + hora;
      horasMedicamento.add(horaInicio.add(Duration(hours: veces)));
    }

    return horasMedicamento;
  }

  factory Medicamento.fromJson(Map<String, dynamic> map) => Medicamento(
    nombre: map["nombre"],
    dosis: map["dosis"],
    frecuencia: Frecuencia.fromJson(map["frecuencia"]),
    descripcion: map["descripcion"],
    horas: (map['horas'] as List)
          .map((f) => DateTime.parse(f as String))
          .toList(),
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    'nombre': nombre,
    'dosis': dosis,
    'frecuencia': frecuencia.toJson(),
    'descripcion': descripcion,
    'horas': horas.map((f) => f.toIso8601String()).toList(),
  };
}

class Frecuencia {
  final int dias;
  final int horas;

  Frecuencia({required this.dias, required this.horas});

  factory Frecuencia.fromJson(Map<String, dynamic> map) =>
      Frecuencia(dias: map["dias"], horas: map["horas"]);

  Map<String, dynamic> toJson() => {
    // "id": id,
    'dias': dias,
    'horas': horas,
  };
}
