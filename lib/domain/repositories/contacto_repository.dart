//Definir que operaciones voy hacer mas no como
import '../entities/contacto.dart';

//2
/// Repositorio de contactos, define operaciones pero no implementa
abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContacos();
  Future<void> agregarContacto(Contacto contacto);
  Future<List<Contacto>> obtenerFavoritos();
  Future<void> actualizarFavorito(int id, bool valor);
  Future<List<Contacto>> obtenerPorGrupo(int idGrupo);
}
