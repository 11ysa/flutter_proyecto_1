import 'dart:ffi';
import 'dart:io';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/models/conevaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/items.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/conparticipante.dart';

class DBAdmin {
  Database? _myDatabase;

  static final DBAdmin db = DBAdmin._();

  DBAdmin._();

  Future<Database?> checkDatabase() async {
    if (_myDatabase != null) {
      return _myDatabase;
    }
    _myDatabase = await initDatabase();
    return _myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LicenceBD.db");
    return openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.transaction((txn) async {
        txn.execute(
            "CREATE TABLE PARTICIPANTE(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellidos TEXT, dni TEXT, edad INTEGER, especialidad TEXT)");
        txn.execute(
            "CREATE TABLE EVALUADOR(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellidos TEXT, dni TEXT, area TEXT,  clave INTEGER,jerarquia TEXT)"); //jerarqui => 1=Jefe 2=Colaborador 3= asistente
        txn.execute(
            "CREATE TABLE CONVOCATORIA(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT,estado TEXT,porcentajetotal INTEGER)");
        txn.execute(
            "CREATE TABLE CONEVALUADOR(id INTEGER PRIMARY KEY AUTOINCREMENT, idevaluador INTEGER, idconvocatoria INTEGER)");
        txn.execute(
            "CREATE TABLE CONPARTICIPANTE(id INTEGER PRIMARY KEY AUTOINCREMENT, idparticipante INTEGER, idconvocatoria INTEGER)");
        txn.execute(
            "CREATE TABLE ITEMS(id INTEGER PRIMARY KEY AUTOINCREMENT, idconvocatoria INTEGER,titulo TEXT,porcentaje INTEGER,des5 TEXT,des4 TEXT,des3 TEXT,des2 TEXT )");
      });
    });
  }

  /* items */
  //insertamos
  Future<int> insertamosItems(ItemsModel ItemsModel) async {
    Database? db = await checkDatabase();
    int resul = await db!.insert("iTEMS", {
      "idconvocatoria": ItemsModel.idconvocatoria,
      "titulo": ItemsModel.titulo,
      "porcentaje": ItemsModel.porcentaje,
      "des5": ItemsModel.des5,
      "des4": ItemsModel.des4,
      "des3": ItemsModel.des3,
      "des2": ItemsModel.des2
    });
    return resul;
  }

  //modificamos items
  Future<int> updateItems(ItemsModel ItemsModel) async {
    Database? db = await checkDatabase();
    int resul = await db!.update(
        "ITEMS",
        {
          "idconvocatoria": ItemsModel.idconvocatoria,
          "titulo": ItemsModel.titulo,
          "porcentaje": ItemsModel.porcentaje,
          "des5": ItemsModel.des5,
          "des4": ItemsModel.des4,
          "des3": ItemsModel.des3,
          "des2": ItemsModel.des2
        },
        where: "id=?",
        whereArgs: [ItemsModel.id]);
    return resul;
  }

  //elimamos items
  Future<int> deleteItems(int idItems) async {
    Database? db = await checkDatabase();
    int resul = await db!.delete("ITEMS", where: "id=$idItems");
    return resul;
  }

  //listamos items y convocatoria
  Future<List<ItemsModel>> getItemsTodos() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaDB = await db!.query("ITEMS");
    List<ItemsModel> listModel =
        listaDB.map((e) => ItemsModel.deMapModel(e)).toList();
    print(listaDB);
    return listModel;
  }

  //listamos items de convocatoria
  Future<List<ItemsModel>> getItems(int idConvocatoria) async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaDB = await db!
        .rawQuery("SELECT * FROM ITEMS WHERE idconvocatoria=$idConvocatoria");
    print(listaDB);
    List<ItemsModel> listModel =
        listaDB.map((e) => ItemsModel.deMapModel(e)).toList();
    return listModel;
  }

  // listamos porcentaje total
  getItemsPorcentajeTotal(int idConvocatoria) async {
    Database? db = await checkDatabase();
    int valor = 0;
    List<Map<String, dynamic>> listaDB = await db!
        .rawQuery("SELECT * FROM ITEMS WHERE idconvocatoria=$idConvocatoria");

    // ignore: avoid_function_literals_in_foreach_calls
    listaDB.forEach((element) {
      valor = valor + int.parse(element["porcentaje"].toString());
    });
    return valor;
  }

  /* ************************************************************* */

  /* convoctoria Con participante */
  //insertamos
  Future<int> insertamosConvocatoriaParticipante(
      ConParticipanteModel conParticipante) async {
    Database? db = await checkDatabase();
    int result = await db!.insert("CONPARTICIPANTE", {
      "idparticipante": conParticipante.idparticipante,
      "idconvocatoria": conParticipante.idconvocatoria
    });
    return result;
  }

  //eliminamos conv Participante
  Future<int> deleteConvocatoriaParticipante(int idConvo, idParticpante) async {
    Database? db = await checkDatabase();
    int res = await db!.rawDelete(
        "DELETE FROM CONPARTICIPANTE where idparticipante =$idParticpante AND idconvocatoria=$idConvo");
    return res;
  }

  //obtenemosConvocatoriaParticpante participantes de convocatoria
  Future<List<ConParticipanteModel>> getConvocatoriasParticipante(
      int idEvalua, int idParticipante) async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaBD = await db!.rawQuery(
        "SELECT * FROM CONPARTICIPANTE WHERE idevaluador=$idEvalua and idparticipante=$idParticipante");
    List<ConParticipanteModel> lisModel =
        listaBD.map((e) => ConParticipanteModel.deMapAModel(e)).toList();
    return lisModel;
  }

  //obtenemosConvocatoriaParticpante Particpante de convocatoria
  Future<List<ParticipanteModel>> getNombreParticipantesConvo(
      int? idConvoca) async {
    Database? db = await checkDatabase();
    Database? dbe = await checkDatabase();
    //creamos la lista
    List<int> lista = [];
    //obtenemos los evaluadores

    List<Map<String, dynamic>> listaBD = await db!.rawQuery(
        "SELECT * FROM CONPARTICIPANTE WHERE idconvocatoria=$idConvoca GROUP BY idparticipante");

    //agregamos los id del evaluador  a la lista
    listaBD.forEach((element) {
      lista.add(element["idparticipante"]);
    });
    List<Map<String, dynamic>> listaParti = await dbe!.rawQuery(
        "SELECT * FROM PARTICIPANTE WHERE id IN(${List.filled(lista.length, '?').join(',')})",
        lista);
    List<ParticipanteModel> lisModel =
        listaParti.map((e) => ParticipanteModel.deMapAModel(e)).toList();

    return lisModel;
  }

  //cantidad de participantes en convocatoria
  Future<String> getCantidadParticipanteConvocatoria(int? idConvo) async {
    Database? db = await checkDatabase();
    final count = await db!.rawQuery(
        "SELECT COUNT(*) as total FROM CONPARTICIPANTE WHERE idconvocatoria=$idConvo");
    return count[0]['total'].toString();
  }

  //obtenemosConvocatoriaPartipante Evaluadores de convocatoria
  Future<List<ConParticipanteModel>> getConvocatoriaParticiapnte() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaBD = await db!.query("CONPARTICIPANTE");
    List<ConParticipanteModel> lisModel =
        listaBD.map((e) => ConParticipanteModel.deMapAModel(e)).toList();
    return lisModel;
  }

  /*---------------------------------------------------------------------------- */

  /* convoctoria Con evaluador */
  //insertamos
  Future<int> insertamosConvocatoriaEvaluador(
      ConEvaluadorModel conEvaluador) async {
    Database? db = await checkDatabase();
    int result = await db!.insert("CONEVALUADOR", {
      "idevaluador": conEvaluador.idevaluador,
      "idconvocatoria": conEvaluador.idconvocatoria
    });
    return result;
  }

  //eliminamos
  Future<int> deleteConvocatoriaEvaluador(int idConvo, idevaluador) async {
    Database? db = await checkDatabase();
    int res = await db!.rawDelete(
        "DELETE FROM CONEVALUADOR where idevaluador =$idevaluador AND idconvocatoria=$idConvo");
    return res;
  }

  //obtenemos cantidad de convocatoria Evaluador
  Future<String> getCantidadEvaluadorConvocatoria(int idevaluador) async {
    Database? db = await checkDatabase();

    final count = await db!.rawQuery(
        "SELECT COUNT(*) as total FROM CONEVALUADOR where idconvocatoria =$idevaluador");

    return count[0]['total'].toString();
  }

  //obtenemosConvocatoriaEvaluador Evaluadores de convocatoria
  Future<List<ConvocatoriaModel>> getConvocatoriasActivasEvaluadores(
      int idevaluador) async {
    //variables
    Database? db = await checkDatabase();
    Database? db2 = await checkDatabase();
    Database? db3 = await checkDatabase();
    List<int> listaConvo = [];
    List<int> listaEvaluador = [];

    //obtener convocatorias Activas
    List<Map<String, dynamic>> listaConvoActivas =
        await db2!.rawQuery("SELECT * FROM CONVOCATORIA");
    print(listaConvoActivas);

    listaConvoActivas.forEach(
      (element) {
        listaConvo.add(element["id"]);
      },
    );

    //convocatorias activas desiganadas a un evaluador
    List<Map<String, dynamic>> listaBD = await db!.rawQuery(
        "SELECT * FROM CONEVALUADOR WHERE idevaluador=$idevaluador  AND idconvocatoria IN(${List.filled(listaConvo.length, '?').join(',')}) ",
        listaConvo);

    listaBD.forEach((element) {
      listaEvaluador.add(element["idconvocatoria"]);
    });

    //lista de convocatorias en modelo
    List<Map<String, dynamic>> ConListaBD = await db3!.rawQuery(
        "SELECT * FROM CONVOCATORIA WHERE id IN(${List.filled(listaEvaluador.length, '?').join(',')}) ",
        listaEvaluador);

    List<ConvocatoriaModel> lisModel =
        ConListaBD.map((e) => ConvocatoriaModel.deMapAModel(e)).toList();

    print("LA LISTA $lisModel");

    print("Las Convocatorias $lisModel");
    return lisModel;
  }

  //obtenemosConvocatoriaEvaluador Evaluadores de convocatoria
  Future<List<EvaluadorModel>> getNombreEvaluadores(int? idConvoca) async {
    Database? db = await checkDatabase();
    Database? dbe = await checkDatabase();
    //creamos la lista
    List<int> lista = [];
    //obtenemos los evaluadores

    List<Map<String, dynamic>> listaBD = await db!.rawQuery(
        "SELECT * FROM CONEVALUADOR WHERE idconvocatoria=$idConvoca GROUP BY idevaluador");

    //agregamos los id del evaluador  a la lista
    listaBD.forEach((element) {
      lista.add(element["idevaluador"]);
    });
    List<Map<String, dynamic>> listaEvalu = await dbe!.rawQuery(
        "SELECT * FROM EVALUADOR WHERE id IN(${List.filled(lista.length, '?').join(',')})",
        lista);
    List<EvaluadorModel> lisModel =
        listaEvalu.map((e) => EvaluadorModel.deMapAModel(e)).toList();

    return lisModel;
  }

  //obtenemosConvocatoriaEvaluador Evaluadores de convocatoria
  Future<List<ConEvaluadorModel>> getConvocatoriaEvaluador() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaBD = await db!.query("CONEVALUADOR");
    print(listaBD);
    List<ConEvaluadorModel> lisModel =
        listaBD.map((e) => ConEvaluadorModel.deMapAModel(e)).toList();
    return lisModel;
  }

  /* convocatoria */
  // obtener todas las convocatorias
  Future<List<ConvocatoriaModel>> getConvocatorias() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaBD = await db!.query("CONVOCATORIA");
    List<ConvocatoriaModel> lisModel =
        listaBD.map((e) => ConvocatoriaModel.deMapAModel(e)).toList();
    return lisModel;
  }

  // obtener una convocatoria

  Future<List<ConvocatoriaModel>> getConvocatoria(int idConvocatoria) async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaBD = await db!
        .query("CONVOCATORIA", where: "id=?", whereArgs: [idConvocatoria]);
    print(listaBD);
    List<ConvocatoriaModel> lisModel =
        listaBD.map((e) => ConvocatoriaModel.deMapAModel(e)).toList();
    return lisModel;
  }

  //insertamos convocatoria
  Future<int> insertamosConvocatoria(ConvocatoriaModel convocatoria) async {
    Database? db = await checkDatabase();
    Database? db2 = await checkDatabase();
    int result = await db!.insert("CONVOCATORIA", {
      "titulo": convocatoria.Titulo,
      "estado": "Activo",
      "porcentajetotal": 0
    });

    List id =
        await db2!.rawQuery("SELECT last_insert_rowid() FROM CONVOCATORIA");

    // print(id[0]["last_insert_rowid()"]);

    return (id[0]["last_insert_rowid()"]);
  }

  //modificamos convocatoria
  Future<int> updateConvocatoria(ConvocatoriaModel convocatoria) async {
    Database? db = await checkDatabase();
    int result = await db!.update("CONVOCATORIA",
        {"titulo": convocatoria.Titulo, "estado": convocatoria.Estado},
        where: "id=?", whereArgs: [convocatoria.id]);
    return result;
  }

  /* participantes */

  //insertar participantes
  Future<int> insertParticipante(ParticipanteModel participante) async {
    Database? db = await checkDatabase();
    int res = await db!.insert("PARTICIPANTE", {
      "nombre": participante.nombre,
      "apellidos": participante.apellidos,
      "dni": participante.dni,
      "edad": participante.edad,
      "especialidad": participante.especialidad
    });
    return res;
  }

  //Actualizar Participante
  Future<int> updateParticipante(ParticipanteModel participante) async {
    Database? db = await checkDatabase();
    int res = await db!.update(
        "PARTICIPANTE",
        {
          "nombre": participante.nombre,
          "apellidos": participante.apellidos,
          "dni": participante.dni,
          "edad": participante.edad,
          "especialidad": participante.especialidad
        },
        where: "id=?",
        whereArgs: [participante.id]);

    return res;
  }

  //obtener participantes
  Future<List<ParticipanteModel>> getParticipante() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> ListaParticipantes =
        await db!.query("PARTICIPANTE");
    List<ParticipanteModel> listParti =
        ListaParticipantes.map((e) => ParticipanteModel.deMapAModel(e))
            .toList();
    return listParti;
  }

  //eliminar Participante
  Future<int> deleteParticipante(int id) async {
    Database? db = await checkDatabase();
    int res = await db!.delete("PARTICIPANTE", where: "id=$id");
    return res;
  }

  //**************************Evaluador**************************************** */

  //inicio de seccion
  Future<List<EvaluadorModel>?> getLoginEvaluador(
      String identidad, String clave) async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listadb = await db!.rawQuery(
        "SELECT * FROM EVALUADOR WHERE dni='$identidad' AND clave='$clave'");

    List<EvaluadorModel> lista =
        listadb.map((e) => EvaluadorModel.deMapAModel(e)).toList();

    if (lista.isNotEmpty) {
      return lista;
    } else {
      return null;
    }
  }

  //registrar Evaluador
  Future<int> insertEvaluador(EvaluadorModel EvaluadorModel) async {
    Database? db = await checkDatabase();
    int res = await db!.insert("EVALUADOR", {
      "nombre": EvaluadorModel.nombre,
      "apellidos": EvaluadorModel.apellidos,
      "dni": EvaluadorModel.dni,
      "area": EvaluadorModel.area,
      "clave": EvaluadorModel.clave,
      "jerarquia": EvaluadorModel.jerarquia,
    });

    return res;
  }

  //actualizar Evaluador
  Future<int> updateEvaluador(EvaluadorModel EvaluadorModel) async {
    Database? db = await checkDatabase();
    int res = await db!.update(
        "EVALUADOR",
        {
          "NOMBRE": EvaluadorModel.nombre,
          "apellidos": EvaluadorModel.apellidos,
          "dni": EvaluadorModel.dni,
          "area": EvaluadorModel.area,
          "clave": EvaluadorModel.clave,
          "JERARQUIA": EvaluadorModel.jerarquia,
        },
        where: "id=?",
        whereArgs: [EvaluadorModel.id]);

    return res;
  }
//obtener Evaluador

  Future<List<EvaluadorModel>> getEvaluador() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> listaMap = await db!.query("EVALUADOR");
    List<EvaluadorModel> listModel =
        listaMap.map((e) => EvaluadorModel.deMapAModel(e)).toList();
    return listModel;
  }

//Eliminar Evaluador
  Future<int> deleteEvaluador(int id) async {
    Database? db = await checkDatabase();
    int res = await db!.delete("EVALUADOR", where: "id=$id");
    return res;
  }
}
