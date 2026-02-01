import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('ContactoData')
class ContactosTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get numero => text()();
  TextColumn get foto => text()(); // guardaremos la ruta completa del asset
  IntColumn get idGrupo => integer()();
  BoolColumn get favorito => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [ContactosTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Insertar contactos por defecto
  Future<void> insertarContactosPorDefecto() async {
    final contactosDefecto = [
      {
        'nombre': 'Alice',
        'numero': '0991111111',
        'foto': 'assets/fotos_perfil/fotoperfil1.png',
        'idGrupo': 1,
      },
      {
        'nombre': 'Bob',
        'numero': '0992222222',
        'foto': 'assets/fotos_perfil/fotoperfil2.png',
        'idGrupo': 1,
      },
      {
        'nombre': 'Carlos',
        'numero': '0993333333',
        'foto': 'assets/fotos_perfil/fotoperfil3.png',
        'idGrupo': 2,
      },
      {
        'nombre': 'Diana',
        'numero': '0994444444',
        'foto': 'assets/fotos_perfil/fotoperfil4.png',
        'idGrupo': 2,
      },
      {
        'nombre': 'Eva',
        'numero': '0995555555',
        'foto': 'assets/fotos_perfil/fotoperfil5.png',
        'idGrupo': 3,
      },
      {
        'nombre': 'Fernando',
        'numero': '0996666666',
        'foto': 'assets/fotos_perfil/fotoperfil6.png',
        'idGrupo': 3,
      },
      {
        'nombre': 'Gina',
        'numero': '0997777777',
        'foto': 'assets/fotos_perfil/fotoperfil7.png',
        'idGrupo': 4,
      },
      {
        'nombre': 'Hugo',
        'numero': '0998888888',
        'foto': 'assets/fotos_perfil/fotoperfil8.png',
        'idGrupo': 4,
      },
      {
        'nombre': 'Irene',
        'numero': '0999999999',
        'foto': 'assets/fotos_perfil/fotoperfil9.png',
        'idGrupo': 5,
      },
      {
        'nombre': 'Jorge',
        'numero': '0990000000',
        'foto': 'assets/fotos_perfil/fotoperfil10.png',
        'idGrupo': 5,
      },
      {
        'nombre': 'Karen',
        'numero': '0991234567',
        'foto': 'assets/fotos_perfil/fotoperfil1.png',
        'idGrupo': 1,
      },
      {
        'nombre': 'Luis',
        'numero': '0992345678',
        'foto': 'assets/fotos_perfil/fotoperfil2.png',
        'idGrupo': 2,
      },
      {
        'nombre': 'Marta',
        'numero': '0993456789',
        'foto': 'assets/fotos_perfil/fotoperfil3.png',
        'idGrupo': 3,
      },
      {
        'nombre': 'Nico',
        'numero': '0994567890',
        'foto': 'assets/fotos_perfil/fotoperfil4.png',
        'idGrupo': 4,
      },
      {
        'nombre': 'Olga',
        'numero': '0995678901',
        'foto': 'assets/fotos_perfil/fotoperfil5.png',
        'idGrupo': 5,
      },
    ];

    for (final c in contactosDefecto) {
      await into(contactosTable).insert(
        ContactosTableCompanion(
          nombre: Value(c['nombre']! as String),
          numero: Value(c['numero']! as String),
          foto: Value(c['foto']! as String),
          idGrupo: Value(c['idGrupo']! as int),
          favorito: const Value(false),
        ),
      );
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
