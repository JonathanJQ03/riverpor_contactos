import '../../domain/entities/contacto.dart';
import '../../domain/repositories/contacto_repository.dart';
import '../datasources/contacto_local_datasource.dart';

//6
class ContactoRepositoryImpl implements ContactoRepository {
  final ContactoLocalDatasource local;
  ContactoRepositoryImpl(this.local);

  @override
  Future<void> agregarContacto(Contacto contacto) =>
      local.agregarContacto(contacto);

  @override
  Future<List<Contacto>> obtenerContacos() => local.obtenerContactos();

  @override
  Future<List<Contacto>> obtenerFavoritos() => local.obtenerFavoritos();

  @override
  Future<void> actualizarFavorito(int id, bool valor) =>
      local.actualizarFavorito(id, valor);

  @override
  Future<List<Contacto>> obtenerPorGrupo(int idGrupo) =>
      local.obtenerPorGrupo(idGrupo);
}
