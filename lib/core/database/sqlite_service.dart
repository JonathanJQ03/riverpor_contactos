// Capa core 4
// Aqui es donde se manipula la parte del database recordando que es una base empotrada
// Entonces debemos escribir en lenguaje de era base de datos

//ORM: Object Relational Mapping
//ORM drift es lo que mejor se usa para flutter junto al drift asi evitamos el texto plano
//ORM Floor es otra opcion pero es menos potente que drift

//En este momento vamos a hacer por texto plano
import 'package:sqflite/sqflite.dart'; //Paquete para manejar sqlite y trabajar con ella
import 'package:path/path.dart'; //Manejar archivos y rutas de archivos

class SqliteService {
  //Aqui es donde abrimos la base de datos, crearlas, usarla y hacer todo
  //crear, abrir, configurar la BBDD
  static Future<Database> init() async {
    //Forma de crear la base de datos
    final path = join(await getDatabasesPath(), 'contactos.db');
    //abro la base
    return openDatabase(
      path,
      version: 1,
      //La version no es importante mencionarla por eso va _
      onCreate: (db, _) async {
        //Comenzamos a crear la base de datos
        //Multilinea para poder escribir varias lineas y la base de datos no de error
        await db.execute('''
          CREATE TABLE contactos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT ,
            descripcion TEXT ,
            foto TEXT 
          )
          ''');
      },
    );
  }
}
