import 'package:babyhands2/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yMMMMEEEEd', 'ES').format(now);
String formattedDate2 = DateFormat('yMMMMEEEEd', 'es').format(now);

class Actividades extends StatelessWidget {
  const Actividades({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondo.jpeg'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.06, 10, 0),
            child: Column(children: <Widget>[
              Text(
                formattedDate2,
                style: const TextStyle(fontSize: 25, fontFamily: 'Titulos'),
              ),
              act("assets/img/horarios.png")
            ]),
          ),
        ),
      ),
    );
  }
}
