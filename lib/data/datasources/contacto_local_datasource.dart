import 'package:sqflite/sqflite.dart';
import '../../domain/entities/contacto.dart';
//5: Aqui es donde manejamos los datos como tal

class ContactoLocalDatasource {
  final Database db;
  //Inyectar la base de datos
  ContactoLocalDatasource(this.db);
  //Usamos ñosta de mapas
  //Metodos
  Future<List<Contacto>> obtenerContactos() async {
    //hacer una consulta de la tabla contactos
    final result = await db.query('contactos');

    return result
        .map(
          (e) => Contacto(
            id: e['id'] as int?,
            nombre: e['nombre'] as String,
            descripcion: e['descripcion'] as String,
            foto: e['foto'] as String,
          ),
        )
        .toList();
  }

  Future<void> agregarContacto(Contacto c) async {
    await db.insert('contactos', {
      'nombre': c.nombre,
      'descripcion': c.descripcion,
      'foto': c.foto,
    });
  }
}
