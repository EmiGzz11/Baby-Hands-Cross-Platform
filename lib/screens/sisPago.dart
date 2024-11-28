import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SisPago extends StatefulWidget {
  const SisPago({super.key});

  @override
  State<SisPago> createState() => _SisPagoState();
}

class _SisPagoState extends State<SisPago> {
  final ref = FirebaseDatabase.instance.ref('Usuarios');

  User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          user = snapshot.data!;
          return StreamBuilder(
            stream: ref.child(user!.uid).onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                String pagoEnero = map['pagoEnero'];
                String pagoFebrero = map['pagoFebrero'];
                String pagoMarzo = map['pagoMarzo'];
                String pagoAbril = map['pagoAbril'];
                String pagoMayo = map['pagoMayo'];
                String pagoJunio = map['pagoJunio'];
                String pagoJulio = map['pagoJulio'];
                String pagoAgosto = map['pagoAgosto'];
                String pagoSeptiembre = map['pagoSeptiembre'];
                String pagoOctubre = map['pagoOctubre'];
                String pagoNoviembre = map['pagoNoviembre'];
                String pagoDiciembre = map['pagoDiciembre'];

                Widget dynamicText;
                Widget dynamicText2;
                Widget dynamicText3;
                Widget dynamicText4;
                Widget dynamicText5;
                Widget dynamicText6;
                Widget dynamicText7;
                Widget dynamicText8;
                Widget dynamicText9;
                Widget dynamicText10;
                Widget dynamicText11;
                Widget dynamicText12;

                dynamicText = Text(
                  'Febrero: $pagoFebrero',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText2 = Text(
                  'Enero: $pagoEnero',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText3 = Text(
                  'Marzo: $pagoMarzo',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText4 = Text(
                  'Abril: $pagoAbril',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText5 = Text(
                  'Mayo: $pagoMayo',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText6 = Text(
                  'Junio: $pagoJunio',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText7 = Text(
                  'Julio: $pagoJulio',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText8 = Text(
                  'Agosto: $pagoAgosto',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText9 = Text(
                  'Septiembre: $pagoSeptiembre',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText10 = Text(
                  'Octubre: $pagoOctubre',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText11 = Text(
                  'Noviembre: $pagoNoviembre',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );
                dynamicText12 = Text(
                  'Diciembre: $pagoDiciembre',
                  style: const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                );

                return Scaffold(
                  body: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/fondo.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView(
                      children: [
                        Image.asset(
                          'assets/img/pagos.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/img/infosispagos.png',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Column(
                              children: [
                                dynamicText2,
                                const SizedBox(height: 10),
                                dynamicText,
                                const SizedBox(height: 10),
                                dynamicText3,
                                const SizedBox(height: 10),
                                dynamicText4,
                                const SizedBox(height: 10),
                                dynamicText5,
                                const SizedBox(height: 10),
                                dynamicText6,
                                const SizedBox(height: 10),
                                dynamicText7,
                                const SizedBox(height: 10),
                                dynamicText8,
                                const SizedBox(height: 10),
                                dynamicText9,
                                const SizedBox(height: 10),
                                dynamicText10,
                                const SizedBox(height: 10),
                                dynamicText11,
                                const SizedBox(height: 10),
                                dynamicText12,
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }
            },
          );
        } else {
          return Center(
            child: Text(
              'User is not logged in',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
      },
    );
  }
}
