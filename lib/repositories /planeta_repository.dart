import '../models/planeta.dart';

class PlanetaRepository {
  final List<Planeta> _planetas = [];
  int _nextId = 1; // ID gerado automaticamente

  Future<List<Planeta>> listarPlanetas() async {
    return List.unmodifiable(_planetas); // Retorna uma lista imutável
  }

  Future<void> adicionarPlaneta(Planeta planeta) async {
    _planetas.add(Planeta(
      id: _nextId++, // Gera ID único automaticamente
      nome: planeta.nome,
      tamanho: planeta.tamanho,
      distanciaDoSol: planeta.distanciaDoSol,
      apelido: planeta.apelido,
    ));
  }

  Future<void> atualizarPlaneta(Planeta planeta) async {
    final index = _planetas.indexWhere((p) => p.id == planeta.id);
    if (index != -1) {
      _planetas[index] = planeta;
    }
  }

  Future<void> removerPlaneta(int id) async {
    _planetas.removeWhere((p) => p.id == id);
  }
}