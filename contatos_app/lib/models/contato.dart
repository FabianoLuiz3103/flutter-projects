class Contato {
  String? _nome;
  String? _email;
  bool? _favorito;
  int? _numeroFavorito;
  String? _fotoPerfil;

  Contato(String nome, String email, bool favorito, int numeroFavorito, String fotoPerfil) {
    _nome = nome;
    _email = email;
    _favorito = favorito;
    _numeroFavorito = numeroFavorito;
    _fotoPerfil = fotoPerfil;
  }

  set setFavorito(bool favorito) {
    _favorito = favorito;
  }

  set setNumeroFavorito(int numeroFavorito) {
    _numeroFavorito = _numeroFavorito;
  }

  String? get nome => _nome;
  String? get email => _email;
  bool? get favorito => _favorito;
  int? get numeroFavorito => _numeroFavorito;
  String? get fotoPerfil => _fotoPerfil;
}
