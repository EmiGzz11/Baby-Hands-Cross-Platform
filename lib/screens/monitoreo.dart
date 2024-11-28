import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Monitoreo extends StatefulWidget {
  const Monitoreo({Key? key}) : super(key: key);

  @override
  State<Monitoreo> createState() => _MonitoreoState();
}

class _MonitoreoState extends State<Monitoreo> {
  late VlcPlayerController _vlcPlayerController;

  late Timer timer;
  late String horaActual;

  @override
  void initState() {
    super.initState();
    _camara1Controller(); // Llamar al método de inicialización
    horaActual = obtenerHoraActual();
    timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
      setState(() {
        horaActual = obtenerHoraActual();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  bool isFullScreen = false;

  void _camara0Controller() {
    String url = '';
    _vlcPlayerController = VlcPlayerController.network(
      url,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara6Controller() {
    String? url = dotenv.env['CAMARA_6'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara1Controller() {
    String? url = dotenv.env['CAMARA_1'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara2Controller3() {
    String? url = dotenv.env['CAMARA_2'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara3Controller() {
    String? url = dotenv.env['CAMARA_3'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara4Controller() {
    String? url = dotenv.env['CAMARA_4'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara5Controller() {
    String? url = dotenv.env['CAMARA_5'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara7Controller() {
    String? url = dotenv.env['CAMARA_7'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _camara8Controller() {
    String? url = dotenv.env['CAMARA_8'];
    _vlcPlayerController = VlcPlayerController.network(
      url!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  void _enterFullScreen() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Video en pantalla completa'),
            ),
            body: Center(
              child: VlcPlayer(
                controller: _vlcPlayerController,
                aspectRatio:
                    16 / 9, // Ajusta esto según tu relación de aspecto deseada
                placeholder: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _exitFullScreen() {
    Navigator.of(context).pop(); // Cierra la pantalla completa
  }

  String obtenerHoraActual() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.H().format(now);
    return formattedTime;
  }

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

                String nombreB1 = map['nombreB1'];

                Widget dynamicText;
                Widget dynamicText2;
                Widget dynamicText3;

                dynamicText2 = const Text(
                  '',
                  style: TextStyle(fontSize: 18),
                );
                dynamicText3 = const Text(
                  '',
                  style: TextStyle(fontSize: 18),
                );

                switch (horaActual) {
                  case '06':
                    String act1 = map['act1'];
                    String act1Loca = map['act1Loca'];
                    String act1Hora = map['act1Hora'];

                    dynamicText = Text(
                      'Actividad: $act1',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $act1Loca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $act1Hora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara1Controller();
                    break;
                  case '07':
                    String act = map['act2'];
                    String actLoca = map['act2Loca'];
                    String actHora = map['act2Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara3Controller();
                    break;

                  case '08':
                    String act = map['act3'];
                    String actLoca = map['act3Loca'];
                    String actHora = map['act3Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara4Controller();
                    break;

                  case '09':
                    String act = map['act4'];
                    String actLoca = map['act4Loca'];
                    String actHora = map['act4Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara5Controller();
                    break;

                  case '10':
                    String act = map['act5'];
                    String actLoca = map['act5Loca'];
                    String actHora = map['act5Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara7Controller();
                    break;

                  case '11':
                    String act = map['act6'];
                    String actLoca = map['act6Loca'];
                    String actHora = map['act6Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara8Controller();
                    break;

                  case '12':
                    String act = map['act7'];
                    String actLoca = map['act7Loca'];
                    String actHora = map['act7Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara3Controller();
                    break;

                  case '13':
                    String act = map['act8'];
                    String actLoca = map['act8Loca'];
                    String actHora = map['act8Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara6Controller();
                    break;

                  case '14':
                    String act = map['act9'];
                    String actLoca = map['act9Loca'];
                    String actHora = map['act9Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara8Controller();
                    break;

                  case '15':
                    String act = map['act10'];
                    String actLoca = map['act10Loca'];
                    String actHora = map['act10Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara3Controller();
                    break;

                  case '16':
                    String act = map['act10'];
                    String actLoca = map['act10Loca'];
                    String actHora = map['act10Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara4Controller();
                    break;

                  case '17':
                    String act = map['act11'];
                    String actLoca = map['act11Loca'];
                    String actHora = map['act11Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara5Controller();
                    break;

                  case '18':
                    String act = map['act12'];
                    String actLoca = map['act12Loca'];
                    String actHora = map['act12Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horario: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    _camara7Controller();
                    break;

                  case '19':
                    String act = map['act13'];
                    String actLoca = map['act13Loca'];
                    String actHora = map['act13Hora'];

                    dynamicText = Text(
                      'Actividad: $act',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );
                    dynamicText2 = Text(
                      'Localizacion: $actLoca',
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
                    );
                    dynamicText3 = Text(
                      'Horarioo: $actHora',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Regular'),
                    );

                    _camara2Controller3();
                    break;

                  default:
                    dynamicText = const Text(
                      'Fuera del Horario!',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Regular',
                          color: Colors.red),
                    );

                    dynamicText2 = const Text(
                      '',
                      style: TextStyle(fontSize: 18),
                    );
                    dynamicText3 = const Text(
                      '',
                      style: TextStyle(fontSize: 18),
                    );
                    _camara0Controller();
                }

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
                        'assets/img/monitoreo.png',
                        fit: BoxFit.cover,
                      ),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VlcPlayer(
                          controller: _vlcPlayerController,
                          placeholder: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              isFullScreen
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isFullScreen = !isFullScreen;
                                if (isFullScreen) {
                                  _enterFullScreen();
                                } else {
                                  _exitFullScreen();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              dynamicText2,
                              const SizedBox(height: 10),
                              Text(
                                nombreB1,
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'Titulos'),
                              ),
                              const SizedBox(height: 10),
                              dynamicText,
                              const SizedBox(height: 10),
                              dynamicText3,
                              const SizedBox(height: 50),
                              Image.asset(
                                'assets/img/infomonitoreo.png',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
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
