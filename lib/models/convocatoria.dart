class ConvocatoriaModel {
  int? id;
  String Titulo;
  String Estado;
  int? porcentajetotal;

  ConvocatoriaModel(
      {this.id,
      required this.Titulo,
      required this.Estado,
      this.porcentajetotal});
  factory ConvocatoriaModel.deMapAModel(Map<String, dynamic> mapa) =>
      ConvocatoriaModel(
          id: mapa["id"], Titulo: mapa["titulo"], Estado: mapa["estado"]);
}
