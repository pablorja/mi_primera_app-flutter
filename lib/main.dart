import 'package:flutter/material.dart';
 
void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pablo Santanaria Borja', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 60, height: 60, color: const Color.fromARGB(0, 0, 0, 0)),
                const SizedBox(width: 10),
                Container(width: 60, height: 60, color: const Color.fromARGB(255, 58, 181, 15)),
                const SizedBox(width: 10),
                Container(width: 60, height: 60, color: const Color.fromARGB(255, 197, 200, 8)),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);
 
 