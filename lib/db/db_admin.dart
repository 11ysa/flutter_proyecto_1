import 'dart:io';
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
            "CREATE TABLE JURADO(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellidos TEXT, dni TEXT, edad INTEGER, JERARQUIA TEXT)");
      });
    });
  }

  //insertar participantes
  Future<int> insertParticipante(Participante participante) async {
    Database? db = await checkDatabase();
    int res = await db!.insert("PARTICIPANTE", {
      "nombre": participante.nombre,
      "apellidos": participante.apellidos,
      "dni": participante.dni,
      "edad": participante.edad
    });
    return res;
  }

  //Actualizar Participante
  Future<int> updateParticipante(Participante participante) async {
    Database? db = await checkDatabase();
    int res = await db!.update(
        "PARTICIPANTE",
        {
          "nombre": participante.nombre,
          "apellidos": participante.apellidos,
          "dni": participante.dni,
          "edad": participante.edad
        },
        where: "id=?",
        whereArgs: [participante.id]);

    return res;
  }

  //obtener participantes
  Future<List<Map<String, dynamic>>> getParticipante() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> ListaParticipantes =
        await db!.query("PARTICIPANTE");
    return ListaParticipantes;
  }

  //eliminar Participante
  Future<int> deleteParticipante(int id) async {
    Database? db = await checkDatabase();
    int res = await db!.delete("PARTICIPANTE", where: "id=$id");
    return res;
  }

  //
  //jurado
  insertJurado() async {
    Database? db = await checkDatabase();
    int res = await db!.insert("JURADO", {
      "NOMBRE": "pedro",
      "apellidos": "SANCHEZ",
      "dni": "7519",
      "edad": 22,
      "JERARQUIA": "jefe"
    });
    print(res);
  }

  getJurado() async {
    Database? db = await checkDatabase();
    List jura = await db!.query("JURADO");
    print(jura);
  }
}
