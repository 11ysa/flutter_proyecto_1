class EvaluadorModel {
  int? id;
  String nombre;
  String apellidos;
  String dni;
  String area;
  int clave;
  String jerarquia;

  EvaluadorModel(
      {this.id,
      required this.nombre,
      required this.apellidos,
      required this.dni,
      required this.area,
      required this.clave,
      required this.jerarquia});

  factory EvaluadorModel.deMapAModel(Map<String, dynamic> mapa) =>
      EvaluadorModel(
          id: mapa["id"],
          nombre: mapa["nombre"],
          apellidos: mapa["apellidos"],
          dni: mapa["dni"],
          area: mapa["area"],
          clave: mapa["clave"],
          jerarquia: mapa["jerarquia"]);
  String nombreCompleto() {
    String dato = nombre + " " + apellidos;
    return dato;
  }

  String nombres() {
    return nombre;
  }
}
