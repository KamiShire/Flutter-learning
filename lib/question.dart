
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // final indica che il valore della variabile
  // non verrà più cambiato dopo l'inizializzazione
  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
     return Container(
       width: double.infinity,
       // costruttore speciale: costruttore dart che permette di definire
         // diversi costruttori per la stessa classe
       margin: EdgeInsets.only(top: 20),
       child: Text(
         _questionText,
         style: TextStyle(fontSize: 28),
         textAlign: TextAlign.center,)
     );
  }
}