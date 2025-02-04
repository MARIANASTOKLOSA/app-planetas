class Planeta {
  final int id;
  final String nome;
  final double tamanho;
  final double distanciaDoSol;
  final String? apelido;

  Planeta({
    required this.id,
    required this.nome,
    required this.tamanho,
    required this.distanciaDoSol,
    this.apelido,
  });
}