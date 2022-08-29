class ConEvaluador {
  int? id;
  int idevaluador;
  int idconvocatoria;

  ConEvaluador(
      {this.id, required this.idevaluador, required this.idconvocatoria});

  factory ConEvaluador.deMapAModel(Map<String, dynamic> mapa) => ConEvaluador(
      id: mapa["id"],
      idevaluador: mapa["idevaluador"],
      idconvocatoria: mapa["idconvocatoria"]);
}
