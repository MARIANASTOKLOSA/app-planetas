import 'package:flutter/material.dart';
import 'package:myapp/models/planeta.dart';
import 'package:myapp/views%20/planeta_detail.dart' show PlanetaDetail;

class PlanetaCard extends StatelessWidget {
  final Planeta planeta;

  const PlanetaCard({super.key, required this.planeta});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(planeta.nome),
        subtitle: Text(
          'Tamanho: ${planeta.tamanho}, Distância do Sol: ${planeta.distanciaDoSol}',
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanetaDetail(planeta: planeta),
            ),
          );
        },
      ),
    );
  }
}
