import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/domain/entities/contacto.dart';
import 'package:riverpod_app/application/usecases/gestionar_contactos.dart';
import 'base_datos_instanciar_provider.dart';
import 'package:riverpod_app/data/repositories/contacto_repository_impl.dart';
import 'package:riverpod_app/data/datasources/contacto_local_datasource.dart';

final contactoProvider =
    StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>((ref) {
      // Crear DB
      final db = ref.read(crearBaseProvider);

      // Crear datasource y repositorio
      final localDatasource = ContactoLocalDatasource(db);
      final repository = ContactoRepositoryImpl(localDatasource);

      // Crear usecase
      final usecase = GestionarContactos(repository);

      // Pasarlo al notifier
      return ContactoNotifier(usecase);
    });

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  final GestionarContactos usecase;

  ContactoNotifier(this.usecase) : super(const AsyncLoading()) {
    cargar();
  }

  Future<void> cargar() async {
    final contactos = await usecase.listar();
    contactos.sort((a, b) => a.nombre.compareTo(b.nombre));
    state = AsyncData(contactos);
  }

  Future<void> cargarPorGrupo(int idGrupo) async {
    final contactos = await usecase.obtenerGrupo(idGrupo);
    contactos.sort((a, b) => a.nombre.compareTo(b.nombre));
    state = AsyncData(contactos);
  }

  Future<void> cargarFavoritos() async {
    final contactos = await usecase.listarFavoritos();
    contactos.sort((a, b) => a.nombre.compareTo(b.nombre));
    state = AsyncData(contactos);
  }

  Future<void> agregar(Contacto c) async {
    await usecase.agregar(c);
    await cargar();
  }

  Future<void> toggleFavorito(Contacto c) async {
    await usecase.actualizarFavorito(c.id!, !c.favorito);
    await cargar();
  }

  Future<void> cargarPorGrupoTodos() async {
    final contactos = await usecase.listar();
    contactos.sort((a, b) => a.nombre.compareTo(b.nombre));
    state = AsyncData(contactos);
  }
}
