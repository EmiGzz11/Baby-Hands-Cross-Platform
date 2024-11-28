import 'package:babyhands2/screens/actividades.dart';
import 'package:babyhands2/screens/admin.dart';
import 'package:babyhands2/screens/adminData.dart';

import 'package:babyhands2/screens/info.dart';
import 'package:babyhands2/screens/pagosCRUD.dart';

import 'package:babyhands2/screens/sisPago.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'monitoreo.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  int _selectDrawerItem = 0;
  User? user;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Monitoreo();
      case 1:
        return const Info();
      case 2:
        return const Actividades();
      case 3:
        return const SisPago();
      case 4:
        return const Datos();
      case 5:
        return const Admin();
      case 6:
        return const PagosCRUD();
    }
  }

  menuAdmin() {}
  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  final ref = FirebaseDatabase.instance.ref('Usuarios');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              user = snapshot.data;

              String? email = user!.email;
              switch (email) {
                case 'gemiliano090@gmail.com':
                  return StreamBuilder(
                      stream: ref.child(user!.uid).onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          Map<dynamic, dynamic> map =
                              snapshot.data.snapshot.value;

                          return Scaffold(
                            appBar: AppBar(
                              title: const Text('Baby Hands App'),
                              backgroundColor: Colors.amber,
                            ),
                            body: _getDrawerItemWidget(_selectDrawerItem),
                            drawer: Drawer(
                              child: ListView(
                                children: <Widget>[
                                  UserAccountsDrawerHeader(
                                    accountName: Text(map['segundoNombre'] +
                                        ' ' +
                                        map['primerApellido']),
                                    accountEmail: Text(user!.email!),
                                    currentAccountPicture: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/img/logo.png'),
                                    ),
                                  ),
                                  ListTile(
                                      title: const Text('Monitoreo'),
                                      leading: const Icon(Icons.videocam),
                                      selected: (0 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(0);
                                      }),
                                  ListTile(
                                      title: const Text('Acerca de Nosotros'),
                                      leading: const Icon(Icons.info_outline),
                                      selected: (1 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(1);
                                      }),
                                  ListTile(
                                      title: const Text('Actividades'),
                                      leading: const Icon(Icons.calendar_month),
                                      selected: (2 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(2);
                                      }),
                                  ListTile(
                                      title: const Text('Sistema de Pago'),
                                      leading: const Icon(
                                          Icons.monetization_on_outlined),
                                      selected: (3 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(3);
                                      }),
                                  const Divider(),
                                  ListTile(
                                      title: const Text('Administrar'),
                                      leading: const Icon(
                                          Icons.admin_panel_settings),
                                      selected: (4 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(4);
                                      }),
                                  ListTile(
                                      title: const Text('Agregar Usario'),
                                      leading: const Icon(Icons.person_add),
                                      selected: (5 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(5);
                                      }),
                                  ListTile(
                                      title: const Text('Revision de Pagos'),
                                      leading:
                                          const Icon(Icons.payments_outlined),
                                      selected: (7 == _selectDrawerItem),
                                      onTap: () {
                                        _onSelectItem(7);
                                      }),
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Cerrar Sesion'),
                                    leading:
                                        const Icon(Icons.power_settings_new),
                                    onTap: () =>
                                        FirebaseAuth.instance.signOut(),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(
                              child: Text(
                            'Something went wrong',
                            style: Theme.of(context).textTheme.titleMedium,
                          ));
                        }
                      });

                default:
              }
              return StreamBuilder(
                  stream: ref.child(user!.uid).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Baby Hands App'),
                          backgroundColor: Colors.amber,
                        ),
                        body: _getDrawerItemWidget(_selectDrawerItem),
                        drawer: Drawer(
                          child: ListView(
                            children: <Widget>[
                              UserAccountsDrawerHeader(
                                accountName: Text(map['segundoNombre'] +
                                    ' ' +
                                    map['primerApellido']),
                                accountEmail: Text(user!.email!),
                                currentAccountPicture: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/img/logo.png'),
                                ),
                              ),
                              ListTile(
                                  title: const Text('Monitoreo'),
                                  leading: const Icon(Icons.videocam),
                                  selected: (0 == _selectDrawerItem),
                                  onTap: () {
                                    _onSelectItem(0);
                                  }),
                              ListTile(
                                  title: const Text('Acerca de Nosotros'),
                                  leading: const Icon(Icons.info_outline),
                                  selected: (1 == _selectDrawerItem),
                                  onTap: () {
                                    _onSelectItem(1);
                                  }),
                              ListTile(
                                  title: const Text('Actividades'),
                                  leading: const Icon(Icons.calendar_month),
                                  selected: (2 == _selectDrawerItem),
                                  onTap: () {
                                    _onSelectItem(2);
                                  }),
                              ListTile(
                                  title: const Text('Sistema de Pago'),
                                  leading: const Icon(
                                      Icons.monetization_on_outlined),
                                  selected: (3 == _selectDrawerItem),
                                  onTap: () {
                                    _onSelectItem(3);
                                  }),
                              const Divider(),
                              ListTile(
                                title: const Text('Cerrar Sesion'),
                                leading: const Icon(Icons.power_settings_new),
                                onTap: () => FirebaseAuth.instance.signOut(),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          child: Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.titleMedium,
                      ));
                    }
                  });
            } else {
              return Center(
                  child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.titleMedium,
              ));
            }
          },
        ),
      ),
    );
  }
}
