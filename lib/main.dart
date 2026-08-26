import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentFormPage(),
    );
  }
}

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    super.dispose();
  }

  void guardar() {
    final nombre = nombreController.text.trim();
    final apellido = apellidoController.text.trim();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Guardado: $nombre $apellido')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'MI PRIMERA APP',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Text(
                    'FORMULARIO DE ALUMNO',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      hintText: 'NOMBRE',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: apellidoController,
                    decoration: InputDecoration(
                      hintText: 'APELLIDO',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: guardar,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'GUARDAR',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconButton(Icons.home),
                      const SizedBox(width: 30),
                      iconButton(Icons.person),
                      const SizedBox(width: 30),
                      iconButton(Icons.settings),
                    ],
                  ),
                  const SizedBox(height: 45),
                  const Text(
                    'ESTA ES MI IMAGEN',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 280,
                    height: 220,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/mi_imagen.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconButton(IconData icon) {
    return SizedBox(
      width: 75,
      height: 75,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: const BorderSide(width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Icon(icon, size: 32, color: Colors.black),
      ),
    );
  }
}
