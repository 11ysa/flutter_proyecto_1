class ConParticipanteModel {
  int? id;
  int? idparticipante;
  int? idconvocatoria;

  ConParticipanteModel({this.id, this.idparticipante, this.idconvocatoria});

  factory ConParticipanteModel.deMapAModel(Map<String, dynamic> mapa) =>
      ConParticipanteModel(
          id: mapa["id"],
          idparticipante: mapa["idparticipante"],
          idconvocatoria: mapa["idparticipante"]);
}
