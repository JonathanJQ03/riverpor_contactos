import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/contacto.dart';
import '../providers/cargar_base_provider.dart';

class ContactosPage extends ConsumerStatefulWidget {
  const ContactosPage({super.key});

  @override
  ConsumerState<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends ConsumerState<ContactosPage> {
  int _selectedIndex = 0;
  String? _grupoSeleccionado;
  String? _fotoSeleccionada;

  final List<String> grupos = [
    'Familia',
    'Trabajo',
    'Amigos',
    'Escuela',
    'Deporte',
    'Clubes',
  ];

  final List<String> fotos = [
    'assets/fotos_perfil/fotoperfil1.png',
    'assets/fotos_perfil/fotoperfil2.png',
    'assets/fotos_perfil/fotoperfil3.png',
    'assets/fotos_perfil/fotoperfil4.png',
    'assets/fotos_perfil/fotoperfil5.png',
    'assets/fotos_perfil/fotoperfil6.png',
    'assets/fotos_perfil/fotoperfil7.png',
    'assets/fotos_perfil/fotoperfil8.png',
    'assets/fotos_perfil/fotoperfil9.png',
    'assets/fotos_perfil/fotoperfil10.png',
  ];

  final Map<int, bool> _grupoExpandido = {};

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    final provider = ref.read(contactoProvider.notifier);
    switch (_selectedIndex) {
      case 0:
        provider.cargar(); // Todos los contactos
        break;
      case 1:
        provider.cargarFavoritos(); // Solo favoritos
        break;
      case 2:
        provider.cargarPorGrupoTodos(); // Todos los contactos por grupos
        for (int i = 0; i < grupos.length; i++) {
          _grupoExpandido[i] = false;
        }
        break;
    }
  }

  bool validarNumero(String numero) {
    return numero.length == 10 && numero.startsWith('09');
  }

  void _abrirDialogAgregarContacto() {
    final nombreCtrl = TextEditingController();
    final numeroCtrl = TextEditingController();

    _grupoSeleccionado = grupos.isNotEmpty
        ? (_grupoSeleccionado ?? grupos[0])
        : null;
    _fotoSeleccionada = fotos.isNotEmpty
        ? (_fotoSeleccionada ?? fotos[0])
        : null;

    if (_grupoSeleccionado == null || _fotoSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay grupos o fotos disponibles')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Colors.grey[850],
              title: const Text(
                'Agregar Contacto',
                style: TextStyle(color: Colors.red),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombreCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: numeroCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Número Telefónico',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      dropdownColor: Colors.grey[800],
                      value: _grupoSeleccionado,
                      isExpanded: true,
                      items: grupos
                          .map(
                            (g) => DropdownMenuItem(
                              value: g,
                              child: Text(
                                g,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) => setDialogState(() {
                        _grupoSeleccionado = val;
                      }),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Seleccionar Foto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // CAMBIO AQUÍ: Usar Wrap en lugar de ListView.builder
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: fotos.map((f) {
                        return GestureDetector(
                          onTap: () => setDialogState(() {
                            _fotoSeleccionada = f;
                          }),
                          child: Container(
                            padding: _fotoSeleccionada == f
                                ? const EdgeInsets.all(3)
                                : null,
                            decoration: BoxDecoration(
                              border: _fotoSeleccionada == f
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(f),
                              radius: 30,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    if (nombreCtrl.text.isEmpty ||
                        numeroCtrl.text.isEmpty ||
                        _grupoSeleccionado == null)
                      return;

                    if (!validarNumero(numeroCtrl.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ingrese un número válido de 10 dígitos empezando con 09',
                          ),
                        ),
                      );
                      return;
                    }

                    await ref
                        .read(contactoProvider.notifier)
                        .agregar(
                          Contacto(
                            nombre: nombreCtrl.text,
                            numero: numeroCtrl.text,
                            foto: _fotoSeleccionada,
                            idGrupo: grupos.indexOf(_grupoSeleccionado!),
                          ),
                        );

                    Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactos = ref.watch(contactoProvider);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Tus Contactos', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black87,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: _abrirDialogAgregarContacto,
      ),
      body: contactos.when(
        data: (list) {
          list.sort(
            (a, b) => a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()),
          );

          if (_selectedIndex != 2) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, i) => _buildTile(list[i]),
            );
          } else {
            return ListView(
              children: grupos.asMap().entries.map((entry) {
                int grupoId = entry.key;
                String grupoNombre = entry.value;
                final contactosGrupo = list
                    .where((c) => c.idGrupo == grupoId)
                    .toList();
                if (contactosGrupo.isEmpty) return const SizedBox.shrink();
                return ExpansionTile(
                  backgroundColor: Colors.grey[850],
                  collapsedBackgroundColor: Colors.grey[800],
                  title: Text(
                    grupoNombre,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  initiallyExpanded: _grupoExpandido[grupoId] ?? false,
                  onExpansionChanged: (val) =>
                      setState(() => _grupoExpandido[grupoId] = val),
                  children: contactosGrupo.map(_buildTile).toList(),
                );
              }).toList(),
            );
          }
        },
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.red)),
        error: (e, _) => Center(
          child: Text(e.toString(), style: const TextStyle(color: Colors.red)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Todos'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Grupos'),
        ],
      ),
    );
  }

  Widget _buildTile(Contacto c) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: (c.foto != null && c.foto!.isNotEmpty)
            ? CircleAvatar(backgroundImage: AssetImage(c.foto!))
            : const CircleAvatar(child: Icon(Icons.person, color: Colors.red)),
        title: Text(c.nombre, style: const TextStyle(color: Colors.white)),
        subtitle: Text(c.numero, style: TextStyle(color: Colors.grey[400])),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: c.favorito
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () =>
                  ref.read(contactoProvider.notifier).toggleFavorito(c),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                c.nombre[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
