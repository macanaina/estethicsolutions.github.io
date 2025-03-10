import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Esthetic Solutions',
      home: ConstructionPage(),
      debugShowCheckedModeBanner: false, //Ocultar el banner de debug
    );
  }
}

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esthetic Solutions',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sitio web en construcción. ¡Pronto estaremos en línea!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 40),
            // Image.asset(
            //   'assets/construction.png', // Reemplaza con tu imagen
            //   width: 200,
            // ),
          ],
        ),
      ),
    );
  }
}