import 'package:flutter/material.dart';

class Datos2 extends StatefulWidget {
  const Datos2({super.key});

  @override
  State<Datos2> createState() => _Datos2State();
}

class _Datos2State extends State<Datos2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Modificar'),
          content: TextField(),
          actions: [],
        );
      },
    );
  }
}
