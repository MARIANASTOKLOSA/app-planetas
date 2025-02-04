import 'package:flutter/material.dart';
import 'package:myapp/controllers%20/planeta_controller.dart';

class PlanetaForm extends StatefulWidget {
  final PlanetaController controller;

  const PlanetaForm({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _PlanetaFormState createState() => _PlanetaFormState();
}

class _PlanetaFormState extends State<PlanetaForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _distanciaController = TextEditingController();
  final _apelidoController = TextEditingController();

  void _salvarPlaneta() {
    if (_formKey.currentState!.validate()) {
      widget.controller.adicionarPlaneta(
        _nomeController.text,
        double.parse(_tamanhoController.text),
        double.parse(_distanciaController.text),
        _apelidoController.text.isEmpty ? null : _apelidoController.text,
      );
      Navigator.pop(context); // Volta para a tela anterior após salvar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Planeta")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome"),
                validator: (value) => value!.isEmpty ? "Informe o nome" : null,
              ),
              TextFormField(
                controller: _tamanhoController,
                decoration: InputDecoration(labelText: "Tamanho (em km)"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Informe o tamanho" : null,
              ),
              TextFormField(
                controller: _distanciaController,
                decoration: InputDecoration(labelText: "Distância (em km)"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Informe a distância" : null,
              ),
              TextFormField(
                controller: _apelidoController,
                decoration: InputDecoration(labelText: "Apelido (opcional)"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarPlaneta,
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}