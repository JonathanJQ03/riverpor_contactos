// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_app/core/database/sqlite_service.dart';
import '../../domain/entities/contacto.dart';

import '../../data/repositories/contacto_repository_impl.dart';
import '../../application/usecases/gestionar_contactos.dart';

//7
//manejamos el estada
//reiverpod maneja 3 estados
final contactoProvider =
    StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
      (ref) => ContactoNotifier(),
    );

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  //Super constructor
  ContactoNotifier() : super(AsyncLoading()) {
    //Cargar los contactos al iniciar
    cargar();
  }

  //late: Declarar una dependencia que se inicializara despues
  late GestionarContactos usecase;

  Future<void> cargar() async {
    final db = await SqliteService.init();
    usecase = GestionarContactos(
      ContactoRepositoryImpl(ContactoLocalDatasource(db)),
    );
    state = AsyncData(await usecase.listar());
  }

  Future<void> agregar(Contacto c) async {
    //Agregar contacto
    await usecase.agregar(c);
    //Recargar la lista
    cargar();
  }
}
