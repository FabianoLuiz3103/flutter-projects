class Conquista {
  String image = "";
  String titulo = "";
  String descricao = "";
  int pontos = 0;

  Conquista({ required this.image, required this.titulo, required this.descricao, required this.pontos});
}
 Future<List<Conquista>> loadConquistas() async {
  
  return [Conquista(image: "images/primeiro_passo.png", titulo: "Primeiro passo", descricao: "descricao da conquista", pontos: 10),
  Conquista(image: "images/iniciado.png", titulo: "Iniciado", descricao: "descricao da conquista", pontos: 30),
  Conquista(image: "images/aprendiz_atento.png", titulo: "Aprendiz atento", descricao: "descricao da conquista", pontos: 50),
  Conquista(image: "images/concentrado.png", titulo: "Concentrado", descricao: "descricao da conquista", pontos: 70),
  Conquista(image: "images/persistente.png", titulo: "Persistente", descricao: "descricao da conquista", pontos: 90),
  Conquista(image: "images/conhecedor.png", titulo: "Conhecedor", descricao: "descricao da conquista", pontos: 120),
  Conquista(image: "images/desbravdor.png", titulo: "Desbravador", descricao: "descricao da conquista", pontos: 150),
  Conquista(image: "images/expert.png", titulo: "Expert", descricao: "descricao da conquista", pontos: 180),
  Conquista(image: "images/mestre.png", titulo: "Mestre", descricao: "descricao da conquista", pontos: 230),
  Conquista(image: "images/lenda.png", titulo: "Lenda", descricao: "descricao da conquista", pontos: 280)];
}