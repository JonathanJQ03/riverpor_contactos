import '../../domain/entities/contacto.dart';
import '../../domain/repositories/contacto_repository.dart';

//3
/// Casos de uso de contactos, recibe entidades y delega al repositorio
class GestionarContactos {
  final ContactoRepository repository;
  GestionarContactos(this.repository);

  Future<List<Contacto>> listar() => repository.obtenerContacos();
  Future<void> agregar(Contacto c) => repository.agregarContacto(c);
  Future<List<Contacto>> listarFavoritos() => repository.obtenerFavoritos();
  Future<void> actualizarFavorito(int id, bool valor) =>
      repository.actualizarFavorito(id, valor);
  Future<List<Contacto>> obtenerGrupo(int idGrupo) =>
      repository.obtenerPorGrupo(idGrupo);
}
