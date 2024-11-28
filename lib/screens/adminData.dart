import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  final ref = FirebaseDatabase.instance.ref('Usuarios');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();
  final segundoNombreC = TextEditingController();
  final primerApellidoC = TextEditingController();
  final segundoApellidoC = TextEditingController();
  final nombreB1C = TextEditingController();
  final telefonoC = TextEditingController();
  final calleC = TextEditingController();
  final numeroC = TextEditingController();
  final coloniaC = TextEditingController();
  final codigoPostalC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                  hintText: 'Buscar...', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('primerNombre').value.toString();
                  final segundoNombre =
                      snapshot.child('segundoNombre').value.toString();
                  final primerApellido =
                      snapshot.child('primerApellido').value.toString();
                  final segundoApellido =
                      snapshot.child('segundoApellido').value.toString();
                  final nombreB1 = snapshot.child('nombreB1').value.toString();
                  final telefono = snapshot.child('telefono').value.toString();
                  final calle = snapshot.child('calle').value.toString();
                  final numero = snapshot.child('numero').value.toString();
                  final colonia = snapshot.child('colonia').value.toString();
                  final codigoPostal =
                      snapshot.child('codigoPostal').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(
                          ('${snapshot.child('primerNombre').value} ${snapshot.child('segundoNombre').value} ${snapshot.child('primerApellido').value} ${snapshot.child('segundoApellido').value}')),
                      subtitle: Text(
                          'Hij@(s): ${snapshot.child('nombreB1').value}\nTelefono: ${snapshot.child('telefono').value}\nDireccion: ${snapshot.child('calle').value} ${snapshot.child('numero').value} ${snapshot.child('colonia').value} ${snapshot.child('codigoPostal').value}\nEmail: ${snapshot.child('email').value}'),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showMyDialog(
                                      title,
                                      segundoNombre,
                                      primerApellido,
                                      segundoApellido,
                                      nombreB1,
                                      telefono,
                                      calle,
                                      numero,
                                      colonia,
                                      codigoPostal,
                                      snapshot.child('uid').value.toString());
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Modificar'),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  eliminado();
                                  ref
                                      .child(snapshot
                                          .child('uid')
                                          .value
                                          .toString())
                                      .remove();
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text('Eliminar'),
                              ))
                        ],
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                      searchFilter.text.toLowerCase().toLowerCase())) {
                    return ListTile(
                      title: Text(
                          ('${snapshot.child('primerNombre').value} ${snapshot.child('segundoNombre').value} ${snapshot.child('primerApellido').value} ${snapshot.child('segundoApellido').value}')),
                      subtitle: Text(
                          'Hij@(s): ${snapshot.child('nombreB1').value}\nTelefono: ${snapshot.child('telefono').value}\nDireccion: ${snapshot.child('calle').value} ${snapshot.child('numero').value} ${snapshot.child('colonia').value} ${snapshot.child('codigoPostal').value}\nEmail: ${snapshot.child('email').value}'),
                    );
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }

  Future<void> showMyDialog(
      String primerNombre,
      String segundoNombre,
      String primerApellido,
      String segundoApellido,
      String nombreb1,
      String telefono,
      String calle,
      String numero,
      String colonia,
      String codigoPostal,
      String id) async {
    editController.text = primerNombre;
    segundoNombreC.text = segundoNombre;
    primerApellidoC.text = primerApellido;
    segundoApellidoC.text = segundoApellido;
    nombreB1C.text = nombreb1;
    telefonoC.text = telefono;
    calleC.text = calle;
    numeroC.text = numero;
    coloniaC.text = colonia;
    codigoPostalC.text = codigoPostal;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modificar'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: editController,
                  decoration: const InputDecoration(hintText: 'Primer Nombre'),
                ),
                TextField(
                  controller: segundoNombreC,
                  decoration: const InputDecoration(hintText: 'Segundo Nombre'),
                ),
                TextField(
                  controller: primerApellidoC,
                  decoration:
                      const InputDecoration(hintText: 'Primer Apellido'),
                ),
                TextField(
                  controller: segundoApellidoC,
                  decoration:
                      const InputDecoration(hintText: 'Segundo Apellido'),
                ),
                TextField(
                  controller: nombreB1C,
                  decoration: const InputDecoration(
                      hintText: 'Nombre(s) de los Hij@(s)'),
                ),
                TextField(
                  controller: telefonoC,
                  decoration: const InputDecoration(hintText: 'Telefono'),
                ),
                TextField(
                  controller: calleC,
                  decoration: const InputDecoration(hintText: 'Calle'),
                ),
                TextField(
                  controller: numeroC,
                  decoration: const InputDecoration(hintText: 'Numero de casa'),
                ),
                TextField(
                  controller: coloniaC,
                  decoration: const InputDecoration(hintText: 'Colonia'),
                ),
                TextField(
                  controller: codigoPostalC,
                  decoration: const InputDecoration(hintText: 'Codigo Postal'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showToast();
                // Actualizar los datos
                ref.child(id).update({
                  'primerNombre': editController.text,
                  'segundoNombre': segundoNombreC.text,
                  'primerApellido': primerApellidoC.text,
                  'segundoApellido': segundoApellidoC.text,
                  'nombreB1': nombreB1C.text,
                  'telefono': telefonoC.text,
                  'calle': calleC.text,
                  'numero': numeroC.text,
                  'colonia': coloniaC.text,
                  'codigoPostal': codigoPostalC.text
                }).then((value) {
                  print(" actualizo$id");
                }).onError((error, stackTrace) {
                  print("no actualizo");
                });
              },
              child: const Text('Actualizar'),
            ),
          ],
        );
      },
    );
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "Actualizado",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  eliminado() {
    Fluttertoast.showToast(
        msg: "Eliminado",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
