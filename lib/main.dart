import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Miscolores favoritos', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 60, height: 60, color: Colors.black),
                const SizedBox(width: 10),
                Container(width: 60, height: 60, color: Colors.blue),
                const SizedBox(width: 10),git status
                Container(width: 60, height: 60, color: Colors.red),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Hecho por Pablo Santanaria Borja',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  ),
);
 
 