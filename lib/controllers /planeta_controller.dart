import '../services/planeta_service.dart';
import '../models/planeta.dart';

class PlanetaController {
  final PlanetaService _service;

  PlanetaController(this._service); // Injeta o serviço via construtor

  Future<List<Planeta>> listarPlanetas() async {
    return await _service.listarPlanetas();
  }

  Future<void> adicionarPlaneta(String nome, double tamanho, double distancia, String? apelido) async {
    await _service.adicionarPlaneta(nome, tamanho, distancia, apelido);
  }

  Future<void> atualizarPlaneta(Planeta planeta) async {
    await _service.atualizarPlaneta(planeta);
  }

  Future<void> removerPlaneta(int id) async {
    await _service.removerPlaneta(id);
  }
}