class ConEvaluadorModel {
  int? id;
  int idevaluador;
  int idconvocatoria;

  ConEvaluadorModel(
      {this.id, required this.idevaluador, required this.idconvocatoria});

  factory ConEvaluadorModel.deMapAModel(Map<String, dynamic> mapa) =>
      ConEvaluadorModel(
          id: mapa["id"],
          idevaluador: mapa["idevaluador"],
          idconvocatoria: mapa["idconvocatoria"]);
}
