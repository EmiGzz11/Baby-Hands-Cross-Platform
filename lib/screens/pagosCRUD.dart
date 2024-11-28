import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PagosCRUD extends StatefulWidget {
  const PagosCRUD({super.key});

  @override
  State<PagosCRUD> createState() => _PagosCRUDState();
}

class _PagosCRUDState extends State<PagosCRUD> {
  final ref = FirebaseDatabase.instance.ref('Usuarios');
  final searchFilter = TextEditingController();
  final primerNombreC = TextEditingController();
  final segundoNombreC = TextEditingController();
  final primerApellidoC = TextEditingController();
  final segundoApellidoC = TextEditingController();
  final pagoEneroC = TextEditingController();
  final pagoFebreroC = TextEditingController();
  final pagoMarzoC = TextEditingController();
  final pagoAbrilC = TextEditingController();
  final pagoMayoC = TextEditingController();
  final pagoJunioC = TextEditingController();
  final pagoJulioC = TextEditingController();
  final pagoAgostoC = TextEditingController();
  final pagoSeptiembreC = TextEditingController();
  final pagoOctubreC = TextEditingController();
  final pagoNoviembreC = TextEditingController();
  final pagoDiciembreC = TextEditingController();

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
                  final primerNombre =
                      snapshot.child('primerNombre').value.toString();
                  final segundoNombre =
                      snapshot.child('segundoNombre').value.toString();
                  final primerApellido =
                      snapshot.child('primerApellido').value.toString();
                  final segundoApellido =
                      snapshot.child('segundoApellido').value.toString();
                  final pagoEnero =
                      snapshot.child('pagoEnero').value.toString();
                  final pagoFebrero =
                      snapshot.child('pagoFebrero').value.toString();
                  final pagoMarzo =
                      snapshot.child('pagoMarzo').value.toString();
                  final pagoAbril =
                      snapshot.child('pagoAbril').value.toString();
                  final pagoMayo = snapshot.child('pagoMayo').value.toString();
                  final pagoJunio =
                      snapshot.child('pagoJunio').value.toString();
                  final pagoJulio =
                      snapshot.child('pagoJulio').value.toString();
                  final pagoAgosto =
                      snapshot.child('pagoAgosto').value.toString();
                  final pagoSeptiembre =
                      snapshot.child('pagoSeptiembre').value.toString();
                  final pagoOctubre =
                      snapshot.child('pagoOctubre').value.toString();
                  final pagoNoviembre =
                      snapshot.child('pagoNoviembre').value.toString();
                  final pagoDiciembre =
                      snapshot.child('pagoDiciembre').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(
                          ('${snapshot.child('primerNombre').value} ${snapshot.child('segundoNombre').value} ${snapshot.child('primerApellido').value} ${snapshot.child('segundoApellido').value}')),
                      subtitle: Text(
                          'Enero: ${snapshot.child('pagoEnero').value}\nFebrero: ${snapshot.child('pagoFebrero').value}\nMarzo: ${snapshot.child('pagoMarzo').value}\nAbril: ${snapshot.child('pagoAbril').value}\nMayo: ${snapshot.child('pagoMayo').value}\nJunio: ${snapshot.child('pagoJunio').value}\nJulio: ${snapshot.child('pagoJulio').value}\nAgosto: ${snapshot.child('pagoAgosto').value}\nSeptiembre: ${snapshot.child('pagoSeptiembre').value}\nOctubre: ${snapshot.child('pagoOctubre').value}\nNoviembre: ${snapshot.child('pagoNoviembre').value}\nDiciembre: ${snapshot.child('pagoDiciembre').value}\n'),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showMyDialog(
                                      primerNombre,
                                      segundoNombre,
                                      primerApellido,
                                      segundoApellido,
                                      pagoEnero,
                                      pagoFebrero,
                                      pagoMarzo,
                                      pagoAbril,
                                      pagoMayo,
                                      pagoJunio,
                                      pagoJulio,
                                      pagoAgosto,
                                      pagoSeptiembre,
                                      pagoOctubre,
                                      pagoNoviembre,
                                      pagoDiciembre,
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
                  } else if (primerNombre.toLowerCase().contains(
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
      String pagoEnero,
      String pagoFebrero,
      String pagoMarzo,
      String pagoAbril,
      String pagoMayo,
      String pagoJunio,
      String pagoJulio,
      String pagoAgosto,
      String pagoSeptiembre,
      String pagoOctubre,
      String pagoNoviembre,
      String pagoDiciembre,
      String id) async {
    primerNombreC.text = primerNombre;
    segundoNombreC.text = segundoNombre;
    primerApellidoC.text = primerApellido;
    segundoApellidoC.text = segundoApellido;
    pagoEneroC.text = pagoEnero;
    pagoFebreroC.text = pagoFebrero;
    pagoMarzoC.text = pagoMarzo;
    pagoAbrilC.text = pagoAbril;
    pagoMayoC.text = pagoMayo;
    pagoJunioC.text = pagoJunio;
    pagoJulioC.text = pagoJulio;
    pagoAgostoC.text = pagoAgosto;
    pagoSeptiembreC.text = pagoSeptiembre;
    pagoOctubreC.text = pagoOctubre;
    pagoNoviembreC.text = pagoNoviembre;
    pagoDiciembreC.text = pagoDiciembre;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modificar'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Enero',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoEneroC,
                  decoration: const InputDecoration(hintText: 'Pago de Enero'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Febrero',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoFebreroC,
                  decoration:
                      const InputDecoration(hintText: 'Pago de Febrero'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Marzo',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoMarzoC,
                  decoration: const InputDecoration(hintText: 'Pago de Marzo'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Abril',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoAbrilC,
                  decoration: const InputDecoration(hintText: 'Pago de Abril'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Mayo',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoMayoC,
                  decoration: const InputDecoration(hintText: 'Pago de Mayo'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Junio',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoJunioC,
                  decoration: const InputDecoration(hintText: 'Pago de Junio'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Julio',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoJulioC,
                  decoration: const InputDecoration(hintText: 'Pago de Julio'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Agosto',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoAgostoC,
                  decoration: const InputDecoration(hintText: 'Pago de Agosto'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Septiembre',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoSeptiembreC,
                  decoration:
                      const InputDecoration(hintText: 'Pago de Septiembre'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Octubre',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoOctubreC,
                  decoration:
                      const InputDecoration(hintText: 'Pago de Octubre'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Noviembre',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoNoviembreC,
                  decoration:
                      const InputDecoration(hintText: 'Pago de Noviembre'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Diciembre',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: pagoDiciembreC,
                  decoration:
                      const InputDecoration(hintText: 'Pago de Diciembre'),
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
                  'pagoEnero': pagoEneroC.text,
                  'pagoFebrero': pagoFebreroC.text,
                  'pagoMarzo': pagoMarzoC.text,
                  'pagoAbril': pagoAbrilC.text,
                  'pagoMayo': pagoMayoC.text,
                  'pagoJunio': pagoJunioC.text,
                  'pagoJulio': pagoJulioC.text,
                  'pagoAgosto': pagoAgostoC.text,
                  'pagoSeptiembre': pagoSeptiembreC.text,
                  'pagoOctubre': pagoJulioC.text,
                  'pagoNoviembre': pagoNoviembreC.text,
                  'pagoDiciembre': pagoDiciembreC.text
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
