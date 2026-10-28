import 'package:flutter/material.dart';

void main() {
  runApp(const MiCalculadora());
}

class MiCalculadora extends StatelessWidget {
  const MiCalculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String pantalla = "";
  double numero1 = 0;
  double numero2 = 0;
  String operador = "";

  // C = Limpiar todo
  void limpiarTodo() {
    setState(() {
      pantalla = "";
      numero1 = 0;
      numero2 = 0;
      operador = "";
    });
  }

  // CE = Limpiar entrada actual
  void limpiarEntrada() {
    setState(() {
      pantalla = "";
    });
  }

  // ⌫ = Borrar último carácter
  void borrarUltimoCaracter() {
    setState(() {
      if (pantalla.isNotEmpty) {
        pantalla = pantalla.substring(0, pantalla.length - 1);
      }
    });
  }

  void presionarBoton(String valor) {
    setState(() {
      if (valor == "C") {
        limpiarTodo();
      } else if (valor == "CE") {
        limpiarEntrada();
      } else if (valor == "⌫") {
        borrarUltimoCaracter();
      } else if (valor == "+" || valor == "-" || valor == "*" || valor == "/") {
        if (pantalla.isNotEmpty) {
          numero1 = double.parse(pantalla);
          operador = valor;
          pantalla = "";
        }
      } else if (valor == "=") {
        if (pantalla.isNotEmpty) {
          numero2 = double.parse(pantalla);

          double resultado = 0;

          switch (operador) {
            case "+":
              resultado = numero1 + numero2;
              break;

            case "-":
              resultado = numero1 - numero2;
              break;

            case "*":
              resultado = numero1 * numero2;
              break;

            case "/":
              if (numero2 != 0) {
                resultado = numero1 / numero2;
              } else {
                pantalla = "Error no se puede dividir entre cero";
                return;
              }
              break;
          }

          pantalla = resultado.toString();
        }
      } else {
        pantalla += valor;
      }
    });
  }

  Widget boton(String texto, {Color color = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: 70,
          child: ElevatedButton(
            onPressed: () => presionarBoton(texto),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Flutter")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black87,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                pantalla.isEmpty ? "0" : pantalla,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // FILA 1
          Row(
            children: [
              boton("C", color: Colors.red),
              boton("CE", color: Colors.deepOrange),
              boton("⌫", color: Colors.orange),
              boton("/", color: Colors.grey),
            ],
          ),

          // FILA 2
          Row(
            children: [
              boton("7"),
              boton("8"),
              boton("9"),
              boton("*", color: Colors.grey),
            ],
          ),

          // FILA 3
          Row(
            children: [
              boton("4"),
              boton("5"),
              boton("6"),
              boton("-", color: Colors.grey),
            ],
          ),

          // FILA 4
          Row(
            children: [
              boton("1"),
              boton("2"),
              boton("3"),
              boton("+", color: Colors.grey),
            ],
          ),

          // FILA 5
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () => presionarBoton("0"),
                      child: const Text("0", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
              ),
              boton("."),
              boton("=", color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
