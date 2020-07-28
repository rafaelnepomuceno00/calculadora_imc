import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String info = 'Informe os dados!';
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _resetarCampos() {
    pesoController.clear();
    alturaController.clear();
    info = 'Informe os dados!';
    _formkey = GlobalKey<FormState>();
  }

  void _calcular() {
    setState(() {
      double imc;
      double a = double.parse(alturaController.text) / 100;
      double p = double.parse(pesoController.text);

      imc = p / (a * a);

      if (imc < 18.5) {
        info = '${imc.toStringAsPrecision(2)} Abaixo do Peso';
      } else if (imc >= 18.5) {
        info = ('${imc.toStringAsPrecision(2)}  Peso normal');
      } else if (imc < 24.9) {
        info = ('${imc.toStringAsPrecision(2)}  Peso normal');
      } else if (imc >= 25.0) {
        info = '${imc.toStringAsPrecision(2)}  Sobrepeso';
      } else if (imc < 29.9) {
        info = '${imc.toStringAsPrecision(2)}  Sobrepeso';
      } else if (imc >= 30.0) {
        info = '${imc.toStringAsPrecision(2)}  Obsidade Grau I';
      } else if (imc < 34.9)
        info = '${imc.toStringAsPrecision(2)}  Obsidade Grau I';
      else if (imc >= 35.0) {
        info = '${imc.toStringAsPrecision(2)}  Obsidade Grau II';
      } else if (imc < 39.9) {
        info = '${imc.toStringAsPrecision(2)}  Obsidade Grau II';
      }
      if (imc > 40) {
        info = '${imc.toStringAsPrecision(2)}  Osidade Grau III';
      }
      print(imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetarCampos,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                        Icons.person_outline, color: Colors.amber, size: 120.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Peso(Kg):',
                          labelStyle: TextStyle(color: Colors.amber)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      controller: pesoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira seu peso!';
                        }
                      },

                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura(Cm):',
                          labelStyle: TextStyle(color: Colors.amber)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      controller: alturaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira sua altua!';
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              _calcular();
                            }
                          },
                          child: Text('Cacular',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Text('$info',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber, fontSize: 25.0))
                  ],
                ),
            )
        ));
  }
}
