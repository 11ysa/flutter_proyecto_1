class ParticipanteModel {
  int? id;
  String nombre;
  String apellidos;
  String dni;
  int edad;
  String especialidad;

  ParticipanteModel(
      {this.id,
      required this.nombre,
      required this.apellidos,
      required this.dni,
      required this.edad,
      required this.especialidad});

  factory ParticipanteModel.deMapAModel(Map<String, dynamic> mapa) =>
      ParticipanteModel(
          id: mapa["id"],
          nombre: mapa["nombre"],
          apellidos: mapa["apellidos"],
          dni: mapa["dni"],
          edad: mapa["edad"],
          especialidad: mapa["especialidad"]);
}

