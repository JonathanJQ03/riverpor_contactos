class Contacto {
  final int? id;
  final String nombre;
  final String numero;
  final String? foto; // ruta a la foto o null
  final bool favorito;
  final int idGrupo;

  Contacto({
    this.id,
    required this.nombre,
    required this.numero,
    required this.foto,
    this.favorito = false,
    required this.idGrupo,
  });
}
