import 'package:flutter/material.dart';
import 'package:myapp/models/planeta.dart';

class PlanetaDetail extends StatelessWidget {
  final Planeta planeta;

  const PlanetaDetail({super.key, required this.planeta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(planeta.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tamanho: ${planeta.tamanho}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              'Distância do Sol: ${planeta.distanciaDoSol}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            if (planeta.apelido != null)
              Text(
                'Apelido: ${planeta.apelido}',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}