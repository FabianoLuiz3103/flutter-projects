import 'package:contatos_app/models/Contato.dart';
int favoritarContato(List<Contato> contatos, int index, int contador) {
  if (contatos[index].numeroFavorito == 1 || contatos[index].favorito!) {
    contatos[index].setFavorito = false;
    contatos[index].setNumeroFavorito = 0;
    contador--;
  } else {
    contatos[index].setFavorito = true;
    contatos[index].setNumeroFavorito = 1;
    contador++;
  }
  return contador;
}
