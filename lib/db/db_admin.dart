import 'dart:io';
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

  insertLicences1() async {
    Database? db = await checkDatabase();
    int res = await db!.insert("LICENSE", {
      "name": "JHON10",
      "dni": "alarcon",
      "url": "75197145",
    });
    print(res);
  }

  insertLicences3() async {
    Database? db = await checkDatabase();
    int res = await db!.insert("LICENSE3", {
      "name": "JHON10",
      "dni": "alarcon",
      "url": "75197145",
    });
    print(res);
  }

  getParticipante() async {
    Database? db = await checkDatabase();

    List parti = await db!.query("PARTICIPANTE");
    print(parti);
  }

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
