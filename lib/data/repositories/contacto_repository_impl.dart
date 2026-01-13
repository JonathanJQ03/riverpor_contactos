//6:
import '../../domain/entities/contacto.dart';
import '../../domain/repositories/contacto_repository.dart';
import '../datasources/contacto_local_datasource.dart';

class ContactoRepositoryImpl implements ContactoRepository {
  final ContactoLocalDatasource local;
  ContactoRepositoryImpl(this.local);

  @override
  Future<void> agregarContacto(Contacto contacto) {
    return local.agregarContacto(contacto);
  }

  @override
  Future<List<Contacto>> obtenerContacos() {
    return local.obtenerContactos();
  }
}
