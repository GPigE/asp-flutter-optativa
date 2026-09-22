import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pantalla 2'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomButton(
              text: 'Boton 1',
              textColor: Colors.white,
              fontSize: 18,
              height: 55,
              readonly: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Presionaste Boton 1')),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Boton 2',
              textColor: Colors.white,
              fontSize: 18,
              height: 55,
              readonly: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Presionaste Boton 2')),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Boton 3',
              textColor: Colors.white,
              fontSize: 18,
              height: 55,
              readonly: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Presionaste Boton 3')),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Boton 4',
              textColor: Colors.white,
              fontSize: 18,
              height: 55,
              readonly: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Presionaste Boton 4')),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Boton 5',
              textColor: Colors.white,
              fontSize: 18,
              height: 55,
              readonly: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Presionaste Boton 5')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
