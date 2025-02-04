import 'package:myapp/repositories%20/planeta_repository.dart';

import '../models/planeta.dart';

class PlanetaService {
  final PlanetaRepository _repository = PlanetaRepository();

  Future<List<Planeta>> listarPlanetas() async {
    return await _repository.listarPlanetas();
  }

  Future<void> adicionarPlaneta(String nome, double tamanho, double distancia, String? apelido) async {
    final novoPlaneta = Planeta(
      id: 0, // O id será gerado pelo repositório
      nome: nome,
      tamanho: tamanho,
      distanciaDoSol: distancia,
      apelido: apelido,
    );
    await _repository.adicionarPlaneta(novoPlaneta);
  }

  Future<void> atualizarPlaneta(Planeta planeta) async {
    await _repository.atualizarPlaneta(planeta);
  }

  Future<void> removerPlaneta(int id) async {
    await _repository.removerPlaneta(id);
  }
}