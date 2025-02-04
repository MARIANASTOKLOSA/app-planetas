import 'package:flutter/material.dart';
import 'package:myapp/controllers%20/planeta_controller.dart';
import 'package:myapp/models/planeta.dart';
import 'package:myapp/widgets%20/planeta_card.dart';
import 'planeta_form.dart';
import '../services/planeta_service.dart';

class PlanetasList extends StatefulWidget {
  const PlanetasList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlanetasListState createState() => _PlanetasListState();
}

class _PlanetasListState extends State<PlanetasList> {
  final PlanetaController _controller = PlanetaController(PlanetaService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Planetas')),
      body: FutureBuilder<List<Planeta>>(
        future: _controller.listarPlanetas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar planetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum planeta encontrado'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final planeta = snapshot.data![index];
                return PlanetaCard(planeta: planeta); // Usando PlanetaCard
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlanetaForm(controller: _controller)),
          );
          setState(() {}); // Ao voltar da tela de cadastro, atualiza a lista
        },
        child: Icon(Icons.add),
      ),
    );
  }
}