class ItemsModel {
  int? id;
  int idconvocatoria;
  String titulo;
  int porcentaje;
  String des5;
  String des4;
  String des3;
  String des2;

  ItemsModel(
      {this.id,
      required this.idconvocatoria,
      required this.titulo,
      required this.porcentaje,
      required this.des5,
      required this.des4,
      required this.des3,
      required this.des2});

  factory ItemsModel.deMapModel(Map<String, dynamic> mapa) => ItemsModel(
      id: mapa["id"],
      idconvocatoria: mapa["idconvocatoria"],
      titulo: mapa["titulo"],
      porcentaje: mapa["porcentaje"],
      des5: mapa["des5"],
      des4: mapa["des4"],
      des3: mapa["des3"],
      des2: mapa["des2"]);
}
