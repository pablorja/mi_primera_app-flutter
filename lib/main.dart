import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      theme: ThemeData(
        // Este es el tema de la aplicación.
        //
        // PRUÉBALO: Ejecuta la aplicación con "flutter run". Verás que tiene
        // una barra de herramientas morada. Luego, sin cerrar la aplicación,
        // cambia seedColor en el colorScheme de abajo por Colors.green
        // y ejecuta una "recarga en caliente" (guarda los cambios o pulsa el
        // botón de recarga en caliente de un IDE compatible con Flutter, o
        // pulsa "r" si iniciaste la aplicación desde la línea de comandos).
        //
        // Observa que el contador no volvió a cero: el estado de la aplicación
        // se conserva durante la recarga. Para restablecer el estado, usa en su
        // lugar un reinicio completo.
        //
        // Esto también sirve para el código, no solo para los valores: la
        // mayoría de los cambios se pueden probar con una recarga en caliente.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 30, 40, 182),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo pagina principal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget es la página principal de la aplicación. Tiene estado, lo que
  // significa que posee un objeto State (definido abajo) con campos que
  // determinan su apariencia.

  // Esta clase contiene la configuración del estado. Guarda los valores (en
  // este caso, el título) que proporciona el widget padre (aquí, el widget App)
  // y que usa el método build de State. Los campos de una subclase de Widget
  // siempre se marcan como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta llamada a setState indica al framework de Flutter que algo cambió
      // en este estado. Esto hace que vuelva a ejecutar el método build de abajo
      // para mostrar los valores actualizados. Si cambiáramos _counter sin
      // llamar a setState(), build no se ejecutaría de nuevo y parecería que
      // no ha ocurrido nada.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método se vuelve a ejecutar cada vez que se llama a setState, como
    // ocurre, por ejemplo, en el método _incrementCounter de arriba.
    //
    // El framework de Flutter está optimizado para ejecutar rápidamente los
    // métodos build. Así, basta con reconstruir lo que necesita actualizarse,
    // en lugar de tener que cambiar individualmente las instancias de los widgets.
    return Scaffold(
      appBar: AppBar(
        // PRUÉBALO: Cambia este color por uno específico (¿quizá
        // Colors.amber?) y activa una recarga en caliente para ver cómo cambia
        // el color de AppBar mientras los demás colores permanecen iguales.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aquí tomamos el valor del objeto MyHomePage creado por el método
        // App.build y lo usamos para establecer el título de la barra superior.
        title: Text(widget.title),
      ),
      body: Center(
        // Center es un widget de diseño que recibe un único hijo y lo coloca
        // en el centro del widget padre.
        child: Column(
          // Column también es un widget de diseño. Recibe una lista de hijos y
          // los organiza verticalmente. De forma predeterminada, ajusta su
          // ancho al de sus hijos e intenta ocupar la misma altura que su padre.
          //
          // Column tiene varias propiedades para controlar su tamaño y la
          // posición de sus hijos. Aquí usamos mainAxisAlignment para
          // centrarlos verticalmente. El eje principal es vertical porque los
          // elementos de Column se organizan de arriba abajo (el eje transversal
          // sería horizontal).
          //
          // PRUÉBALO: Activa "debug painting" (elige la acción "Toggle Debug
          // Paint" en el IDE o pulsa "p" en la consola) para ver el contorno de
          // cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
