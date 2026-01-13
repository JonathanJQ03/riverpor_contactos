//1
class Contacto {
  //id: generado de la base de datos
  //?: puede ser nulo
  final int? id;
  final String nombre;
  final String descripcion;
  final String foto;

  Contacto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.foto,
  });
}
