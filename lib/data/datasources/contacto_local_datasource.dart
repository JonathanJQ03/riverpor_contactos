// ignore: unused_import
import 'dart:io';
import 'package:drift/drift.dart';
import '../../domain/entities/contacto.dart';
import '../../core/database/database.dart';

class ContactoLocalDatasource {
  final AppDatabase db;
  ContactoLocalDatasource(this.db);

  // Obtener todos los contactos
  Future<List<Contacto>> obtenerContactos() async {
    final rows = await db.select(db.contactosTable).get();

    final contactos = rows
        .map(
          (row) => Contacto(
            id: row.id,
            nombre: row.nombre,
            numero: row.numero,
            foto: row.foto,
            favorito: row.favorito,
            idGrupo: row.idGrupo,
          ),
        )
        .toList();

    // Ordenar alfabéticamente
    contactos.sort(
      (a, b) => a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()),
    );

    return contactos;
  }

  // Agregar un contacto
  Future<void> agregarContacto(Contacto c) async {
    await db
        .into(db.contactosTable)
        .insert(
          ContactosTableCompanion(
            nombre: Value(c.nombre.isNotEmpty ? c.nombre : 'Sin Nombre'),
            numero: Value(c.numero),
            foto: Value(c.foto ?? ''),
            favorito: Value(c.favorito),
            idGrupo: Value(c.idGrupo),
          ),
        );
  }

  // Obtener contactos favoritos
  Future<List<Contacto>> obtenerFavoritos() async {
    final rows = await (db.select(
      db.contactosTable,
    )..where((t) => t.favorito.equals(true))).get();

    return rows
        .map(
          (row) => Contacto(
            id: row.id,
            nombre: row.nombre,
            numero: row.numero,
            foto: row.foto,
            favorito: row.favorito,
            idGrupo: row.idGrupo,
          ),
        )
        .toList();
  }

  // Actualizar favorito
  Future<void> actualizarFavorito(int id, bool valor) async {
    await (db.update(db.contactosTable)..where((t) => t.id.equals(id))).write(
      ContactosTableCompanion(favorito: Value(valor)),
    );
  }

  // Obtener contactos por grupo
  Future<List<Contacto>> obtenerPorGrupo(int idGrupo) async {
    final rows = await (db.select(
      db.contactosTable,
    )..where((t) => t.idGrupo.equals(idGrupo))).get();

    return rows
        .map(
          (row) => Contacto(
            id: row.id,
            nombre: row.nombre,
            numero: row.numero,
            foto: row.foto,
            favorito: row.favorito,
            idGrupo: row.idGrupo,
          ),
        )
        .toList();
  }
}
