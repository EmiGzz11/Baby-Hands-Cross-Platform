import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../reusable_widgets/reusable_widget.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _name2TextController = TextEditingController();
  final TextEditingController _apeTextController = TextEditingController();
  final TextEditingController _ape2TextController = TextEditingController();
  final TextEditingController _nombreB1TextController = TextEditingController();
  final TextEditingController _calleTextController = TextEditingController();
  final TextEditingController _coloniaTextController = TextEditingController();
  final TextEditingController _codigoPostalTextController =
      TextEditingController();
  final TextEditingController _numeroTextController = TextEditingController();
  final TextEditingController _telTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _name2TextController.dispose();
    _apeTextController.dispose();
    _ape2TextController.dispose();
    _nombreB1TextController.dispose();
    _calleTextController.dispose();
    _coloniaTextController.dispose();
    _codigoPostalTextController.dispose();
    _numeroTextController.dispose();

    super.dispose();
  }

  Future<void> _createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim(),
      );

      String uid = userCredential.user!.uid;
      String email = userCredential.user!.email ?? '';
      String password = _passwordTextController.text.trim();
      String name = _nameTextController.text.trim();
      String name2 = _name2TextController.text.trim();
      String ape = _apeTextController.text.trim();
      String ape2 = _ape2TextController.text.trim();
      String nombreB1 = _nombreB1TextController.text.trim();
      String calle = _calleTextController.text.trim();
      String colonia = _coloniaTextController.text.trim();
      String cp = _codigoPostalTextController.text.trim();
      String num = _numeroTextController.text.trim();
      String tel = _telTextController.text.trim();

      String admin = 'false';
      String act1 = 'Recibir a los niños';
      String act10 = 'Siesta';
      String act10Hora = '15-17';
      String act10Loca = 'Dormitorios';
      String act11 = 'Actividades';
      String act11Hora = '17-18';
      String act11Loca = 'Estimulacion temprana';
      String act12 = 'Actividades';
      String act12Hora = '18-19';
      String act12Loca = 'Estimulacion Temprana';
      String act13 = 'Salida a los ninos';
      String act13Hora = '19-20';
      String act13Loca = 'Salida';
      String act1Hora = '6-7';
      String act1Loca = 'Entrada';
      String act2 = 'Desayuno';
      String act2Hora = '7-8';
      String act2Loca = 'Comedor';
      String act3 = 'Actividades';
      String act3Hora = '8-9';
      String act3Loca = 'Area de Estimulacion Temprana';
      String act4 = 'Siesta';
      String act4Hora = '9-10';
      String act4Loca = 'Dormitorios';
      String act5 = 'Lectura de Cuentos';
      String act5Hora = '10-11';
      String act5Loca = 'Ludoteca';
      String act6 = 'Comida de media manana';
      String act6Hora = '11-12';
      String act6Loca = 'Comedor';
      String act7 = 'Actividades';
      String act7Hora = '12-13';
      String act7Loca = 'Ludoteca';
      String act8 = 'Actividades';
      String act8Hora = '13-14';
      String act8Loca = 'Areas Verdes';
      String act9 = 'Comida de media tarde';
      String act9Hora = '14-15';
      String act9Loca = 'Comedor';
      String pagoEnero = 'En espera';
      String pagoFebrero = 'En espera';
      String pagoMarzo = 'En espera';
      String pagoAbril = 'En espera';
      String pagoMayo = 'En espera';
      String pagoJunio = 'En espera';
      String pagoJulio = 'En espera';
      String pagoAgosto = 'En espera';
      String pagoSeptiembre = 'En espera';
      String pagoOctubre = 'En espera';
      String pagoNoviembre = 'En espera';
      String pagoDiciembre = 'En espera';

      _saveUserToDatabase(
          uid,
          email,
          password,
          name,
          name2,
          ape,
          ape2,
          nombreB1,
          calle,
          colonia,
          cp,
          num,
          tel,
          admin,
          act1,
          act10,
          act10Hora,
          act10Loca,
          act11,
          act11Hora,
          act11Loca,
          act12,
          act12Hora,
          act12Loca,
          act13,
          act13Hora,
          act13Loca,
          act1Hora,
          act1Loca,
          act2,
          act2Hora,
          act2Loca,
          act3,
          act3Hora,
          act3Loca,
          act4,
          act4Hora,
          act4Loca,
          act5,
          act5Hora,
          act5Loca,
          act6,
          act6Loca,
          act6Hora,
          act7,
          act7Hora,
          act7Loca,
          act8,
          act8Loca,
          act8Hora,
          act9,
          act9Hora,
          act9Loca,
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
          pagoDiciembre);

      _auth.signOut();

      // Resto del código después de registrar el usuario
    } catch (e) {
      // Manejo de errores
    }
  }

  void _saveUserToDatabase(
      String uid,
      String email,
      String password,
      String name,
      String name2,
      String ape,
      String ape2,
      String nombreB1,
      String calle,
      String colonia,
      String cp,
      String num,
      String tel,
      String admin,
      String act1,
      String act10,
      String act10Hora,
      String act10Loca,
      String act11,
      String act11Hora,
      String act11Loca,
      String act12,
      String act12Hora,
      String act12Loca,
      String act13,
      String act13Hora,
      String act13Loca,
      String act1Hora,
      String act1Loca,
      String act2,
      String act2Hora,
      String act2Loca,
      String act3,
      String act3Hora,
      String act3Loca,
      String act4,
      String act4Hora,
      String act4Loca,
      String act5,
      String act5Hora,
      String act5Loca,
      String act6,
      String act6Loca,
      String act6Hora,
      String act7,
      String act7Hora,
      String act7Loca,
      String act8,
      String act8Loca,
      String act8Hora,
      String act9,
      String act9Hora,
      String act9Loca,
      String pagoEnero,
      String pagoFebrero,
      String pagoMarzo,
      String pagoAbril,
      String pagoMayo,
      String pagoJunio,
      String pagoJulio,
      String pagoAgosto,
      String pagoSeptiembre,
      pagoOctubre,
      pagoNoviembre,
      pagoDiciembre) {
    DatabaseReference userNode =
        _databaseReference.child('Usuarios').child(uid);

    userNode.set({
      'email': email,
      'password': password,
      'uid': uid,
      'primerNombre': name,
      'segundoNombre': name2,
      'primerApellido': ape,
      'segundoApellido': ape2,
      'telefono': tel,
      'nombreB1': nombreB1,
      'calle': calle,
      'colonia': colonia,
      'numero': num,
      'codigoPostal': cp,
      'act1': act1,
      'act10': act10,
      'act10Hora': act10Hora,
      'act10Loca': act10Loca,
      'act11': act11,
      'act11Hora': act11Hora,
      'act11Loca': act11Loca,
      'act12': act12,
      'act12Hora': act12Hora,
      'act12Loca': act12Loca,
      'act13': act13,
      'act13Hora': act13Hora,
      'act13Loca': act13Loca,
      'act1Hora': act1Hora,
      'act1Loca': act1Loca,
      'act2': act2,
      'act2Hora': act2Hora,
      'act2Loca': act2Loca,
      'act3': act3,
      'act3Hora': act3Hora,
      'act3Loca': act3Loca,
      'act4': act4,
      'act4Hora': act4Hora,
      'act4Loca': act4Loca,
      'act5': act5,
      'act5Hora': act5Hora,
      'act5Loca': act5Loca,
      'act6': act6,
      'act6Hora': act6Hora,
      'act6Loca': act6Loca,
      'act7': act7,
      'act7Hora': act7Hora,
      'act7Loca': act7Loca,
      'act8': act8,
      'act8Hora': act8Hora,
      'act8Loca': act9Loca,
      'act9': act9,
      'act9Hora': act9Hora,
      'act9Loca': act9Loca,
      'admin': false,
      'pagoEnero': pagoEnero,
      'pagoFebrero': pagoFebrero,
      'pagoMarzo': pagoMarzo,
      'pagoAbril': pagoAbril,
      'pagoMayo': pagoMayo,
      'pagoJunio': pagoJunio,
      'pagoJulio': pagoJulio,
      'pagoAgosto': pagoAgosto,
      'pagoSeptiembre': pagoSeptiembre,
      'pagoOctubre': pagoOctubre,
      'pagoNoviembre': pagoNoviembre,
      'pagoDiciembre': pagoDiciembre,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fondo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                10, MediaQuery.of(context).size.height * 0.001, 10, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/img/altausers.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu Primer nombre", Icons.person,
                    false, _nameTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu Segundo nombre", Icons.person,
                    false, _name2TextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu primer apellido", Icons.person,
                    false, _apeTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu segundo apellido", Icons.person,
                    false, _ape2TextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField(
                    "Ingresa el nombre completo de tu hij@",
                    Icons.bedroom_baby_outlined,
                    false,
                    _nombreB1TextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu numero de telefono", Icons.phone,
                    false, _telTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu calle", Icons.house, false,
                    _calleTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu colonia", Icons.location_city,
                    false, _coloniaTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu numero de casa", Icons.numbers,
                    false, _numeroTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu codigo postal", Icons.numbers,
                    false, _codigoPostalTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu email", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 10,
                ),
                registroTextField("Ingresa tu contraseña", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 10,
                ),
                signInSignUpButton(
                  context,
                  false,
                  () {
                    _createUserWithEmailAndPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
