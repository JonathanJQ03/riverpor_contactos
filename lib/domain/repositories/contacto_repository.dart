//Definir que operaciones voy hacer mas no como
import '../entities/contacto.dart';

//2
abstract class ContactoRepository {
  //Future: Definimos que vamos a hacer mas no como
  Future<List<Contacto>> obtenerContacos();
  //Void: Debido a que no se me va a retornar nada
  Future<void> agregarContacto(Contacto contacto);
}
