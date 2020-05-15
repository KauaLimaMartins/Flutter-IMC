import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contador de pessoas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Color(0xff7159c1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = '';

  void _resetFields() {
    setState(() {
      this.weightController.text = '';
      this.heightController.text = '';

      this._infoText = '';
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        this._infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        this._infoText = 'Peso Ideal (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        this._infoText =
            'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        this._infoText = 'Obesidade grau I (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        this._infoText = 'Obesidade grau II (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40.0) {
        this._infoText = 'Obesidade grau III (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Color(0xff7159c1),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: this._resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              child: Icon(
                Icons.person,
                color: Color(0xff7159c1),
                size: 120.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                controller: this.weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7159c1),
                  fontSize: 25.0,
                ),
                cursorColor: Color(0xff7159c1),
                decoration: InputDecoration(
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(
                    color: Color(0xff7159c1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7159c1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7159c1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                controller: this.heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7159c1),
                  fontSize: 25.0,
                ),
                cursorColor: Color(0xff7159c1),
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Color(0xff7159c1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7159c1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7159c1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: this._calculate,
                  color: Color(0xff7159c1),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7159c1),
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
