// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ContactosTableTable extends ContactosTable
    with TableInfo<$ContactosTableTable, ContactoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
    'foto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idGrupoMeta = const VerificationMeta(
    'idGrupo',
  );
  @override
  late final GeneratedColumn<int> idGrupo = GeneratedColumn<int>(
    'id_grupo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _favoritoMeta = const VerificationMeta(
    'favorito',
  );
  @override
  late final GeneratedColumn<bool> favorito = GeneratedColumn<bool>(
    'favorito',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorito" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    numero,
    foto,
    idGrupo,
    favorito,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contactos_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContactoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('foto')) {
      context.handle(
        _fotoMeta,
        foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta),
      );
    } else if (isInserting) {
      context.missing(_fotoMeta);
    }
    if (data.containsKey('id_grupo')) {
      context.handle(
        _idGrupoMeta,
        idGrupo.isAcceptableOrUnknown(data['id_grupo']!, _idGrupoMeta),
      );
    } else if (isInserting) {
      context.missing(_idGrupoMeta);
    }
    if (data.containsKey('favorito')) {
      context.handle(
        _favoritoMeta,
        favorito.isAcceptableOrUnknown(data['favorito']!, _favoritoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
      )!,
      foto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto'],
      )!,
      idGrupo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_grupo'],
      )!,
      favorito: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorito'],
      )!,
    );
  }

  @override
  $ContactosTableTable createAlias(String alias) {
    return $ContactosTableTable(attachedDatabase, alias);
  }
}

class ContactoData extends DataClass implements Insertable<ContactoData> {
  final int id;
  final String nombre;
  final String numero;
  final String foto;
  final int idGrupo;
  final bool favorito;
  const ContactoData({
    required this.id,
    required this.nombre,
    required this.numero,
    required this.foto,
    required this.idGrupo,
    required this.favorito,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['numero'] = Variable<String>(numero);
    map['foto'] = Variable<String>(foto);
    map['id_grupo'] = Variable<int>(idGrupo);
    map['favorito'] = Variable<bool>(favorito);
    return map;
  }

  ContactosTableCompanion toCompanion(bool nullToAbsent) {
    return ContactosTableCompanion(
      id: Value(id),
      nombre: Value(nombre),
      numero: Value(numero),
      foto: Value(foto),
      idGrupo: Value(idGrupo),
      favorito: Value(favorito),
    );
  }

  factory ContactoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactoData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      numero: serializer.fromJson<String>(json['numero']),
      foto: serializer.fromJson<String>(json['foto']),
      idGrupo: serializer.fromJson<int>(json['idGrupo']),
      favorito: serializer.fromJson<bool>(json['favorito']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'numero': serializer.toJson<String>(numero),
      'foto': serializer.toJson<String>(foto),
      'idGrupo': serializer.toJson<int>(idGrupo),
      'favorito': serializer.toJson<bool>(favorito),
    };
  }

  ContactoData copyWith({
    int? id,
    String? nombre,
    String? numero,
    String? foto,
    int? idGrupo,
    bool? favorito,
  }) => ContactoData(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    numero: numero ?? this.numero,
    foto: foto ?? this.foto,
    idGrupo: idGrupo ?? this.idGrupo,
    favorito: favorito ?? this.favorito,
  );
  ContactoData copyWithCompanion(ContactosTableCompanion data) {
    return ContactoData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      numero: data.numero.present ? data.numero.value : this.numero,
      foto: data.foto.present ? data.foto.value : this.foto,
      idGrupo: data.idGrupo.present ? data.idGrupo.value : this.idGrupo,
      favorito: data.favorito.present ? data.favorito.value : this.favorito,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactoData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('numero: $numero, ')
          ..write('foto: $foto, ')
          ..write('idGrupo: $idGrupo, ')
          ..write('favorito: $favorito')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, numero, foto, idGrupo, favorito);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactoData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.numero == this.numero &&
          other.foto == this.foto &&
          other.idGrupo == this.idGrupo &&
          other.favorito == this.favorito);
}

class ContactosTableCompanion extends UpdateCompanion<ContactoData> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> numero;
  final Value<String> foto;
  final Value<int> idGrupo;
  final Value<bool> favorito;
  const ContactosTableCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.numero = const Value.absent(),
    this.foto = const Value.absent(),
    this.idGrupo = const Value.absent(),
    this.favorito = const Value.absent(),
  });
  ContactosTableCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String numero,
    required String foto,
    required int idGrupo,
    this.favorito = const Value.absent(),
  }) : nombre = Value(nombre),
       numero = Value(numero),
       foto = Value(foto),
       idGrupo = Value(idGrupo);
  static Insertable<ContactoData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? numero,
    Expression<String>? foto,
    Expression<int>? idGrupo,
    Expression<bool>? favorito,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (numero != null) 'numero': numero,
      if (foto != null) 'foto': foto,
      if (idGrupo != null) 'id_grupo': idGrupo,
      if (favorito != null) 'favorito': favorito,
    });
  }

  ContactosTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? numero,
    Value<String>? foto,
    Value<int>? idGrupo,
    Value<bool>? favorito,
  }) {
    return ContactosTableCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      numero: numero ?? this.numero,
      foto: foto ?? this.foto,
      idGrupo: idGrupo ?? this.idGrupo,
      favorito: favorito ?? this.favorito,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    if (idGrupo.present) {
      map['id_grupo'] = Variable<int>(idGrupo.value);
    }
    if (favorito.present) {
      map['favorito'] = Variable<bool>(favorito.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactosTableCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('numero: $numero, ')
          ..write('foto: $foto, ')
          ..write('idGrupo: $idGrupo, ')
          ..write('favorito: $favorito')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContactosTableTable contactosTable = $ContactosTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactosTable];
}

typedef $$ContactosTableTableCreateCompanionBuilder =
    ContactosTableCompanion Function({
      Value<int> id,
      required String nombre,
      required String numero,
      required String foto,
      required int idGrupo,
      Value<bool> favorito,
    });
typedef $$ContactosTableTableUpdateCompanionBuilder =
    ContactosTableCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> numero,
      Value<String> foto,
      Value<int> idGrupo,
      Value<bool> favorito,
    });

class $$ContactosTableTableFilterComposer
    extends Composer<_$AppDatabase, $ContactosTableTable> {
  $$ContactosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idGrupo => $composableBuilder(
    column: $table.idGrupo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorito => $composableBuilder(
    column: $table.favorito,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContactosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactosTableTable> {
  $$ContactosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idGrupo => $composableBuilder(
    column: $table.idGrupo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorito => $composableBuilder(
    column: $table.favorito,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContactosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactosTableTable> {
  $$ContactosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);

  GeneratedColumn<int> get idGrupo =>
      $composableBuilder(column: $table.idGrupo, builder: (column) => column);

  GeneratedColumn<bool> get favorito =>
      $composableBuilder(column: $table.favorito, builder: (column) => column);
}

class $$ContactosTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContactosTableTable,
          ContactoData,
          $$ContactosTableTableFilterComposer,
          $$ContactosTableTableOrderingComposer,
          $$ContactosTableTableAnnotationComposer,
          $$ContactosTableTableCreateCompanionBuilder,
          $$ContactosTableTableUpdateCompanionBuilder,
          (
            ContactoData,
            BaseReferences<_$AppDatabase, $ContactosTableTable, ContactoData>,
          ),
          ContactoData,
          PrefetchHooks Function()
        > {
  $$ContactosTableTableTableManager(
    _$AppDatabase db,
    $ContactosTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<String> foto = const Value.absent(),
                Value<int> idGrupo = const Value.absent(),
                Value<bool> favorito = const Value.absent(),
              }) => ContactosTableCompanion(
                id: id,
                nombre: nombre,
                numero: numero,
                foto: foto,
                idGrupo: idGrupo,
                favorito: favorito,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String numero,
                required String foto,
                required int idGrupo,
                Value<bool> favorito = const Value.absent(),
              }) => ContactosTableCompanion.insert(
                id: id,
                nombre: nombre,
                numero: numero,
                foto: foto,
                idGrupo: idGrupo,
                favorito: favorito,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContactosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContactosTableTable,
      ContactoData,
      $$ContactosTableTableFilterComposer,
      $$ContactosTableTableOrderingComposer,
      $$ContactosTableTableAnnotationComposer,
      $$ContactosTableTableCreateCompanionBuilder,
      $$ContactosTableTableUpdateCompanionBuilder,
      (
        ContactoData,
        BaseReferences<_$AppDatabase, $ContactosTableTable, ContactoData>,
      ),
      ContactoData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContactosTableTableTableManager get contactosTable =>
      $$ContactosTableTableTableManager(_db, _db.contactosTable);
}
