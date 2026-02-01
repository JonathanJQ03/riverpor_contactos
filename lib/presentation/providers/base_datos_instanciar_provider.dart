import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/database.dart';

// Provider de la base de datos
final crearBaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();

  // Insertar contactos por defecto solo si la tabla está vacía
  db.contactosTable.select().get().then((value) {
    if (value.isEmpty) {
      db.insertarContactosPorDefecto();
    }
  });

  return db;
});
