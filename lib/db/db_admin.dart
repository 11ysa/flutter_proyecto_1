import 'dart:io';
import 'package:flutter_proyecto_1/models/Evaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
            "CREATE TABLE CONVOCATORIA(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT,estado TEXT)");
        txn.execute(
            "CREATE TABLE CONEVALUADOR(id INTEGER PRIMARY KEY AUTOINCREMENT, idevaluador INTEGER, idconvocatoria INTEGER)");
      });
    });
  }
  //insertamos convocatoria

  //Eliminamos (si no Encuntra otros registros) y/o  desactivamos ()
  //obtenemos convocatoria con evaluador  con participantes
  //

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
    print("object");
    print(ListaParticipantes);
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

  //********************** */

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
    print(listModel);
    return listModel;
  }

//Eliminar Evaluador
  Future<int> deleteEvaluador(int id) async {
    Database? db = await checkDatabase();
    int res = await db!.delete("EVALUADOR", where: "id=$id");
    return res;
  }
}
