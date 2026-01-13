import '../../domain/entities/contacto.dart';
import '../../domain/repositories/contacto_repository.dart';

//3
class GestionarContactos {
  //inyeccion de dependencias
  final ContactoRepository repository;
  GestionarContactos(this.repository);
  //metodos
  //Recibir entidades contactos y luego pasarlo a los repositorios
  Future<List<Contacto>> listar() {
    //este metodo viene de nuestro repositorio
    return repository.obtenerContacos();
  }

  //Dentro del () va que objeto voy a manipulor
  Future<void> agregar(Contacto c) {
    //Metodo del return que proviene tambien del repositorio
    return repository.agregarContacto(c);
  }
}
